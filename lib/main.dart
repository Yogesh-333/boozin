import 'package:boozin/screens/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:permission_handler/permission_handler.dart';

Future<void> main() async {
  //
  // await Permission.activityRecognition.request();
  runApp(const GetMaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        title: 'Boozin',
    theme: ThemeData(
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
      brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
      );
    });
  }
}
