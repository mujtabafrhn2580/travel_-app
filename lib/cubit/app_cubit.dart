import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app_bloc/cubit/app_cubit_states.dart';
import 'package:travel_app_bloc/model/data_model.dart';
import 'package:travel_app_bloc/services/data_services.dart';

class AppCubits extends Cubit<CubitStates> {
  AppCubits({required this.data}) : super(InitialState()) {
    emit(WelcomeState());
  }
  final DataServices data;
  late final List<DataModel> places;

  void getData() async {
    try {
      emit(LoadingState());
      places = await data.getInfo();
      print(places);
      emit(LoadedState(places));
      print('State should surel emit');
    } catch (e) {
      print('error');
    }
  }

  detailPage(DataModel data) {
    emit(DetailState(data));
  }

  goHome() {
    emit(LoadedState(places));
  }
}
