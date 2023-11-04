import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/componants/componants.dart';
import 'package:news_app/cubit/app_cubit.dart';
import 'package:news_app/cubit/app_states.dart';

class SearchScreen extends StatelessWidget {
   SearchScreen({super.key});
  var searchController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppState>(
      listener: (context, state) {
        
      },
      builder: (context, state) {
        var list=AppCubit.get(context).search;
        return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                style:const TextStyle(
                  color: Colors.black,
                ),
                
                controller: searchController,
                
                onChanged: (value) {
                  AppCubit.get(context).getSearch(value);
                },
                validator: (value) {
                  if(value==null){
                    return 'must not be empty ';
                  }
                  return null;
                },
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  hintText: 'Search',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),),),
              ),
            ),
            Expanded(child: articleBuilder(list, context))
          ],
        ),
      );
      },
    );
  }
}