import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainTitle extends StatelessWidget {
  const MainTitle({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: 50.h,
      width: size.width / 3,
      child: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
                color: Colors.indigo,
                border: Border(right: BorderSide(color: Colors.white))),
            width: size.width / 3,
            height: 50.h,
          ),
          Transform(
            transform: Matrix4.skewX(0.6),
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.indigo,
                    border: Border(
                        right: BorderSide(
                          color: Colors.white,
                          width: 3.w,
                        ),
                        top: BorderSide(
                          color: Colors.indigo,
                          width: 3.w,
                        ))),
                width: size.width / 3,
                height: 50.h,
                ),
          ),
   Center(child: Text('Hotels Search',textAlign: TextAlign.start,style: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.bold,color: Colors.white),))
        ],
      ),
    );
  }
}
