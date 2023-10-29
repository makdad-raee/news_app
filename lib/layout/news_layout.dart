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
      create: (context) => NewsCubit()..getBusiness(),
      child: BlocConsumer<NewsCubit, NewsState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = NewsCubit.get(context);
          return Scaffold(
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
