import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/news_state.dart';
import 'package:news_app/modules/business/business_screen.dart';
import 'package:news_app/modules/science/science_screen.dart';
import 'package:news_app/modules/sports/sports_screen.dart';
import 'package:news_app/network/dio_helper.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsIntialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int curentIndex = 0;
  List<BottomNavigationBarItem> bootomItems = const [
    BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Business'),
    BottomNavigationBarItem(icon: Icon(Icons.sports_baseball), label: 'Sports'),
    BottomNavigationBarItem(icon: Icon(Icons.science), label: 'Science'),
  ];
  List<Widget> screen = const [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen()
  ];
  void changBottomNavBar(int index) {
    curentIndex = index;
    if (index == 1) {
      getsports();
    }
    if (index == 2) {
      getScience();
    }
    emit(NewsBottomNavState());
  }

  List<dynamic> business = [];
  void getBusiness() {
    emit(NewsGetBusinessLoadingState());
    if (business.isEmpty) {
      DioHelper.getData(url: 'v2/top-headlines', query: {
        'country': 'us',
        'category': 'business',
        'apiKey': '4242b89b82134043bbccc37ad412fe1f',
      }).then((value) {
        business = value.data['articles'];
        emit(NewsGetBusinessSuccessState());
        print(business.toString());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetBusinessErrorState(error: error.toString()));
      });
    } else {
      emit(NewsGetBusinessSuccessState());
    }
  }

  List<dynamic> sports = [];
  void getsports() {
    emit(NewsGetBusinessLoadingState());
    if (sports.isEmpty) {
      DioHelper.getData(url: 'v2/top-headlines', query: {
        'country': 'us',
        'category': 'sports',
        'apiKey': '4242b89b82134043bbccc37ad412fe1f',
      }).then((value) {
        sports = value.data['articles'];
        emit(NewsGetSportSuccessState());
        print(sports.toString());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetSportErrorState(error: error.toString()));
      });
    } else {
      emit(NewsGetSportSuccessState());
    }
  }

  List<dynamic> science = [];
  void getScience() {
    emit(NewsGetScienceLoadingState());
    if (science.isEmpty) {
      DioHelper.getData(url: 'v2/top-headlines', query: {
        'country': 'us',
        'category': 'science',
        'apiKey': '4242b89b82134043bbccc37ad412fe1f',
      }).then((value) {
        science = value.data['articles'];
        emit(NewsGetScienceSuccessState());
        print(science.toString());
      }).catchError((error) {
        print(error.toString());
        print('0000000000000000000000000');
        emit(NewsGetScienceErrorState(error: error.toString()));
      });
    } else {
      emit(NewsGetScienceSuccessState());
    }
  }
}
