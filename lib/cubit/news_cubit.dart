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
    emit(NewsBottomNavState());
  }

  List<dynamic> business = [];
  void getBusiness() {
    emit(NewsGetBusinessLoadingState());
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
  }
}
