import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/cubit/rooms_cubit.dart';

import 'widget/room1.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var roomsCubit = BlocProvider.of<RoomsCubit>(context);
    return SizedBox(
      height: size.height / 1.1,
      child: Column(
        children: [
          AppBar(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20.r),
                    topLeft: Radius.circular(20.r))),
            actions: [
              IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.clear))
            ],
            title: Text(
              'Rooms and Guests',
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            automaticallyImplyLeading: false,
            centerTitle: true,
          ),
          Container(
              color: Colors.grey,
              height: MediaQuery.of(context).size.height / 1.21,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.r)),
                      child: Padding(
                        padding: EdgeInsets.all(10.r),
                        child: Row(
                          children: [
                            const Text('Rooms'),
                            const Spacer(),
                            IconButton(
                              onPressed: () {
                                roomsCubit.decrementRooms();
                              },
                              icon: const Icon(Icons.remove),
                              style: IconButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.r),
                                      side: const BorderSide(
                                          color: Colors.indigo))),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            BlocBuilder<RoomsCubit, RoomsState>(
                              builder: (context, state) {
                                return Text(roomsCubit.room.toString());
                              },
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            IconButton(
                                onPressed: () {
                                  roomsCubit.incrementRooms();
                                },
                                icon: const Icon(Icons.add),
                                style: IconButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(18.r),
                                        side: const BorderSide(
                                            color: Colors.indigo))))
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    const Room1(),
                    SizedBox(
                      height: 20.h,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10.r)),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.w, vertical: 10.h),
                        child: Row(
                          children: [
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text('Pet-friendly'),
                                    Icon(Icons.info_outline)
                                  ],
                                ),
                                Text('Only show stays that allow pets')
                              ],
                            ),
                            const Spacer(),
                            BlocBuilder<RoomsCubit, RoomsState>(
                              builder: (context, state) {
                                return Switch(
                                    value: roomsCubit.switchBt,
                                    activeColor: Colors.blue,
                                    onChanged: (bool value) {
                                      roomsCubit.changeSwitch(value);
                                    });
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                    const Spacer(),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.r)),
                          minimumSize: Size(size.width, 50.h)),
                      child: const Text(
                        'Applay',
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
