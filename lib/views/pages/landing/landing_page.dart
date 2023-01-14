import 'package:flutter/material.dart';
import 'package:news_app_with_api/di_locator.dart';
import 'package:news_app_with_api/providers/app_helper_function_provider.dart';
import 'package:news_app_with_api/providers/app_landing_page_provider.dart';
import 'package:news_app_with_api/providers/new_data_provider.dart';
import 'package:news_app_with_api/services/auth_services/authentication.dart';
import 'package:news_app_with_api/views/pages/auth/sign_in_page.dart';
import 'package:news_app_with_api/views/widgets/app_bottom_nevigationbar.dart';

import 'package:provider/provider.dart';

class LandingPage extends StatefulWidget {
  static const String routeName="/landing";
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text("Latest News",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 22,color: Colors.lime),),
        actions: [
          IconButton(onPressed: (){
            AuthService.logout();
            Navigator.pushReplacementNamed(context, SignInPage.routeName);

          }, icon: Icon(Icons.logout)),
        ],
      ),
      body: Consumer2<LandingPageProvider,AppHelperFunctionProvider>(
          builder: (context,landingProvider,appHelperProvider,_)=>
              landingProvider.changeLangingPageWidgets(appHelperProvider.selectedIndex)),
      bottomNavigationBar: CustomBottomAppBar(context,true),
    );
  }
}
