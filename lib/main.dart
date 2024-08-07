import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app_bloc/cubit/app_cubit.dart';
import 'package:travel_app_bloc/cubit/app_cubit_logics.dart';
import 'package:travel_app_bloc/pages/detail_page.dart';
import 'package:travel_app_bloc/pages/navpages/main_page.dart';
import 'package:travel_app_bloc/pages/welcome_page.dart';
import 'package:travel_app_bloc/services/data_services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
            iconTheme: IconThemeData(color: Colors.black),
            elevation: 0,
            backgroundColor: Colors.white),
      ),
      home: BlocProvider(
        create: (context) => AppCubits(data: DataServices()),
        child: const AppCubitLogics(),
      ),
    );
  }
}
