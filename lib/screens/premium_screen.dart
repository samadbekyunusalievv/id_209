import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class PremiumScreen extends StatelessWidget {
  const PremiumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/premium_bg.png', // Replace with your image path
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
              Gap(600),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const PremiumScreen(),
                    ),
                  );
                },
                child: Container(
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
                      width: 3,
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
