import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:news_app_with_api/di_locator.dart';
import 'package:news_app_with_api/models/add_fab_model.dart';
import 'package:news_app_with_api/models/news_model.dart';
import 'package:news_app_with_api/providers/new_data_provider.dart';
import 'package:news_app_with_api/views/pages/landing/favourite.dart';
import 'package:news_app_with_api/views/pages/landing/landing_page.dart';
import 'package:news_app_with_api/views/widgets/app_bottom_nevigationbar.dart';

import 'package:url_launcher/url_launcher.dart';

class NewsDetailsPage extends StatefulWidget {
  static const String routeName="/newsdetail";
  const NewsDetailsPage({Key? key}) : super(key: key);

  @override
  State<NewsDetailsPage> createState() => _NewsDetailsPageState();
}

class _NewsDetailsPageState extends State<NewsDetailsPage> {
  Articles? articles;
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    articles=ModalRoute.of(context)!.settings.arguments as Articles;
    print(articles!.title);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text("News Details",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 22,color: Colors.lime),),
        actions: [
          IconButton(onPressed: (){
            final fav=FabNewsModelClass(
                author: articles!.author.toString(),
                title: articles!.title.toString(),
                description: articles!.description.toString(),
                url: articles!.url.toString(),
                urlToImage: articles!.urlToImage.toString(),
                publishedAt: articles!.publishedAt.toString(),
                content: articles!.content.toString(),
                userCreationTime: DateTime.now().toString());
            sl<NewsDataProvider>().addFabnews(fav).then((value) {
              Navigator.pushReplacementNamed(context, LandingPage.routeName);
            } );

          }, icon: Icon(Icons.bookmark_add)),
        ],
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
                      image: NetworkImage(articles!.urlToImage!),
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
            child: Text("${articles!.author}",textAlign: TextAlign.end,style:const TextStyle(fontSize: 14,color: Colors.lightGreenAccent),),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
            child: Text("${articles!.title}",textAlign: TextAlign.start,style:const TextStyle(fontSize: 16,fontWeight: FontWeight.w600,color: Colors.teal),),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 2),
            child: Text("${articles!.description}",style:const TextStyle(fontSize: 14,color: Colors.white54),),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 2),
            child: Text("${articles!.content}",style:const TextStyle(fontSize: 14,color: Colors.white54),),
          ),
          InkWell(
            onTap: ()async{
               Uri url=Uri.parse(articles!.url.toString());
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
              child: Text("${articles!.url}",style:const TextStyle(fontSize: 14,color: Colors.indigo,),),
            ),
          ),



        ],
      ),
      bottomNavigationBar: CustomBottomAppBar(context,false),
    );
  }
}
