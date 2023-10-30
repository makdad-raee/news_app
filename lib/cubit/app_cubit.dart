import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/app_states.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppIntialState());
  static AppCubit get(context) => BlocProvider.of(context);

  ThemeMode appmodde = ThemeMode.dark;
  bool isDark = false;
  void changeAppMode() {
    isDark = !isDark;
    emit(AppChangeModeState());
  }
}
