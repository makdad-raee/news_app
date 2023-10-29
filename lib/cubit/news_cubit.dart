import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/news_state.dart';
import 'package:news_app/modules/business/business_screen.dart';
import 'package:news_app/modules/science/science_screen.dart';
import 'package:news_app/modules/sports/sports_screen.dart';

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
}
