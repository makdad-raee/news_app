import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/app_cubit.dart';
import 'package:news_app/cubit/app_states.dart';
import 'package:news_app/layout/news_layout.dart';
import 'package:news_app/network/dio_helper.dart';
import 'package:hexcolor/hexcolor.dart';

void main() {
  DioHelper.init();
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {},
        builder: (context, state) => MaterialApp(
          themeMode:
              AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
          darkTheme: ThemeData(
              textTheme: const TextTheme(),
              primarySwatch: Colors.green,
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                selectedItemColor: Colors.green,
                unselectedItemColor: Colors.grey,
                elevation: 20,
                backgroundColor: HexColor('333739'),
                type: BottomNavigationBarType.fixed,
              ),
              scaffoldBackgroundColor: HexColor('333739'),
              appBarTheme: AppBarTheme(
                  titleSpacing: 20.0,

                  //backgroundColor: Colors.black,
                  iconTheme: const IconThemeData(color: Colors.white),
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: HexColor('333739'),
                    statusBarIconBrightness: Brightness.light,
                  ),
                  elevation: 0,
                  color: Colors.white,
                  titleTextStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ))),
          theme: ThemeData(
              floatingActionButtonTheme: const FloatingActionButtonThemeData(
                  backgroundColor: Colors.green),
              primarySwatch: Colors.green,
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                  selectedItemColor: Colors.green,
                  elevation: 20,
                  type: BottomNavigationBarType.fixed,
                  backgroundColor: Colors.white),
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: const AppBarTheme(
                  titleSpacing: 20.0,
                  iconTheme: IconThemeData(color: Colors.black),
                  systemOverlayStyle: SystemUiOverlayStyle(
                    statusBarColor: Colors.white,
                    statusBarIconBrightness: Brightness.dark,
                  ),
                  elevation: 0,
                  color: Colors.white,
                  titleTextStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ))),
          home: const Newslayout(),
        ),
      ),
    );
  }
}
