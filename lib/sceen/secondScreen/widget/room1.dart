import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/cubit/rooms_cubit.dart';

class Room1 extends StatefulWidget {
  const Room1({super.key});

  @override
  State<Room1> createState() => _Room1State();
}

class _Room1State extends State<Room1> {
  @override
  Widget build(BuildContext context) {
    var roomsCubit = BlocProvider.of<RoomsCubit>(context);
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10.r)),
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 10.w,vertical:10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Room1'),
            SizedBox(
              height: 20.h,
            ),
            Row(
              children: [
                const Text('Adults'),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    roomsCubit.decrementAdults();
                  },
                  icon: const Icon(Icons.remove),
                  style: IconButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.r),
                          side: const BorderSide(color: Colors.indigo))),
                ),
                SizedBox(
                  width: 10.w,
                ),
                BlocBuilder<RoomsCubit, RoomsState>(
                  builder: (context, state) {
                    return Text(roomsCubit.adults.toString());
                  },
                ),
                SizedBox(
                  width: 10.w,
                ),
                IconButton(
                    onPressed: () {
                      roomsCubit.incrementAdults();
                    },
                    icon: const Icon(Icons.add),
                    style: IconButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.r),
                            side: const BorderSide(color: Colors.indigo))))
              ],
            ),
            Row(
              children: [
                const Text('Children'),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    roomsCubit.decrementChildren();
                  },
                  icon: const Icon(Icons.remove),
                  style: IconButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.r),
                          side: const BorderSide(color: Colors.indigo))),
                ),
                SizedBox(
                  width: 10.w,
                ),
                BlocBuilder<RoomsCubit, RoomsState>(
                  builder: (context, state) {
                    return Text(roomsCubit.children.toString());
                  },
                ),
                SizedBox(
                  width: 10.w,
                ),
                IconButton(
                    onPressed: () {
                      roomsCubit.incrementChildren();
                    },
                    icon: const Icon(Icons.add),
                    style: IconButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.r),
                            side: const BorderSide(color: Colors.indigo))))
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: const Row(
                children: [
                  Text('Age of child 1'),
                  Spacer(),
                  Text('14 years'),
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: const Row(
                children: [
                  Text('Age of child 2'),
                  Spacer(),
                  Text('14 years'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
