import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../cubit/rooms_cubit.dart';
import '../../secondScreen/secondScreen.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) {
    var roomsCubit = BlocProvider.of<RoomsCubit>(context);
    Size size = MediaQuery.of(context).size;
    return Container(
        height: size.height * 0.44,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
          gradient:
              const LinearGradient(colors: [Colors.indigo, Color(0xffc5cae9)]),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 50.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      color: Colors.white),
                  child: Padding(
                    padding: EdgeInsets.all(5.w),
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                          hintStyle: const TextStyle(color: Colors.indigo),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.r)),
                          hintText: 'Select City'),
                    ),
                  ),
                ),
                Container(
                  height: 50.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      color: Colors.white),
                  child: Padding(
                    padding: EdgeInsets.all(5.w),
                    child: BlocBuilder<RoomsCubit, RoomsState>(
                      builder: (context, state) {
                        return TextFormField(
                          readOnly: true,
                          onTap: () async {
                            var dateTimeRange = await showDateRangePicker(
                                context: context,
                                firstDate: DateTime(1990),
                                lastDate: DateTime.now());
                            roomsCubit.selectDate(dateTimeRange);
                          },
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                              hintStyle: const TextStyle(color: Colors.indigo),
                              suffixIcon: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.clear)),
                              // contentPadding: EdgeInsets.zero,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20.r)),
                              hintText:
                                  '${roomsCubit.startDate} ==>${roomsCubit.endDate}'),
                        );
                      },
                    ),
                  ),
                ),
                DropdownButtonFormField(
                  hint: const Text(
                    'Select Nationality',
                    style: TextStyle(
                      color: Colors.indigo,
                    ),
                  ),
                  icon: const Icon(Icons.keyboard_arrow_down),
                  items: const [
                    DropdownMenuItem(
                      value: 'egypt',
                      child: Text('Egypt'),
                    ),
                    DropdownMenuItem(
                      value: 'uae',
                      child: Text('UAE'),
                    )
                  ],
                  onChanged: (item) {

                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.r)),
                      fillColor: Colors.white,
                      filled: true),
                ),
                ElevatedButton(
                  onPressed: () {
                    showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        builder: (context) => const SecondScreen());
                  },
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(10),
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.r)),
                      minimumSize: Size(0, 50.h)),
                  child: BlocBuilder<RoomsCubit, RoomsState>(
                    builder: (context, state) {
                      return Row(
                        children: [
                          Text("${roomsCubit.room} Room,"),
                          Text("${roomsCubit.adults} Adult,"),
                          Text("${roomsCubit.children} Children"),
                          const Spacer(),
                          const Icon(Icons.keyboard_arrow_down)
                        ],
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
