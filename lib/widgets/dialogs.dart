import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

Future<void> showLevelCompletionDialog(BuildContext context, int level,
    int cupFillPercent, VoidCallback onDialogClose) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          width: 325.w,
          height: 553.h,
          padding: EdgeInsets.symmetric(vertical: 16.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            image: DecorationImage(
              image: AssetImage('assets/dialogs/victory_bg.png'),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Victory!',
                style: GoogleFonts.karantina(
                  fontSize: 40.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.yellow,
                  height: 1.h,
                ),
              ),
              Gap(108.h),
              Text(
                'Level ${level + 1}',
                style: GoogleFonts.karantina(
                  fontSize: 48.r,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  height: 0.9.h,
                ),
              ),
              Gap(108.h),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                  onDialogClose();
                },
                child: Stack(
                  children: [
                    Container(
                      width: 237.w,
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
                          'Next',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.r,
                              height: (23.87.h / 20.h)),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 3.h,
                      right: 5.w,
                      child: Container(
                        width: 221.w,
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
                              image: AssetImage('assets/button/element_30.png'),
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
                              image: AssetImage('assets/button/element_45.png'),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Gap(30.h),
              Image.asset(
                'assets/dialogs/cup_$cupFillPercent.png',
                width: 127.w,
                height: 127.h,
              ),
            ],
          ),
        ),
      );
    },
  );
}

Future<void> showHintRewardDialog(
    BuildContext context, VoidCallback onDialogClose) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          width: 325.w,
          height: 420.h,
          padding: EdgeInsets.symmetric(vertical: 16.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.r),
            image: DecorationImage(
              image: AssetImage('assets/dialogs/reward_bg.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Reward!',
                style: GoogleFonts.karantina(
                  fontSize: 40.r,
                  fontWeight: FontWeight.w700,
                  color: Colors.yellow,
                  height: 1.h,
                ),
              ),
              Gap(220.h),
              Text(
                '1 Hint',
                style: GoogleFonts.karantina(
                  fontSize: 64.r,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  height: 0.9.h,
                ),
              ),
              Gap(18.h),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                  onDialogClose();
                },
                child: Stack(
                  children: [
                    Container(
                      width: 237.w,
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
                          'Collect',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.r,
                              height: (23.87.h / 20.h)),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 3.h,
                      right: 5.w,
                      child: Container(
                        width: 221.w,
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
                              image: AssetImage('assets/button/element_30.png'),
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
                              image: AssetImage('assets/button/element_45.png'),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      );
    },
  );
}

Future<void> showAdDialog(
    BuildContext context, VoidCallback onAdComplete) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      Future.delayed(Duration(seconds: 5), () {
        Navigator.of(context).pop();
        onAdComplete();
      });
      return AlertDialog(
        title: Text('Your Ad Here'),
        content: Text('Please watch this ad to change the color.'),
      );
    },
  );
}
