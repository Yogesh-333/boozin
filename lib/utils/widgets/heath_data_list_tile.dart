import 'package:boozin/screens/homescreeen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

import '../../constants/fonts.dart';

class HealthDataTileCard extends StatelessWidget {
  HealthDataTileCard(
      {required this.name,
      required this.svgPath,
      required this.value,
      Key? key})
      : super(key: key);
  final String svgPath;
  final String name;
  final double value;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 15.h,
      width: MediaQuery.of(context).size.width,
      child: Card(
        color: context.isDarkModeThere()
            ? const Color.fromRGBO(50, 50, 50, 1)
            : const Color.fromRGBO(240, 240, 240, 1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Padding(
          padding: EdgeInsets.fromLTRB(2.w, 3.h, 2.w, 2.h),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: '$name: ',
                            style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                              fontFamily: AppFonts.montserrat,
                              color: context.isDarkModeThere()
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                          TextSpan(
                            text: value.round().toString(),
                            style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                              fontFamily: AppFonts.nunito,
                              color: context.isDarkModeThere()
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Flexible(
                      child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        child: LinearProgressIndicator(
                          value: value.round() / 1000,
                          valueColor: AlwaysStoppedAnimation(
                            context.isDarkModeThere()
                                ? Colors.white
                                : Colors.black,
                          ),
                          backgroundColor: const Color(0xffC4C4C4),
                          minHeight: 16.h,
                        ),
                      ),
                    ),
                    SizedBox(height: 1.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '0',
                          style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w500,
                            fontFamily: AppFonts.nunito,
                            color: context.isDarkModeThere()
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                        Text(
                          'Goal : ${value.round()}',
                          style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w500,
                            fontFamily: AppFonts.nunito,
                            color: context.isDarkModeThere()
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(width: 4.w),
              SizedBox(
                height: 5.h,
                width: 15.w,
                child: SvgPicture.asset(
                  svgPath,
                  color:
                      context.isDarkModeThere() ? Colors.white : Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
