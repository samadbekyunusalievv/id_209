import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'premium_status.dart';
import 'screens/levels_screen.dart';
import 'screens/main_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final prefs = await SharedPreferences.getInstance();
  final hasCompletedMainScreen =
      prefs.getBool('hasCompletedMainScreen') ?? false;
  final isPremium = prefs.getBool('isPremium') ?? false;

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
  ));

  runApp(MyApp(
      hasCompletedMainScreen: hasCompletedMainScreen, isPremium: isPremium));
}

class MyApp extends StatefulWidget {
  final bool hasCompletedMainScreen;
  final bool isPremium;

  const MyApp(
      {Key? key, required this.hasCompletedMainScreen, required this.isPremium})
      : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late bool _isPremium;

  @override
  void initState() {
    super.initState();
    _isPremium = widget.isPremium;
  }

  void _updatePremiumStatus(bool status) {
    setState(() {
      _isPremium = status;
    });
    _savePremiumStatus(status);
  }

  Future<void> _savePremiumStatus(bool status) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isPremium', status);
  }

  @override
  Widget build(BuildContext context) {
    return PremiumStatus(
      isPremium: _isPremium,
      updatePremiumStatus: _updatePremiumStatus,
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        builder: (context, child) {
          return MaterialApp(
            home: widget.hasCompletedMainScreen ? Levels() : MainScreen(),
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
