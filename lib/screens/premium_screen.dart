import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class PremiumScreen extends StatelessWidget {
  final VoidCallback onPremiumActivated;
  final VoidCallback onPremiumRestored;

  const PremiumScreen({
    required this.onPremiumActivated,
    required this.onPremiumRestored,
    Key? key,
  }) : super(key: key);

  void _showPremiumDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            width: 325.w,
            height: 150.h,
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
                        "You are now premium user!",
                        style: TextStyle(color: Colors.white, fontSize: 20.r),
                        textAlign: TextAlign.center,
                      ),
                    ),
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

  void _showRestoreDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            width: 325.w,
            height: 150.h,
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
                        "You are no more premium user!",
                        style: TextStyle(color: Colors.white, fontSize: 20.r),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                Positioned(
                  top: 10.h,
                  right: 10.w,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/premium_bg.png',
              fit: BoxFit.fill,
            ),
          ),
          Column(
            children: [
              AppBar(
                automaticallyImplyLeading: false,
                backgroundColor: Colors.transparent,
                elevation: 0,
                centerTitle: true,
                title: Text(
                  'Premium',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.karantina(
                    fontSize: 32.sp,
                    fontWeight: FontWeight.w700,
                    height: 0.9.h,
                    color: Colors.yellow,
                  ),
                ),
                leading: IconButton(
                  icon: Image.asset(
                    'assets/back_icon.png',
                    width: 35.w,
                    height: 35.h,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Gap(20.h),
              Text(
                'ONE LINE\nHIT COLOR',
                textAlign: TextAlign.center,
                style: GoogleFonts.karantina(
                  fontSize: 80.r,
                  fontWeight: FontWeight.w700,
                  height: (72.r / 80.r),
                  color: Colors.yellow,
                ),
              ),
              Gap(125.h),
              Padding(
                padding: EdgeInsets.only(
                  left: 16.w,
                ),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 13.w,
                            height: 13.h,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                          ),
                          Gap(10.w),
                          Text.rich(
                            TextSpan(
                              text: '60 ',
                              style: TextStyle(
                                color: Colors.yellow,
                                fontSize: 32.r,
                                height: (28.8 / 32).h,
                              ),
                              children: [
                                TextSpan(
                                  text: 'Levels',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 32.r,
                                    height: (28.8 / 32).h,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Gap(25.h),
                      Row(
                        children: [
                          Container(
                            width: 13.w,
                            height: 13.h,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                          ),
                          Gap(10.w),
                          Text.rich(
                            TextSpan(
                              text: '10 ',
                              style: TextStyle(
                                color: Colors.yellow,
                                fontSize: 32.r,
                                height: (28.8 / 32).h,
                              ),
                              children: [
                                TextSpan(
                                  text: 'Hints',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 32.r,
                                    height: (28.8 / 32).h,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Gap(25.h),
                      Row(
                        children: [
                          Container(
                            width: 13.w,
                            height: 13.h,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                            ),
                          ),
                          Gap(10.w),
                          Text.rich(
                            TextSpan(
                              text: 'Ad ',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 32.r,
                                height: (28.8 / 32).h,
                              ),
                              children: [
                                TextSpan(
                                  text: 'Disabling',
                                  style: TextStyle(
                                    color: Colors.yellow,
                                    fontSize: 32.r,
                                    height: (28.8 / 32).h,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Gap(68.h),
              Text(
                'for \$1.99',
                style: TextStyle(
                  color: Colors.yellow,
                  fontSize: 24.sp,
                  height: 24.24 / 24.h,
                ),
              ),
              Gap(16.h),
              GestureDetector(
                onTap: () {
                  _showPremiumDialog(context);
                  onPremiumActivated();
                },
                child: Stack(
                  children: [
                    Container(
                      width: 343.w,
                      height: 50.h,
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
                          width: 3.w,
                          color: Colors.yellow,
                        ),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Center(
                        child: Text(
                          'Get Premium',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.r,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 3.h,
                      right: 5.w,
                      child: Container(
                        width: 327.w,
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
              Gap(40.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Terms of Use',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.r,
                            height: 16.71 / 14.h,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        _showRestoreDialog(context);
                        onPremiumRestored();
                      },
                      child: Text(
                        'Restore',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.r,
                            height: 16.71 / 14.h,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Privacy Policy',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14.r,
                            height: 16.71 / 14.h,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Positioned(
            top: 371.h,
            left: 206.w,
            child: Transform.rotate(
              angle: -90 * 3.1415927 / 180,
              child: Container(
                width: 195.01.w,
                height: 195.01.h,
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
    );
  }
}
