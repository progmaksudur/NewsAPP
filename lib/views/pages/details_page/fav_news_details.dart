


import 'package:flutter/material.dart';
import 'package:news_app_with_api/models/add_fab_model.dart';
import 'package:news_app_with_api/views/widgets/app_bottom_nevigationbar.dart';
import 'package:url_launcher/url_launcher.dart';

class FavNewsDetailsPage extends StatefulWidget {
  static const String routeName="/favnewsdetail";
  const FavNewsDetailsPage({Key? key}) : super(key: key);

  @override
  State<FavNewsDetailsPage> createState() => _FavNewsDetailsPageState();
}

class _FavNewsDetailsPageState extends State<FavNewsDetailsPage> {
  FabNewsModelClass? fabNewsModelClass;

  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    fabNewsModelClass=ModalRoute.of(context)!.settings.arguments as FabNewsModelClass;
    print(fabNewsModelClass!.title);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text("Favourite News Details",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 22,color: Colors.lime),),

      ),
      body: ListView(
        children: [
          Card(
              color: Colors.white54,
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: FadeInImage(
                        image: NetworkImage(fabNewsModelClass!.urlToImage),
                        fit: BoxFit.cover,
                        height: 200,
                        width: double.infinity,
                        placeholderFit: BoxFit.fitHeight,
                        placeholder:const AssetImage(
                            "asset/images/placeholder.png"
                        )
                    )),
              )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 2),
            child: Text("${fabNewsModelClass!.author}",textAlign: TextAlign.end,style:const TextStyle(fontSize: 14,color: Colors.lightGreenAccent),),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
            child: Text("${fabNewsModelClass!.title}",textAlign: TextAlign.start,style:const TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.teal),),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 2),
            child: Text("${fabNewsModelClass!.description}",style:const TextStyle(fontSize: 14,color: Colors.white54),),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 2),
            child: Text("${fabNewsModelClass!.content}",style:const TextStyle(fontSize: 14,color: Colors.white54),),
          ),
          InkWell(
            onTap: ()async{
              Uri url=Uri.parse(fabNewsModelClass!.url.toString());
              if (!await launchUrl(
                url,
                mode: LaunchMode.inAppWebView,
                webViewConfiguration: const WebViewConfiguration(enableDomStorage: false),
              )) {
                throw 'Could not launch $url';
              }

            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 2),
              child: Text("${fabNewsModelClass!.url}",style:const TextStyle(fontSize: 14,color: Colors.indigo,),),
            ),
          ),



        ],
      ),
      bottomNavigationBar: CustomBottomAppBar(context,false),
    );
  }
}



