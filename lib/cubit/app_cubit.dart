import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/app_states.dart';
import 'package:news_app/network/cash_helper.dart';
import 'package:news_app/network/dio_helper.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppIntialState());
  static AppCubit get(context) => BlocProvider.of(context);

  ThemeMode appmodde = ThemeMode.dark;
  bool isDark = false;
  void changeAppMode({bool? fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
      emit(AppChangeModeState());
    } else {
      isDark = !isDark;
      CashHelper.putBool(key: 'isDark', value: isDark).then((value) {
        emit(AppChangeModeState());
      });
    }
  }
    List<dynamic> search = [];
  void getSearch(String value) {
    emit(NewsSearchLoadingState());
         DioHelper.getData(url: 'v2/everything', query: {
        'q': value,
        'apiKey': '4242b89b82134043bbccc37ad412fe1f',
      }).then((value) {
        search = value.data['articles'];
        emit(NewsSearchSuccessState());
        print(search.toString());
      }).catchError((error) {
        print(error.toString());
        emit(NewsSearchErrorState(error: error.toString()));
      });
  }
}
