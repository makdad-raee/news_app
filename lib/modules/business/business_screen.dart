import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/componants/componants.dart';
import 'package:news_app/cubit/news_cubit.dart';
import 'package:news_app/cubit/news_state.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {},
      builder: (context, state) {
        return state is! NewsGetBusinessLoadingState
            ? ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemCount: 12,
                separatorBuilder: (context, index) => Container(
                      color: Colors.grey,
                      height: 1,
                    ),
                itemBuilder: (context, index) => buildArticleItem())
            : const Center(
                child: CircularProgressIndicator(),
              );
      },
    );
  }
}
