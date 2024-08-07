import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app_bloc/cubit/app_cubit.dart';
import 'package:travel_app_bloc/cubit/app_cubit_states.dart';
import 'package:travel_app_bloc/pages/detail_page.dart';
import 'package:travel_app_bloc/pages/home_page.dart';
import 'package:travel_app_bloc/pages/navpages/main_page.dart';
import 'package:travel_app_bloc/pages/welcome_page.dart';

class AppCubitLogics extends StatefulWidget {
  const AppCubitLogics({super.key});

  @override
  State<AppCubitLogics> createState() => _AppCubitLogicsState();
}

class _AppCubitLogicsState extends State<AppCubitLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubits, CubitStates>(builder: (context, state) {
        if (state is WelcomeState) {
          return const WelcomePage();
        }
        if (state is LoadingState) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is DetailState) {
          return const DetailPage();
        }
        if (state is LoadedState) {
          return const MainPage();
        } else {
          return Container();
        }
      }),
    );
  }
}
