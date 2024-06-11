import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:on_line_hit_color/screens/settings_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/levels_data.dart';
import '../premium_status.dart';
import '../widgets/dialog_premium.dart';
import 'game_screen.dart';

class Levels extends StatefulWidget {
  const Levels({super.key});

  @override
  _LevelsState createState() => _LevelsState();
}

class _LevelsState extends State<Levels> {
  List<int> completedLevels = [];

  @override
  void initState() {
    super.initState();
    _loadCompletedLevels();
  }

  Future<void> _loadCompletedLevels() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      completedLevels = (prefs.getStringList('completedLevels') ?? [])
          .map((e) => int.parse(e))
          .toList();
    });
  }

  void _onLevelCompleted(int level) {
    setState(() {
      if (!completedLevels.contains(level)) {
        completedLevels.add(level);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isPremium = PremiumStatus.of(context).isPremium;

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/background2.png',
              fit: BoxFit.fill,
            ),
          ),
          Column(
            children: [
              AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: Colors.transparent,
                elevation: 0,
                centerTitle: true,
                title: Text(
                  'Select a level',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.karantina(
                    fontSize: 32.r,
                    fontWeight: FontWeight.w700,
                    height: 0.9.h,
                    color: Colors.yellow,
                  ),
                ),
                actions: [
                  IconButton(
                    icon: Image.asset(
                      'assets/setting_icon.png',
                      width: 35.w,
                      height: 35.h,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SettingScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
              Divider(
                color: Colors.yellowAccent.shade700,
                height: 1.h,
                thickness: 1.h,
              ),
              Gap(30.h),
              Expanded(
                child: GridView.builder(
                  padding:
                      EdgeInsets.symmetric(horizontal: 28.w, vertical: 7.h),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    childAspectRatio: 1,
                    crossAxisSpacing: 15.w,
                    mainAxisSpacing: 15.h,
                  ),
                  itemCount: levels.length,
                  itemBuilder: (BuildContext context, int index) {
                    bool isLevelLocked = index >= 30 && !isPremium;
                    bool isLevelCompleted = completedLevels.contains(index);
                    return GestureDetector(
                      onTap: () {
                        if (isLevelLocked) {
                          showPremiumDialog(context);
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Game(
                                level: index,
                                onLevelCompleted: _onLevelCompleted,
                              ),
                            ),
                          );
                        }
                      },
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            width: 64.w,
                            height: 64.h,
                            decoration: BoxDecoration(
                              color: isLevelCompleted
                                  ? Colors.yellow
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(4.r),
                              border: Border.all(
                                color: Colors.white,
                                width: 1.w,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                '${index + 1}',
                                style: GoogleFonts.karantina(
                                  color: Colors.black,
                                  fontSize: 48.r,
                                  height: 48.58 / 48.h,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                          if (isLevelCompleted && !isLevelLocked)
                            Positioned(
                              top: -7.h,
                              right: -4.w,
                              child: Container(
                                width: 22.w,
                                height: 22.h,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white,
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.check,
                                    color: Colors.black,
                                    size: 16.w,
                                  ),
                                ),
                              ),
                            ),
                          if (isLevelLocked)
                            Positioned.fill(
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.7),
                                  borderRadius: BorderRadius.circular(4.r),
                                ),
                                child: Center(
                                  child: Image.asset(
                                    'assets/blocked_level.png',
                                    width: 64.w,
                                    height: 64.h,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
