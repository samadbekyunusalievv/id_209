import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:on_line_hit_color/screens/settings_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
                    fontSize: 32.sp,
                    fontWeight: FontWeight.w700,
                    height: 1.h,
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
                child: Center(
                  child: GridView.builder(
                    padding:
                        EdgeInsets.symmetric(horizontal: 28.r, vertical: 7.r),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      childAspectRatio: 1,
                      crossAxisSpacing: 15.r,
                      mainAxisSpacing: 15.r,
                    ),
                    itemCount: 60, // Total levels are 60
                    itemBuilder: (BuildContext context, int index) {
                      bool isLevelLocked = !isPremium && index >= 30;
                      bool isSequentialLocked = !isPremium &&
                          index > 0 &&
                          !completedLevels.contains(index - 1);
                      bool isLevelCompleted = completedLevels.contains(index);
                      Color levelColor =
                          isLevelCompleted ? Colors.yellow : Colors.white;
                      Color borderColor = Colors.white;

                      if (isLevelLocked) {
                        levelColor = Color(0xFF5A5A5A);
                        borderColor = Color(0xFF5A5A5A);
                      } else if (isLevelCompleted) {
                        borderColor = Colors.yellow;
                      }

                      return GestureDetector(
                        onTap: () {
                          if (isLevelLocked) {
                            showPremiumDialog(context);
                          } else if (isSequentialLocked && index < 30) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                    'Complete previous levels to unlock this one.'),
                              ),
                            );
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
                        child: SizedBox(
                          width: 70.w,
                          height: 70.w,
                          child: Stack(
                            clipBehavior: Clip.none,
                            children: [
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: Container(
                                  width: 64.w,
                                  height: 64.w,
                                  decoration: BoxDecoration(
                                    color: levelColor,
                                    borderRadius: BorderRadius.circular(4.r),
                                    border: Border.all(
                                      color: borderColor,
                                      width: 1,
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        blurRadius: 5,
                                        offset: const Offset(4, 4),
                                        color: Colors.black.withOpacity(0.5),
                                        inset: true,
                                      ),
                                    ],
                                  ),
                                  child: Center(
                                    child: isLevelLocked ||
                                            (index >= 30 && !isPremium)
                                        ? Image.asset(
                                            'assets/lockicon.png',
                                            width: 26.r,
                                            height: 26.r,
                                            color:
                                                Colors.black.withOpacity(0.7),
                                          )
                                        : Text(
                                            '${index + 1}',
                                            style: GoogleFonts.karantina(
                                              color: Colors.black,
                                              fontSize: 48.r,
                                              height: 1.h,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                  ),
                                ),
                              ),
                              if (isLevelCompleted && !isLevelLocked)
                                Align(
                                  alignment: Alignment.topRight,
                                  child: Container(
                                    width: 22.w,
                                    height: 22.w,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white,
                                    ),
                                    child: Center(
                                      child: Icon(
                                        Icons.check,
                                        color: Colors.black,
                                        size: 16.r,
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
