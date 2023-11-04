import 'package:flutter/material.dart';
import 'package:news_app/cubit/app_cubit.dart';
import 'package:news_app/modules/web_view/web_view_screen.dart';

Widget buildArticleItem(dynamic article, context) => GestureDetector(
  onTap: () {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => WebViewScreen(url: article['url']),),);
  },
  child:   Padding(
  
        padding: const EdgeInsets.all(20.0),
  
        child: Row(
  
          children: [
  
            Container(
  
              width: 120,
  
              height: 120,
  
              decoration: BoxDecoration(
  
                borderRadius: BorderRadius.circular(10),
  
                image: DecorationImage(
  
                  image: NetworkImage(
  
                    '${article['urlToImage']}',
  
                  ),
  
                  fit: BoxFit.cover,
  
                ),
  
              ),
  
            ),
  
            const SizedBox(
  
              width: 20,
  
            ),
  
            Expanded(
  
              child: SizedBox(
  
                height: 120,
  
                child: Column(
  
                  //mainAxisSize: MainAxisSize.min,
  
                  crossAxisAlignment: CrossAxisAlignment.start,
  
                  mainAxisAlignment: MainAxisAlignment.start,
  
                  children: [
  
                    Text(
  
                      '${article['title']}',
  
                      maxLines: 4,
  
                      overflow: TextOverflow.ellipsis,
  
                      style: TextStyle(
  
                          color: AppCubit.get(context).isDark
  
                              ? Colors.white
  
                              : Colors.black,
  
                          fontSize: 18),
  
                    ),
  
                    const SizedBox(
  
                      height: 20,
  
                    ),
  
                    Text(
  
                      '${article['publishedAt']}',
  
                      style: const TextStyle(color: Colors.grey),
  
                    ),
  
                  ],
  
                ),
  
              ),
  
            )
  
          ],
  
        ),
  
      ),
);
Widget articleBuilder(List list, context) => ListView.separated(
    physics: const BouncingScrollPhysics(),
    itemCount: list.length,
    separatorBuilder: (context, index) => Container(
          color: Colors.grey,
          height: 1,
        ),
    itemBuilder: (context, index) => buildArticleItem(list[index], context));
