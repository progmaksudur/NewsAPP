

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:news_app_with_api/di_locator.dart' as di;
import 'package:news_app_with_api/const/colors.dart';
import 'package:news_app_with_api/providers/app_helper_function_provider.dart';
import 'package:news_app_with_api/providers/app_landing_page_provider.dart';
import 'package:news_app_with_api/providers/new_data_provider.dart';
import 'package:news_app_with_api/views/pages/auth/sign_in_page.dart';
import 'package:news_app_with_api/views/pages/auth/sign_up_page.dart';
import 'package:news_app_with_api/views/pages/details_page/news_details_page.dart';
import 'package:news_app_with_api/views/pages/landing/landing_page.dart';

import 'firebase_options.dart';

import 'package:provider/provider.dart';

import 'views/pages/details_page/fav_news_details.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await di.setupLocator();
  runApp(MultiProvider(
      providers:[
        ChangeNotifierProvider(create: (context)=>di.sl<AppHelperFunctionProvider>()),
        ChangeNotifierProvider(create: (context)=>di.sl<LandingPageProvider>()),
        ChangeNotifierProvider(create: (context)=>di.sl<NewsDataProvider>()),
      ],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: darkBackgroundColor,
        primaryColor: primaryColor,
        bottomAppBarColor: bottomAppBarColor,
        useMaterial3: true,
      ),
      initialRoute: SignInPage.routeName,
      routes: {
        SignInPage.routeName:(context)=>SignInPage(),
        SignUpPage.routeName:(context)=>SignUpPage(),
        LandingPage.routeName:(context)=>LandingPage(),
        NewsDetailsPage.routeName:(context)=>NewsDetailsPage(),
        FavNewsDetailsPage.routeName:(context)=>FavNewsDetailsPage(),

      },
    );
  }
}


