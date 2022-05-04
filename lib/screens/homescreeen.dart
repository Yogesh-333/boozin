import 'dart:math';

import 'package:boozin/constants/fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sizer/sizer.dart';
import 'package:get/get.dart';
import 'package:health/health.dart';

import '../utils/dataHandling/health_record_fetch.dart';
import '../utils/widgets/heath_data_list_tile.dart';

extension DarkMode on BuildContext {
  /// is dark mode currently enabled?
  bool isDarkModeThere() {
    final brightness = MediaQuery.of(this).platformBrightness;
    return brightness == Brightness.dark;
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isLoading = true;
  num steps=0;
  num caloriesBurned=0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: context.isDarkModeThere() ? Colors.black : Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hi!",
              style: TextStyle(
                  color:
                      context.isDarkModeThere() ? Colors.white : Colors.black,
                  fontSize: 20.sp,
                  fontFamily: AppFonts.nunito),
            ),
        SizedBox(height: 5.h,),
        ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            padding: const EdgeInsets.all(8),
            itemCount: 2,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding:  EdgeInsets.only(bottom: 2.h),
                child: HealthDataTileCard(
                  svgPath: index==0?"assets/images/vector.svg":"assets/images/footprint.svg",
                  value:  index==0?caloriesBurned.toDouble():steps.toDouble(),
                  name: index==0?"Calories Burned":"Steps",
                ),
              );
            }
        ),
          ],
        ),
      ),
    ));
  }

  fetchData() async {
    final healthData = await HealthService.fetchHealthData();

    for(HealthDataPoint value in healthData){
      if(value.type==HealthDataType.ACTIVE_ENERGY_BURNED){
        caloriesBurned=caloriesBurned+value.value;
      }
      else  if(value.type==HealthDataType.STEPS){
        steps=steps+value.value;
      }
    }
    setState(() {
      _isLoading=false;
    });
  }
}
