import 'package:flutter/material.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart'
    as inset;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:on_line_hit_color/screens/opening_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainScreen extends StatelessWidget {
  final List<List<int>> gridPattern = [
    [1, 1, 1, 1, 0],
    [0, 0, 0, 1, 1],
    [0, 0, 0, 0, 1],
    [0, 0, 1, 1, 1],
  ];

  Future<void> _setCompletedMainScreen() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('hasCompletedMainScreen', true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/background.png',
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 569.37.h,
            left: 278.w,
            child: Transform.rotate(
              angle: -150 * 3.1415927 / 180,
              child: Container(
                width: 127.67.w,
                height: 127.67.h,
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
                Gap(140.h),
                Text(
                  'ONE LINE\nHIT COLOR',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.karantina(
                    fontSize: 96.r,
                    fontWeight: FontWeight.w700,
                    height: (86.4.h / 96.h),
                    color: Colors.yellow,
                  ),
                ),
                Gap(34.h),
                Expanded(
                  child: GridView.builder(
                    padding: EdgeInsets.symmetric(horizontal: 45.w),
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
                        decoration: inset.BoxDecoration(
                          color: index < 2 ? Colors.yellow : Colors.white,
                          borderRadius: BorderRadius.circular(4.r),
                          boxShadow: [
                            inset.BoxShadow(
                              blurRadius: 5,
                              offset: const Offset(4, 4),
                              color: Colors.black.withOpacity(0.5),
                              inset: true,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                Gap(20.h),
                GestureDetector(
                  onTap: () async {
                    await _setCompletedMainScreen();
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => MainScreen1()),
                    );
                  },
                  child: Stack(
                    children: [
                      Container(
                        width: 350.w,
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
                            'Continue',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                height: 1.h),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 3.h,
                        right: 5.w,
                        child: Container(
                          width: 334.w,
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
                                image:
                                    AssetImage('assets/button/element_30.png'),
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
                                image:
                                    AssetImage('assets/button/element_45.png'),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Terms of Use',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Privacy Policy',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
                Gap(20.h),
              ],
            ),
          ),
          Positioned(
            top: 372.39.h,
            right: 206.79.w,
            child: Transform.rotate(
              angle: -135 * 3.1415927 / 180,
              child: Container(
                width: 195.01.w,
                height: 195.01.h,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/finger.png'),
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
