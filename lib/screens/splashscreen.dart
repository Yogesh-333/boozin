import 'package:boozin/screens/homescreeen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

extension DarkMode on BuildContext {
  /// is dark mode currently enabled?
  bool isDarkModeOn() {
    final brightness = MediaQuery.of(this).platformBrightness;
    return brightness == Brightness.dark;
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _visible = false;
  bool _subTextVisible = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(milliseconds: 2000), () {
      setState(() {
        _visible = !_visible;
      });
    }); Future.delayed(const Duration(milliseconds: 4000), () {
      setState(() {
        _subTextVisible = !_subTextVisible;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: GestureDetector(
        onTap: (){if(_subTextVisible){Get.offAll(()=>const HomeScreen());}},
        child: Container(
          color: context.isDarkModeOn() ? Colors.black : Colors.white,
          child: Stack(
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AnimatedOpacity(
                        // If the widget is visible, animate to 0.0 (invisible).
                        // If the widget is hidden, animate to 1.0 (fully visible).
                        opacity: _visible ? 1.0 : 0.0,
                        duration: const Duration(milliseconds: 1000),
                        // The green box must be a child of the AnimatedOpacity widget.
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/images/path45090.svg',
                              color: context.isDarkModeOn()
                                  ? Colors.white
                                  : Colors.black,
                            ),
                            SvgPicture.asset(
                              'assets/images/path234.svg',
                            ),
                            SvgPicture.asset(
                              'assets/images/path45089.svg',
                              color: context.isDarkModeOn()
                                  ? Colors.white
                                  : Colors.black,
                            ),
                            SizedBox(
                              width: 5.w,
                            ),
                            SvgPicture.asset(
                              'assets/images/path45088.svg',
                              color: context.isDarkModeOn()
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ],
                        )),
                    AnimatedOpacity(
                      // If the widget is visible, animate to 0.0 (invisible).
                      // If the widget is hidden, animate to 1.0 (fully visible).
                      opacity: _subTextVisible ? 1.0 : 0.0,
                      duration: const Duration(milliseconds: 1000),
                      child: Text(
                        'Fitness',
                        style: TextStyle(fontWeight: FontWeight.w300, fontSize: 15.sp,color: context.isDarkModeOn()
                            ? Colors.white
                            : Colors.black,),
                      ),
                    )
                  ],
                ),
              ),
              AnimatedPositioned(
                top: _visible ? 40.5.h : 40.5.h,
                left: _visible ? 58.5.w : 45.5.w,
                duration: const Duration(seconds: 2),
                curve: Curves.fastOutSlowIn,
                child: SvgPicture.asset(
                  'assets/images/subtraction5.svg',
                ),
              ),
              AnimatedPositioned(
                top: _visible ? 44.5.h : 44.5.h,
                left: _visible ? 61.5.w : 48.5.w,
                duration: const Duration(seconds: 2),
                curve: Curves.fastOutSlowIn,
                child: SvgPicture.asset(
                  'assets/images/subtraction4.svg',
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
