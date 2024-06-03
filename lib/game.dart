import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class Game extends StatefulWidget {
  const Game({Key? key}) : super(key: key);

  @override
  _GameState createState() => _GameState();
}

class _GameState extends State<Game> {
  final List<List<int>> gridPattern = [
    [1, 1, 1, 1, 1, 1],
  ];

  Color selectedColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black, // Set the background color to black
      body: Stack(
        children: [
          Column(
            children: [
              AppBar(
                automaticallyImplyLeading:
                    false, // Removes the default back button
                backgroundColor: Colors.transparent,
                elevation: 0,
                centerTitle: true,
                actions: [
                  IconButton(
                    icon: Image.asset(
                      'assets/setting_icon.png', // Replace with your icon path
                      width: 35.w,
                      height: 35.h,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Game()),
                      );
                    },
                  ),
                ],
                leading: IconButton(
                  icon: Image.asset(
                    'assets/back_icon.png', // Replace with your back button icon path
                    width: 35.w,
                    height: 35.h,
                  ),
                  onPressed: () {
                    Navigator.pop(context); // Navigate back
                  },
                ),
                title: Text(
                  'Level 1',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.karantina(
                    fontSize: 32.r,
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
              Gap(300.h),
              Expanded(
                child: GridView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
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
                      decoration: BoxDecoration(
                        color: selectedColor,
                        borderRadius: BorderRadius.circular(4.r),
                        border: Border.all(
                          color: Colors.black,
                          width: 1,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: PopupMenuButton<Color>(
                icon: Image.asset(
                  'assets/color_choose_icon.png', // Replace with your dropdown icon path
                  width: 51.w,
                  height: 51.h,
                ),
                onSelected: (Color color) {
                  setState(() {
                    selectedColor = color;
                  });
                },
                itemBuilder: (BuildContext context) => <PopupMenuEntry<Color>>[
                  PopupMenuItem<Color>(
                    value: Colors.purple,
                    child: CustomMenuItem(color: Colors.purple),
                  ),
                  PopupMenuItem<Color>(
                    value: Colors.green,
                    child: CustomMenuItem(color: Colors.green),
                  ),
                  PopupMenuItem<Color>(
                    value: Colors.orange,
                    child: CustomMenuItem(color: Colors.orange),
                  ),
                  PopupMenuItem<Color>(
                    value: Colors.blue,
                    child: CustomMenuItem(color: Colors.blue),
                  ),
                  PopupMenuItem<Color>(
                    value: Colors.red,
                    child: CustomMenuItem(color: Colors.red),
                  ),
                  PopupMenuItem<Color>(
                    value: Colors.yellow,
                    child: CustomMenuItem(color: Colors.yellow),
                  ),
                ],
                color: Colors.transparent, // Makes the popup menu transparent
                elevation: 0, // Removes the shadow
                offset: Offset(0, -200), // Adjust the offset to open upwards
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/lock_icon.png', // Replace with your small icon image path
                    width: 27.w,
                    height: 27.h,
                  ),
                  Gap(2.5.w),
                  Text(
                    'Hint',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.karantina(
                      color: Colors.white,
                      fontSize: 34.sp,
                    ),
                  ),
                  Gap(2.5.w),
                  Container(
                    width: 27.w,
                    height: 27.h,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 1.w),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        '1',
                        style: GoogleFonts.karantina(
                          color: Colors.white,
                          fontSize: 20.sp,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomMenuItem extends StatelessWidget {
  final Color color;

  const CustomMenuItem({Key? key, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        right: 200.w,
        bottom: 6.h,
      ),
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: 3.h,
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
