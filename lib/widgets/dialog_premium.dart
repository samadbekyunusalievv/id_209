import 'dart:ui';

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
          height: 307.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: Colors.black.withOpacity(0.8),
            border: Border.all(
              color: Colors.white.withOpacity(0.5),
              width: 1,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.r),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Gap(40.h),
                        Text.rich(
                          TextSpan(
                            text:
                                'Try premium to pass all 60 levels, customize the line’s color and 10 bonus hints',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w500,
                              height: (23.87.h / 20.h),
                            ),
                            children: const <TextSpan>[
                              TextSpan(
                                text: '\n+ads free\nfor ',
                              ),
                              TextSpan(
                                text: '\$1.99',
                                style: TextStyle(
                                  color: Colors.yellow,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              TextSpan(
                                text: '/monthly',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Gap(18.h),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PremiumScreen(
                                  onPremiumActivated: () =>
                                      PremiumStatus.of(context)
                                          .updatePremiumStatus(true),
                                  onPremiumRestored: () =>
                                      PremiumStatus.of(context)
                                          .updatePremiumStatus(false),
                                ),
                              ),
                            );
                          },
                          child: Stack(
                            children: [
                              Container(
                                width: 293.w,
                                height: 50.h,
                                alignment: Alignment.center,
                                padding: EdgeInsets.symmetric(vertical: 10.r),
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
                                    width: 3.r,
                                    color: Colors.transparent,
                                  ),
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                child: Center(
                                  child: Text(
                                    'See Details',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w500,
                                      height: (23.87.h / 20.h),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 3.h,
                                right: 5.w,
                                child: Container(
                                  width: 277.w,
                                  height: 10.h,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          'assets/button/element.png'),
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
                                        image: AssetImage(
                                            'assets/button/element_30.png'),
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
                                        image: AssetImage(
                                            'assets/button/element_45.png'),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Gap(20.h),
                        TextButton(
                          child: Text(
                            'Restore',
                            style: TextStyle(
                                fontSize: 14.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                height: 1.h),
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
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
          height: 307.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            color: Colors.black.withOpacity(0.8),
            border: Border.all(
              color: Colors.white.withOpacity(0.5),
              width: 1,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.r),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Gap(40.h),
                        Text.rich(
                          TextSpan(
                            text:
                                'Try premium to pass all 60 levels, customize the line’s color and 10 bonus hints',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w500,
                              height: (23.87.h / 20.h),
                            ),
                            children: const <TextSpan>[
                              TextSpan(
                                text: '\n+ads free\nfor ',
                              ),
                              TextSpan(
                                text: '\$1.99',
                                style: TextStyle(
                                  color: Colors.yellow,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              TextSpan(
                                text: '/monthly',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Gap(18.h),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PremiumScreen(
                                  onPremiumActivated: () =>
                                      PremiumStatus.of(context)
                                          .updatePremiumStatus(true),
                                  onPremiumRestored: () =>
                                      PremiumStatus.of(context)
                                          .updatePremiumStatus(false),
                                ),
                              ),
                            );
                          },
                          child: Stack(
                            children: [
                              Container(
                                width: 293.w,
                                height: 50.h,
                                alignment: Alignment.center,
                                padding: EdgeInsets.symmetric(vertical: 10.r),
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
                                    width: 3.r,
                                    color: Colors.transparent,
                                  ),
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                child: Center(
                                  child: Text(
                                    'See Details',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.w500,
                                      height: (23.87.h / 20.h),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                bottom: 3.h,
                                right: 5.w,
                                child: Container(
                                  width: 277.w,
                                  height: 10.h,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          'assets/button/element.png'),
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
                                        image: AssetImage(
                                            'assets/button/element_30.png'),
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
                                        image: AssetImage(
                                            'assets/button/element_45.png'),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Gap(20.h),
                        TextButton(
                          child: Text(
                            'Restore',
                            style: TextStyle(
                                fontSize: 14.sp,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                height: 1.h),
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
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
      content: Text('Please watch this ad for 5 seconds to change the color.'),
    );
  }
}
