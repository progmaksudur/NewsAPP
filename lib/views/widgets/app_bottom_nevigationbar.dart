import 'package:flutter/material.dart';
import 'package:news_app_with_api/providers/app_helper_function_provider.dart';
import 'package:news_app_with_api/views/pages/landing/landing_page.dart';

import 'package:provider/provider.dart';

Widget CustomBottomAppBar(BuildContext context,bool isLandingPage){
  return  BottomAppBar(
    clipBehavior: Clip.antiAliasWithSaveLayer,
    notchMargin: 6,
    shape: const CircularNotchedRectangle(),
    child: Consumer<AppHelperFunctionProvider>(
      builder: (context,provider,_)=>BottomNavigationBar(
        currentIndex: provider.selectedIndex,
        selectedItemColor: isLandingPage==true?Colors.lime:Colors.white60,
        unselectedItemColor:Colors.white60,
        onTap: (value){
          provider.changeBottomAppbarIndex(value);
          if(isLandingPage==false){
          Navigator.pushReplacementNamed(context, LandingPage.routeName);
          }

        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.newspaper),label: "News"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_outline_sharp),label: "Favourite")
        ],

      ),
    ),

  );


}