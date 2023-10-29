import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/news_cubit.dart';
import 'package:news_app/cubit/news_state.dart';
import 'package:news_app/network/dio_helper.dart';

class Newslayout extends StatelessWidget {
  const Newslayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit(),
      child: BlocConsumer<NewsCubit, NewsState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = NewsCubit.get(context);
          return Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                print("ooooooooooooooooooo");
                DioHelper.getData(url: 'v2/top-headlines', query: {
                  'country': 'us',
                  'category': 'business',
                  'apiKey': '4242b89b82134043bbccc37ad412fe1f',
                }).then((value) {
                  print(value.toString());
                }).catchError((error) {
                  print(error.toString());
                });
              },
              child: const Icon(Icons.add),
            ),
            appBar: AppBar(
              title: const Text('News App'),
              actions: [
                IconButton(
                  icon: const Icon(Icons.search_sharp),
                  onPressed: () {},
                )
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
