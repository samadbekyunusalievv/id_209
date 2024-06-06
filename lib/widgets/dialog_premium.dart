import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:on_line_hit_color/screens/premium_screen.dart';

import '../premium_status.dart';

void showPremiumDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          width: 325.w,
          height: 307.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: Colors.black87,
          ),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Gap(40.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.w),
                    child: Text(
                      textAlign: TextAlign.center,
                      '1 Try premium to pass all 60 levels, customize the line’s color and 10 bonus hints ads free 1,99/monthly',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.sp,
                        height: 23 / 20.h,
                      ),
                    ),
                  ),
                  Gap(18.h),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PremiumScreen(
                            onPremiumActivated: () => PremiumStatus.of(context)
                                .updatePremiumStatus(true),
                            onPremiumRestored: () => PremiumStatus.of(context)
                                .updatePremiumStatus(false),
                          ),
                        ),
                      );
                    },
                    child: Container(
                      width: 293.w,
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
                          'See Details',
                          style: TextStyle(
                              color: Colors.black, fontSize: 20.r, height: 1.h),
                        ),
                      ),
                    ),
                  ),
                  Gap(20.h),
                  TextButton(
                      child: Text(
                        'Restore',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {}),
                ],
              ),
              Positioned(
                top: 10.h,
                right: 10.w,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.yellow,
                    radius: 11.r,
                    child: Icon(
                      Icons.close,
                      color: Colors.black,
                      size: 18.r,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

void showPremiumOrAdDialog(
    BuildContext context, Color color, Function(Color) onPremiumActivated) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          width: 325.w,
          height: 307.h,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: Colors.black87,
          ),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Gap(40.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.w),
                    child: Text(
                      textAlign: TextAlign.center,
                      '1 Try premium to pass all 60 levels, customize the line’s color and 10 bonus hints ads free 1,99/monthly',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.sp,
                        height: 23 / 20.h,
                      ),
                    ),
                  ),
                  Gap(18.h),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PremiumScreen(
                            onPremiumActivated: () => PremiumStatus.of(context)
                                .updatePremiumStatus(true),
                            onPremiumRestored: () => PremiumStatus.of(context)
                                .updatePremiumStatus(false),
                          ),
                        ),
                      );
                    },
                    child: Container(
                      width: 293.w,
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
                          'See Details',
                          style: TextStyle(
                              color: Colors.black, fontSize: 20.r, height: 1.h),
                        ),
                      ),
                    ),
                  ),
                  Gap(20.h),
                  TextButton(
                      child: Text(
                        'Restore',
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {}),
                ],
              ),
              Positioned(
                top: 10.h,
                right: 10.w,
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                    _showAdDialog(context, color, onPremiumActivated);
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.yellow,
                    radius: 11.r,
                    child: Icon(
                      Icons.close,
                      color: Colors.black,
                      size: 18.r,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}

void _showAdDialog(
    BuildContext context, Color color, Function(Color) onPremiumActivated) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AdDialog(color: color, onPremiumActivated: onPremiumActivated);
    },
  );
}

class AdDialog extends StatefulWidget {
  final Color color;
  final Function(Color) onPremiumActivated;

  AdDialog({required this.color, required this.onPremiumActivated});

  @override
  _AdDialogState createState() => _AdDialogState();
}

class _AdDialogState extends State<AdDialog> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      if (mounted) {
        Navigator.of(context).pop();
        widget.onPremiumActivated(widget.color);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Your Ad Here'),
      content: Text('Please watch this ad 5sec to change the color.'),
    );
  }
}