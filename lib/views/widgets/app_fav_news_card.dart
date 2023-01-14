



import 'package:flutter/material.dart';
import 'package:news_app_with_api/models/add_fab_model.dart';

class FavNewsCard extends StatelessWidget {
  FabNewsModelClass articles;
  Function() onPressed;

  FavNewsCard({required this.articles,required this.onPressed,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding:const EdgeInsets.symmetric(horizontal: 12,vertical: 8),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white30.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("${articles.title}",style:const TextStyle(fontSize: 13,fontWeight: FontWeight.w500,color: Colors.teal),),
            Text("${articles.publishedAt}",style:const TextStyle(fontSize: 10,color: Colors.white54),),
            Text("${articles.author}",style:const TextStyle(fontSize: 12,color: Colors.amberAccent),),
            FadeInImage(
              image: NetworkImage(articles.urlToImage.toString()),
              fit: BoxFit.cover,
              height: 120,
              width: double.infinity,
              placeholder: const AssetImage(
                  "asset/images/placeholder.png"
              ),
              placeholderFit: BoxFit.fitHeight,

            )
          ],
        ),
      ),
    );
  }
}