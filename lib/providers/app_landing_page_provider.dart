import 'package:flutter/material.dart';
import 'package:news_app_with_api/views/pages/landing/favourite.dart';
import 'package:news_app_with_api/views/pages/landing/news.dart';


class LandingPageProvider extends ChangeNotifier {

  Widget changeLangingPageWidgets(int index){
    if(index==1){
      return FavouriteNews();
    }
    else{
      return NewsPart();
    }
  }
  onPressedIconData(){


  }


}