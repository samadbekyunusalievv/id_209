import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:on_line_hit_color/screens/levels_screen.dart';
import 'package:on_line_hit_color/screens/settings_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/levels_data.dart';
import '../premium_status.dart';
import '../widgets/dialog_premium.dart';
import '../widgets/dialogs.dart';
import '../widgets/grid_logic.dart';

class Game extends StatefulWidget {
  final int level;
  final Function(int) onLevelCompleted;

  const Game({Key? key, required this.level, required this.onLevelCompleted})
      : super(key: key);

  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  late GridLogic gridLogic;
  Color selectedColor = Colors.yellow;
  int cupFillPercent = 0;
  bool levelCompleted = false;
  bool isMenuOpen = false;
  int hintCount = 2; // Default hint count

  @override
  void initState() {
    super.initState();
    gridLogic = GridLogic(levels[widget.level]);
    _initializeHintCount();
    _loadCupFillPercent();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final isPremium = PremiumStatus.of(context).isPremium;
    _updateHintCount(isPremium);
  }

  Future<void> _loadCupFillPercent() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      cupFillPercent = prefs.getInt('cupFillPercent') ?? 0;
    });
  }

  Future<void> _saveCupFillPercent() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('cupFillPercent', cupFillPercent);
  }

  Future<void> _initializeHintCount() async {
    final prefs = await SharedPreferences.getInstance();
    bool isPremium = PremiumStatus.of(context).isPremium;
    setState(() {
      hintCount = prefs.getInt('hintCount') ?? (isPremium ? 10 : 2);
    });
  }

  Future<void> _saveHintCount() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('hintCount', hintCount);
  }

  Future<void> _saveCompletedLevel(int level) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> completedLevels = prefs.getStringList('completedLevels') ?? [];
    if (!completedLevels.contains(level.toString())) {
      completedLevels.add(level.toString());
      await prefs.setStringList('completedLevels', completedLevels);
    }
  }

  void _updateHintCount(bool isPremium) {
    setState(() {
      hintCount = isPremium ? 10 : 2;
    });
    _saveHintCount();
  }

  void goToNextLevel() async {
    if (levelCompleted) return;
    levelCompleted = true;

    setState(() {
      cupFillPercent += 10;
    });

    await _saveCompletedLevel(widget.level);
    widget.onLevelCompleted(widget.level);

    if (cupFillPercent >= 100) {
      setState(() {
        cupFillPercent = 0;
      });
      await showHintRewardDialog(context, () {
        _incrementHintCount();
        _navigateToNextLevel();
      });
    } else {
      await showLevelCompletionDialog(context, widget.level, cupFillPercent,
          () {
        _navigateToNextLevel();
      });
    }
    await _saveCupFillPercent();
  }

  void _navigateToNextLevel() {
    if (widget.level + 1 < levels.length) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Game(
              level: widget.level + 1,
              onLevelCompleted: widget.onLevelCompleted),
        ),
      );
    }
  }

  void _resetGame() {
    setState(() {
      gridLogic.resetGrid();
      levelCompleted = false;
    });
  }

  void _onColorChangeAttempt(Color color) {
    bool isPremium = PremiumStatus.of(context).isPremium;

    if (isPremium) {
      setState(() {
        selectedColor = color;
        isMenuOpen = false;
      });
    } else {
      showPremiumOrAdDialog(context, color, _onPremiumActivated);
    }
  }

  void _onPremiumActivated(Color color) {
    setState(() {
      selectedColor = color;
      isMenuOpen = false;
    });
  }

  void _incrementHintCount() {
    setState(() {
      hintCount = (hintCount + 1)
          .clamp(0, 12); // Ensure the hint count does not exceed 12
    });
    _saveHintCount();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
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
        leading: IconButton(
          icon: Image.asset(
            'assets/back_icon.png',
            width: 35.w,
            height: 35.h,
          ),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Levels(),
                ));
          },
        ),
        title: Text(
          'Level ${widget.level + 1}',
          textAlign: TextAlign.center,
          style: GoogleFonts.karantina(
            fontSize: 32.sp,
            fontWeight: FontWeight.w700,
            height: 32.38 / 32.h,
            color: Colors.yellow,
          ),
        ),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Divider(
                color: Colors.yellowAccent.shade700,
                height: 1.h,
                thickness: 1.h,
              ),
              Expanded(
                child: Center(
                  child: GestureDetector(
                    onPanUpdate: (details) {
                      gridLogic.handleDragUpdate(details, context, setState,
                          goToNextLevel, selectedColor);
                    },
                    onPanEnd: (details) {
                      gridLogic.handleDragEnd(setState, goToNextLevel);
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: gridLogic.gridPattern.map((row) {
                        int rowIndex = gridLogic.gridPattern.indexOf(row);
                        return Row(
                          mainAxisSize: MainAxisSize.min,
                          children: row.asMap().entries.map((entry) {
                            int colIndex = entry.key;
                            int value = entry.value;
                            return Container(
                              margin: EdgeInsets.all(2.5.r),
                              decoration: BoxDecoration(
                                color: value == 0
                                    ? Colors.transparent
                                    : gridLogic.gridFilled[rowIndex][colIndex]
                                        ? selectedColor
                                        : Colors.white,
                                borderRadius: BorderRadius.circular(4.r),
                                border: value == 0
                                    ? Border.all(color: Colors.transparent)
                                    : Border.all(
                                        color: Colors.black,
                                        width: 1,
                                      ),
                              ),
                              width: 53.w,
                              height: 53.h,
                            );
                          }).toList(),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 16.h),
            child: Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: Image.asset(
                  'assets/reset_icon.png',
                  width: 35.w,
                  height: 35.h,
                ),
                onPressed: () {
                  _resetGame();
                },
              ),
            ),
          ),
          Positioned(
            bottom: 26.h,
            left: 16.w,
            child: Visibility(
              visible: isMenuOpen,
              child: Container(
                padding: EdgeInsets.only(
                  top: 10.h,
                ),
                width: 51.w,
                height: 266.h,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(29.r),
                ),
                child: Column(
                  children: [
                    if (selectedColor != Colors.purple)
                      CustomMenuItem(
                          color: Colors.purple,
                          onSelect: _onColorChangeAttempt),
                    if (selectedColor != Colors.green)
                      CustomMenuItem(
                          color: Colors.green, onSelect: _onColorChangeAttempt),
                    if (selectedColor != Colors.orange)
                      CustomMenuItem(
                          color: Colors.orange,
                          onSelect: _onColorChangeAttempt),
                    if (selectedColor != Colors.blue)
                      CustomMenuItem(
                          color: Colors.blue, onSelect: _onColorChangeAttempt),
                    if (selectedColor != Colors.red)
                      CustomMenuItem(
                          color: Colors.red, onSelect: _onColorChangeAttempt),
                    if (selectedColor != Colors.yellow)
                      CustomMenuItem(
                          color: Colors.yellow,
                          onSelect: _onColorChangeAttempt),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 26.h,
            left: 16.w,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isMenuOpen = !isMenuOpen;
                });
              },
              child: Container(
                width: 51.w,
                height: 51.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 1.w),
                ),
                child: Center(
                  child: CircleAvatar(
                    backgroundColor: selectedColor,
                    radius: 20.5.r,
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 26.h),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/lock_icon.png',
                    width: 27.w,
                    height: 27.h,
                  ),
                  Gap(7.w),
                  Text(
                    'Hint',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.karantina(
                      color: Colors.white,
                      fontSize: 32.sp,
                      height: 32.38 / 32,
                    ),
                  ),
                  Gap(7.w),
                  Container(
                    width: 27.w,
                    height: 27.h,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 1.w),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        '$hintCount', // Display hint count
                        style: GoogleFonts.karantina(
                          color: Colors.white,
                          fontSize: 24.sp,
                          height: 24.29 / 24.h,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomMenuItem extends StatelessWidget {
  final Color color;
  final void Function(Color) onSelect;

  const CustomMenuItem({Key? key, required this.color, required this.onSelect})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onSelect(color),
      child: Container(
        margin: EdgeInsets.only(
          bottom: 10.h,
        ),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: CircleAvatar(
          backgroundColor: color,
          radius: 15.5.r,
        ),
      ),
    );
  }
}
