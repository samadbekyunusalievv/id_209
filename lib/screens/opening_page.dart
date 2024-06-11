import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'levels_screen.dart';

class MainScreen1 extends StatefulWidget {
  @override
  _MainScreen1State createState() => _MainScreen1State();
}

class _MainScreen1State extends State<MainScreen1>
    with SingleTickerProviderStateMixin {
  final List<List<int>> gridPattern = [
    [1, 1, 1, 1],
  ];

  late List<List<bool>> gridFilled;
  bool isDragging = false;
  Set<int> filledCells = Set();
  bool showContinueButton = false;
  bool gridFilledCompletely = false;

  late AnimationController _animationController;
  late Animation<double> _elementAnimation;
  late Animation<double> _fingerAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    _elementAnimation = Tween<double>(begin: 74.w, end: 250.w).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.linear,
      ),
    );

    _fingerAnimation = Tween<double>(begin: 65.w, end: 250.w).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.linear,
      ),
    );

    _animationController.repeat(reverse: true);
    resetGrid();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void resetGrid() {
    gridFilled = List.generate(gridPattern.length,
        (index) => List.filled(gridPattern[0].length, false));
    filledCells.clear();
    showContinueButton = false;
    gridFilledCompletely = false;
    if (!_animationController.isAnimating) {
      _animationController.repeat(reverse: true);
    }
  }

  bool checkWin() {
    for (int i = 0; i < gridPattern.length; i++) {
      for (int j = 0; j < gridPattern[0].length; j++) {
        if (!gridFilled[i][j]) {
          return false;
        }
      }
    }
    return true;
  }

  void onDragUpdate(DragUpdateDetails details) {
    if (isDragging) {
      RenderBox renderBox = context.findRenderObject() as RenderBox;
      Offset localPosition = renderBox.globalToLocal(details.globalPosition);
      int row = ((localPosition.dy - (84.h + 92.h + 30.h)) ~/ (53.h + 5.h))
          .clamp(0, gridPattern.length - 1);
      int col = ((localPosition.dx - 74.w) ~/ (53.w + 5.w))
          .clamp(0, gridPattern[0].length - 1);
      int cellIndex = row * gridPattern[0].length + col;

      if (!filledCells.contains(cellIndex)) {
        setState(() {
          gridFilled[row][col] = true;
          filledCells.add(cellIndex);
          if (checkWin()) {
            _animationController.stop();
            showContinueButton = true;
            gridFilledCompletely = true;
          }
        });
      }
    }
  }

  void onDragStart(DragStartDetails details) {
    setState(() {
      isDragging = true;
      filledCells.clear();
    });
  }

  void onDragEnd(DragEndDetails details) {
    setState(() {
      isDragging = false;
    });
  }

  Future<void> onContinueButtonTap() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('hasCompletedMainScreen', true);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const Levels()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onPanStart: onDragStart,
        onPanUpdate: onDragUpdate,
        onPanEnd: onDragEnd,
        child: Stack(
          children: [
            AnimatedBuilder(
              animation: _elementAnimation,
              builder: (context, child) {
                return Positioned(
                  top: 506.h,
                  left: _elementAnimation.value,
                  child: Transform.rotate(
                    angle: 0 * 3.1415927 / 180,
                    child: Container(
                      width: 81.w,
                      height: 81.h,
                      padding: EdgeInsets.symmetric(vertical: 30.06.h),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(gridFilledCompletely
                              ? 'assets/element.png'
                              : 'assets/filled_element.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: Opacity(
                        opacity: 0.7,
                        child: Container(),
                      ),
                    ),
                  ),
                );
              },
            ),
            Positioned.fill(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Gap(84.h),
                  Text(
                    'ONE LINE\nHIT COLOR',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.karantina(
                      fontSize: 64.r,
                      fontWeight: FontWeight.w700,
                      height: 57.6 / 64.h,
                      color: Colors.yellow,
                    ),
                  ),
                  Gap(92.h),
                  Text(
                    gridFilledCompletely
                        ? "Good Job!\n"
                        : "You have to fill the field\nwith one line:",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24.r,
                      color:
                          gridFilledCompletely ? Colors.yellow : Colors.white,
                      height: 28.64 / 24.h,
                    ),
                  ),
                  Gap(30.h),
                  Expanded(
                    child: GridView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 74.w),
                      itemCount: gridPattern.length * gridPattern[0].length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: gridPattern[0].length,
                        crossAxisSpacing: 5.w,
                        mainAxisSpacing: 5.h,
                      ),
                      itemBuilder: (context, index) {
                        int row = index ~/ gridPattern[0].length;
                        int col = index % gridPattern[0].length;
                        if (gridPattern[row][col] == 0) {
                          return const SizedBox.shrink();
                        }
                        return Container(
                          width: 53.w,
                          height: 53.h,
                          decoration: BoxDecoration(
                            color: gridFilled[row][col]
                                ? Colors.yellow
                                : Colors.white,
                            borderRadius: BorderRadius.circular(4.r),
                            border: Border.all(
                              color: Colors.black,
                              width: 1,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            if (showContinueButton)
              Positioned(
                bottom: 69.h,
                left: MediaQuery.of(context).size.width / 2 - 175.w,
                child: GestureDetector(
                  onTap: onContinueButtonTap,
                  child: Stack(
                    children: [
                      Container(
                        width: 350.w,
                        height: 50.h,
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(vertical: 10.h),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xFFFFE800),
                              Color(0xFFF4AB01),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                          border: Border.all(
                            width: 3,
                            color: Colors.transparent,
                          ),
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Center(
                          child: Text(
                            'Lets Play!',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.r,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 3.h,
                        right: 5.w,
                        child: Container(
                          width: 334.w,
                          height: 10.h,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/button/element.png'),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 7.h,
                        left: 8.w,
                        child: Transform.rotate(
                          angle: 30 * (3.14159265359 / 180),
                          child: Container(
                            width: 8.w,
                            height: 10.h,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image:
                                    AssetImage('assets/button/element_30.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 7.h,
                        right: 10.w,
                        child: Transform.rotate(
                          angle: -45 * (3.14159265359 / 180),
                          child: Container(
                            width: 8.w,
                            height: 16.h,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image:
                                    AssetImage('assets/button/element_45.png'),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            AnimatedBuilder(
              animation: _fingerAnimation,
              builder: (context, child) {
                return Positioned(
                  top: 406.h,
                  left: _fingerAnimation.value,
                  child: Transform.rotate(
                    angle: -45 * 3.1415927 / 180,
                    child: Container(
                      width: 87.w,
                      height: 87.h,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/small_finger.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: Opacity(
                        opacity: 1.0,
                        child: Container(),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
