import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomMenuItem extends StatelessWidget {
  final Color color;

  const CustomMenuItem({Key? key, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 3.h,
      ),
      decoration: BoxDecoration(
        color: Colors.transparent, // Make the background transparent
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: CircleAvatar(
        backgroundColor: color,
        radius: 24.r,
      ),
    );
  }
}
