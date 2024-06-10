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
              'assets/settings_bg.png', // Replace with your image path
              fit: BoxFit.fill,
            ),
          ),
          Column(
            children: [
              AppBar(
                automaticallyImplyLeading:
                    false, // Removes the default back button
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
                      child: Text(
                        textAlign: TextAlign.center,
                        'Try premium to pass all 60 levels, customize the line’s color and 10 bonus hints + ads free for 1,99/monthly',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                            height: 1.1.h),
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
                      child: Container(
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
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
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
                        style: TextStyle(color: Colors.white, fontSize: 14.sp),
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
                      ),
                    ),
                  ),
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
                      'Terms of Use',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.r,
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
