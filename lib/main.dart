import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'screens/levels_screen.dart';
import 'screens/main_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Ensure the shared preferences are initialized before the app starts
  final prefs = await SharedPreferences.getInstance();
  final hasCompletedMainScreen =
      prefs.getBool('hasCompletedMainScreen') ?? false;

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
  ));

  runApp(MyApp(hasCompletedMainScreen: hasCompletedMainScreen));
}

class MyApp extends StatelessWidget {
  final bool hasCompletedMainScreen;

  const MyApp({Key? key, required this.hasCompletedMainScreen})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return MaterialApp(
          home: hasCompletedMainScreen ? Levels() : MainScreen(),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
