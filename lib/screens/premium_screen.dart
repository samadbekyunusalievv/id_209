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
        return AlertDialog(
          title: Text('Congratulations!'),
          content: Text('You are now a premium user.'),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
                onPremiumActivated();
              },
            ),
          ],
        );
      },
    );
  }

  void _showRestoreDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Notice'),
          content: Text('You are no longer a premium user.'),
          actions: [
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
                onPremiumRestored();
              },
            ),
          ],
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
              Gap(400.h),
              GestureDetector(
                onTap: () {
                  _showPremiumDialog(context);
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
              Gap(20.h),
              GestureDetector(
                onTap: () {
                  _showRestoreDialog(context);
                },
                child: Container(
                  width: 343.w,
                  height: 50.h,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFFF4AB01),
                        Color(0xFFFFE800),
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
                      'Restore',
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
