import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/app_cubit.dart';
import 'package:news_app/cubit/news_cubit.dart';
import 'package:news_app/cubit/news_state.dart';
import 'package:news_app/modules/search/search_screen.dart';

class Newslayout extends StatelessWidget {
  const Newslayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit()..getBusiness(),
      child: BlocConsumer<NewsCubit, NewsState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = NewsCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              title: const Text('News App'),
              actions: [
                IconButton(
                  icon: const Icon(Icons.search_sharp),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => SearchScreen(),),);
                  },
                ),
                IconButton(
                  onPressed: () {
                    AppCubit.get(context).changeAppMode();
                  },
                  icon: const Icon(
                    Icons.brightness_4_outlined,
                  ),
                ),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              items: cubit.bootomItems,
              currentIndex: cubit.curentIndex,
              onTap: (value) {
                cubit.changBottomNavBar(value);
              },
            ),
            body: cubit.screen[cubit.curentIndex],
          );
        },
      ),
    );
  }
}
