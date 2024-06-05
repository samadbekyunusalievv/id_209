import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GridLogic {
  List<List<int>> gridPattern;
  late List<List<bool>> gridFilled;
  Offset? lastDragPosition;
  bool isValidDrag = true;

  GridLogic(this.gridPattern) {
    resetGrid();
  }

  void resetGrid() {
    gridFilled = List.generate(gridPattern.length,
        (index) => List.filled(gridPattern[0].length, false));
    lastDragPosition = null;
    isValidDrag = true;
  }

  void fillCell(int row, int col, Function setState) {
    setState(() {
      gridFilled[row][col] = true;
    });
  }

  bool isVerticalOrHorizontalDrag(Offset currentDragPosition) {
    if (lastDragPosition == null) return true;
    final dx = (currentDragPosition.dx - lastDragPosition!.dx).abs();
    final dy = (currentDragPosition.dy - lastDragPosition!.dy).abs();
    return (dx == 0 && dy == 1) || (dx == 1 && dy == 0);
  }

  void handleDragUpdate(DragUpdateDetails details, BuildContext context,
      Function setState, Function goToNextLevel, Color fillColor) {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    Offset localPosition = renderBox.globalToLocal(details.localPosition);
    Offset paddingOffset = Offset(16.0.w, 16.0.w); // Same as the padding value
    Offset adjustedPosition = localPosition - paddingOffset;
    int i = (adjustedPosition.dy / 50).floor();
    int j = (adjustedPosition.dx / 50).floor();

    if (i >= 0 &&
        i < gridPattern.length &&
        j >= 0 &&
        j < gridPattern[i].length) {
      Offset currentDragPosition = Offset(i.toDouble(), j.toDouble());

      if (gridPattern[i][j] == 0 || gridFilled[i][j]) {
        isValidDrag = false;
        return;
      }

      if (isVerticalOrHorizontalDrag(currentDragPosition)) {
        fillCell(i, j, setState);
        lastDragPosition = currentDragPosition;

        if (checkWin()) {
          goToNextLevel();
        }
      } else {
        isValidDrag = false;
      }
    }
  }

  void handleDragEnd(Function setState, Function goToNextLevel) {
    if (checkWin()) {
      goToNextLevel();
    } else {
      lastDragPosition = null; // Allow the user to start a new drag
    }
  }

  bool checkWin() {
    for (int i = 0; i < gridPattern.length; i++) {
      for (int j = 0; j < gridPattern[0].length; j++) {
        if (gridPattern[i][j] != 0 && !gridFilled[i][j]) {
          return false;
        }
      }
    }
    return true;
  }
}
