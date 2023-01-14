import 'package:flutter/material.dart';
import 'package:news_app_with_api/providers/new_data_provider.dart';
import 'package:news_app_with_api/views/pages/details_page/fav_news_details.dart';
import 'package:news_app_with_api/views/pages/details_page/news_details_page.dart';
import 'package:news_app_with_api/views/widgets/app_fav_news_card.dart';
import 'package:news_app_with_api/views/widgets/app_news_cards.dart';

import 'package:provider/provider.dart';

class FavouriteNews extends StatefulWidget {
  const FavouriteNews({Key? key}) : super(key: key);

  @override
  State<FavouriteNews> createState() => _FavouriteNewsState();
}


class _FavouriteNewsState extends State<FavouriteNews> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    final provider=Provider.of<NewsDataProvider>(context,listen: false);
    provider.getAllFavNews();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<NewsDataProvider>(
      builder: (context,nwProvider,_){
        final list =nwProvider.favnewslList;

        return list==null?SizedBox(width: double.infinity,height: 100,child: Center(child: Text("Loading Data"),),):ListView.builder(
            itemCount: list.length,
            shrinkWrap: true,
            itemBuilder: (context, iteam) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: FavNewsCard(
                  articles: list[iteam], onPressed: () {
                  Navigator.pushNamed(context, FavNewsDetailsPage.routeName,arguments: list[iteam]);
                },),
              );
            });

      },

    );;
  }
}
