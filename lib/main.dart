import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:followup_task/presentation/follow_up/follow_up_bloc/follow_up_bloc.dart';
import 'package:followup_task/presentation/follow_up/follow_up_screen.dart';
import 'di/service_locator.dart';
import 'domain/follow_up/repo_interfaces/follow_up_repo.dart';

void main() async {
  await initDI();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FollowUpBloc>(
        create: (context) => FollowUpBloc(serviceLocator<FollowUpRepo>())
      ..add(GetFollowUpsEvent()),
      child: ScreenUtilInit(
        designSize: const Size(375.0, 812.0),
        minTextAdapt: true,
        splitScreenMode: true,
        useInheritedMediaQuery: true,
        builder: (BuildContext context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'FollowUp',
            home: FollowUpScreen(),
          );
        },
      ),
    );
  }
}

