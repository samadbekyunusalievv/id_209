import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

import 'levels.dart';

class MainScreen1 extends StatefulWidget {
  @override
  _MainScreen1State createState() => _MainScreen1State();
}

class _MainScreen1State extends State<MainScreen1> {
  final List<List<int>> gridPattern = [
    [1, 1, 1, 1],
  ];

  late List<List<bool>> gridFilled;
  bool isDragging = false;
  Set<int> filledCells = Set();

  @override
  void initState() {
    super.initState();
    resetGrid();
  }

  void resetGrid() {
    gridFilled = List.generate(gridPattern.length,
        (index) => List.filled(gridPattern[0].length, false));
    filledCells.clear();
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
    if (checkWin()) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Levels()),
      );
    } else {
      setState(() {
        resetGrid();
      });
    }
    setState(() {
      isDragging = false;
    });
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
            Positioned(
              top: 530.h,
              left: 77.w,
              child: Transform.rotate(
                angle: 0 * 3.1415927 / 180,
                child: Container(
                  width: 81.w,
                  height: 81.h,
                  padding: EdgeInsets.symmetric(vertical: 30.06.h),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/element.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Opacity(
                    opacity: 0.7,
                    child: Container(),
                  ),
                ),
              ),
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
                      height: 0.9,
                      color: Colors.yellow,
                    ),
                  ),
                  Gap(92.h),
                  Text(
                    "You have to fill the field\nwith one line:",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24.r,
                      color: Colors.white,
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
            Positioned(
              top: 435.h,
              left: 65.w,
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
            ),
          ],
        ),
      ),
    );
  }
}
