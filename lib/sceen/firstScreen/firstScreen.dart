import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:math' as math;

import 'widget/search.dart';
import 'widget/title.dart';


class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage(
            "assets/background.webp",
          ),
          fit: BoxFit.fill,
        )),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const MainTitle(),
              SizedBox(
                height: 5.h,
              ),
              Stack(
                children: [
                  Container(
                      height: size.height*0.51,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.r),
                          color: Colors.deepOrange),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: TextButton(
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                 Text(
                                  'find hotels',
                                  style: TextStyle(color: Colors.white,fontSize: 14.sp),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                 Icon(
                                  Icons.search,
                                  color: Colors.white,size: 20.w,
                                )
                              ],
                            )),
                      )),
                  const Search()
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
