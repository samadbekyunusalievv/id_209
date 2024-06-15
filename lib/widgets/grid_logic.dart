import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GridLogic {
  List<List<int>> gridPattern;
  late List<List<bool>> gridFilled;
  Offset? lastDragPosition;
  bool isDragging = false;
  List<List<int>> correctSteps;
  List<List<int>> hintSteps = [];

  GridLogic(this.gridPattern, this.correctSteps) {
    resetGrid();
  }

  void resetGrid() {
    gridFilled = List.generate(gridPattern.length,
        (index) => List.filled(gridPattern[0].length, false));
    lastDragPosition = null;
    isDragging = false;
    hintSteps.clear();
  }

  void fillCell(int row, int col, Function setState) {
    if (row < 0 ||
        row >= gridFilled.length ||
        col < 0 ||
        col >= gridFilled[row].length) {
      return; // Avoid out-of-bounds access
    }
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
    if (!isDragging && lastDragPosition != null) {
      return;
    }

    RenderBox renderBox = context.findRenderObject() as RenderBox;
    Offset localPosition = renderBox.globalToLocal(details.localPosition);

    double cellSize = 53.r + 2.5.r * 2;
    int i = (localPosition.dy / cellSize).floor();
    int j = (localPosition.dx / cellSize).floor();

    if (i >= 0 &&
        i < gridPattern.length &&
        j >= 0 &&
        j < gridPattern[i].length) {
      Offset currentDragPosition = Offset(i.toDouble(), j.toDouble());

      if (gridPattern[i][j] == 0 || gridFilled[i][j]) {
        return;
      }

      if (lastDragPosition == null ||
          isVerticalOrHorizontalDrag(currentDragPosition)) {
        fillCell(i, j, setState);
        lastDragPosition = currentDragPosition;
        isDragging = true;

        if (checkWin()) {
          goToNextLevel();
        }
      }
    }
  }

  void handleDragEnd(Function setState, Function goToNextLevel) {
    isDragging = false;
    if (checkWin()) {
      goToNextLevel();
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

  List<List<int>> getHintSteps(int hintCount) {
    List<List<int>> hintSteps = [];
    int startIndex = this.hintSteps.length;
    for (int i = startIndex; i < correctSteps.length; i++) {
      int row = correctSteps[i][0];
      int col = correctSteps[i][1];
      if (!gridFilled[row][col]) {
        hintSteps.add([row, col]);
        this.hintSteps.add([row, col]);
        if (hintSteps.length == hintCount) break;
      }
    }
    return hintSteps;
  }
}
