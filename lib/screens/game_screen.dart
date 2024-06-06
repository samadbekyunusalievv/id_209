import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:on_line_hit_color/screens/levels_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constants/levels_data.dart';
import '../widgets/custom_menu_item.dart';
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
  bool levelCompleted = false; // Flag to track level completion

  @override
  void initState() {
    super.initState();
    gridLogic = GridLogic(levels[widget.level]);
    _loadCupFillPercent();
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

  Future<void> _saveCompletedLevel(int level) async {
    final prefs = await SharedPreferences.getInstance();
    List<String> completedLevels = prefs.getStringList('completedLevels') ?? [];
    if (!completedLevels.contains(level.toString())) {
      completedLevels.add(level.toString());
      await prefs.setStringList('completedLevels', completedLevels);
    }
  }

  void goToNextLevel() async {
    if (levelCompleted) return; // Prevent multiple calls
    levelCompleted = true; // Set flag to true

    print('goToNextLevel called');
    setState(() {
      cupFillPercent += 10;
      print('Updated cupFillPercent: $cupFillPercent');
    });

    await _saveCompletedLevel(widget.level);
    widget.onLevelCompleted(widget.level);

    if (cupFillPercent >= 100) {
      setState(() {
        cupFillPercent = 0;
      });
      await showHintRewardDialog(context, () {
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
    print('_navigateToNextLevel called');
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
    print('_resetGame called');
    setState(() {
      gridLogic.resetGrid();
      levelCompleted = false; // Reset flag when game is reset
    });
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
                  builder: (context) =>
                      Game(level: 0, onLevelCompleted: widget.onLevelCompleted),
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
                  child: Padding(
                    padding: EdgeInsets.all(16.r),
                    child: GestureDetector(
                      onPanUpdate: (details) {
                        print('onPanUpdate called');
                        gridLogic.handleDragUpdate(details, context, setState,
                            goToNextLevel, selectedColor);
                      },
                      onPanEnd: (details) {
                        print('onPanEnd called');
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
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: EdgeInsets.only(bottom: 26.h, left: 16.w),
              child: PopupMenuButton<Color>(
                padding: EdgeInsets.zero,
                position: PopupMenuPosition.under,
                onSelected: (Color color) {
                  setState(() {
                    selectedColor = color;
                  });
                },
                itemBuilder: (BuildContext context) => <PopupMenuEntry<Color>>[
                  const PopupMenuItem<Color>(
                    value: Colors.purple,
                    child: CustomMenuItem(color: Colors.purple),
                  ),
                  const PopupMenuItem<Color>(
                    value: Colors.green,
                    child: CustomMenuItem(color: Colors.green),
                  ),
                  const PopupMenuItem<Color>(
                    value: Colors.orange,
                    child: CustomMenuItem(color: Colors.orange),
                  ),
                  const PopupMenuItem<Color>(
                    value: Colors.blue,
                    child: CustomMenuItem(color: Colors.blue),
                  ),
                  const PopupMenuItem<Color>(
                    value: Colors.red,
                    child: CustomMenuItem(color: Colors.red),
                  ),
                  const PopupMenuItem<Color>(
                    value: Colors.yellow,
                    child: CustomMenuItem(color: Colors.yellow),
                  ),
                ],
                color: Colors.transparent,
                elevation: 0,
                child: CircleAvatar(
                  backgroundColor: selectedColor,
                  radius: 24.r,
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
                  Gap(2.5.w),
                  Text(
                    'Hint',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.karantina(
                      color: Colors.white,
                      fontSize: 34.sp,
                    ),
                  ),
                  Gap(2.5.w),
                  Container(
                    width: 27.w,
                    height: 27.h,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 1.w),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        '1',
                        style: GoogleFonts.karantina(
                          color: Colors.white,
                          fontSize: 20.sp,
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
