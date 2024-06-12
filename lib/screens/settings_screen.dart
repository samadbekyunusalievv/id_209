import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:on_line_hit_color/screens/premium_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../premium_status.dart';
import 'opening_page.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  Future<void> _setPremiumStatus(BuildContext context, bool status) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isPremium', status);
    PremiumStatus.of(context).updatePremiumStatus(status);
    print('Updated premium status: $status'); // Debug print
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/settings_bg.png',
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
                title: Text(
                  'Settings',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.karantina(
                    fontSize: 32.sp,
                    fontWeight: FontWeight.w700,
                    height: 0.9.h,
                    color: Colors.yellow,
                  ),
                ),
              ),
              Divider(
                color: Colors.yellowAccent.shade700,
                height: 1.h,
                thickness: 1.h,
              ),
              Gap(30.h),
              Container(
                width: 325.w,
                height: 216.h,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 1),
                  borderRadius: BorderRadius.circular(10.r),
                  color: Colors.black,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.only(top: 16.h, left: 16.w, right: 16.w),
                      child: Text.rich(
                        TextSpan(
                          text:
                              'Try premium to pass all 60 levels, customize the line’s color and 10 bonus hints',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.r,
                              height: 19.09 / 16.h,
                              fontWeight: FontWeight.w500),
                          children: const <TextSpan>[
                            TextSpan(
                              text: '+ads free for ',
                            ),
                            TextSpan(
                              text: '\$1.99',
                              style: TextStyle(
                                  color: Colors.yellow,
                                  fontWeight: FontWeight.w500),
                            ),
                            TextSpan(
                              text: '/monthly',
                            ),
                          ],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Gap(20.h),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PremiumScreen(
                              onPremiumActivated: () =>
                                  _setPremiumStatus(context, true),
                              onPremiumRestored: () =>
                                  _setPremiumStatus(context, false),
                            ),
                          ),
                        );
                      },
                      child: Stack(
                        children: [
                          Container(
                            width: 293.w,
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
                                width: 3,
                                color: Colors.yellow,
                              ),
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: Center(
                              child: Text(
                                'See Details',
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
                              width: 277.w,
                              height: 10.h,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image:
                                      AssetImage('assets/button/element.png'),
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
                              angle: -45 *
                                  (3.14159265359 /
                                      180), // 45 degrees to radians
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
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PremiumScreen(
                              onPremiumActivated: () =>
                                  _setPremiumStatus(context, true),
                              onPremiumRestored: () =>
                                  _setPremiumStatus(context, false),
                            ),
                          ),
                        );
                      },
                      child: Text(
                        'Restore',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.r,
                          height: 16.71 / 14.h,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Gap(20.h),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MainScreen1()),
                  );
                },
                child: Container(
                  width: 325.w,
                  height: 50.h,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    border: Border.all(
                      width: 1,
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Center(
                    child: Text(
                      'Privacy Policy',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.r,
                          height: 19.09 / 16.h,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
              Gap(20.h),
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: 325.w,
                  height: 50.h,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    border: Border.all(
                      width: 1,
                      color: Colors.white,
                    ),
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Center(
                    child: Text(
                      'Terms of Use',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.r,
                        height: 19.09 / 16.h,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
