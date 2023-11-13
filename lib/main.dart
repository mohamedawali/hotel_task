import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/cubit/rooms_cubit.dart';

import 'sceen/firstScreen/firstScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return BlocProvider(
            create: (context) => RoomsCubit(),
            child: MaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(

                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                useMaterial3: true,
              ),
              home: const FirstScreen(),
            ),
          );
        });
  }
}
