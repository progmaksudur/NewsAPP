import 'package:flutter/material.dart';
import 'package:news_app_with_api/models/news_model.dart';
import 'package:news_app_with_api/providers/new_data_provider.dart';
import 'package:news_app_with_api/views/pages/details_page/news_details_page.dart';
import 'package:news_app_with_api/views/widgets/app_news_cards.dart';

import 'package:provider/provider.dart';

class NewsPart extends StatefulWidget {
  const NewsPart({Key? key}) : super(key: key);

  @override
  State<NewsPart> createState() => _NewsPartState();
}

class _NewsPartState extends State<NewsPart> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final provider=Provider.of<NewsDataProvider>(context,listen: false);
    provider.getNews();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<NewsDataProvider>(
      builder: (context,nwProvider,_){
        final list =nwProvider.articalList;

        return list==null?SizedBox(width: double.infinity,height: 100,child: Center(child: Text("Loading Data"),),):ListView.builder(
            itemCount: list.length,
            shrinkWrap: true,
            itemBuilder: (context, iteam) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: NewsCard(
                  articles: list[iteam], onPressed: () {
                  Navigator.pushNamed(context, NewsDetailsPage.routeName,arguments: list[iteam]);
                },),
              );
            });

      },

    );
  }
}

// List<Articles> list = [
//   Articles(
//       author: "Brian Mcvicar",
//       title: "High tea cafe serving British treats opening in Grand Rapids",
//       description:
//           "Featuring crushed red velvet booths, the business, expected to open in early March, seeks to create an “elegant” afternoon tea experience.",
//       url:
//           "https://www.mlive.com/news/2023/01/high-tea-cafe-serving-british-treats-opening-in-grand-rapids.html",
//       urlToImage:
//           "https://www.mlive.com/resizer/zc2t5a4drp--2uWdqudrgi2jSME=/1280x0/smart/cloudfront-us-east-1.images.arcpublishing.com/advancelocal/X2QHFGSIRRA23AZUELIWMJVKSA.jpg",
//       publishedAt: "2023-01-11T15:40:05Z",
//       content:
//           "台灣醒報記者呂翔禾綜合報導】通膨讓各國政府都面臨高民怨！孟加拉在全國10個城市11日爆發嚴重抗議，反對黨民眾呼籲無法處理高物價的總理哈西娜下台，並舉行選舉，反對派也批評政府箝制言論自由、打壓異己。孟加拉因通膨出現糧食價格高漲，政府雖有發給窮苦民眾食物，但仍無法平息民怨。 ##政府無能處理通膨 根據《[半島電視台]( https://www.aljazeera.com/news/2023/1/11/thousands-in-bangladesh-rally-in-anti-government-demonstra…",
//       ),
//   Articles(
//       author: "Brian Mcvicar",
//       title: "High tea cafe serving British treats opening in Grand Rapids",
//       description:
//       "Featuring crushed red velvet booths, the business, expected to open in early March, seeks to create an “elegant” afternoon tea experience.",
//       url:
//       "https://www.mlive.com/news/2023/01/high-tea-cafe-serving-british-treats-opening-in-grand-rapids.html",
//       urlToImage:
//       "https://www.mlive.com/resizer/zc2t5a4drp--2uWdqudrgi2jSME=/1280x0/smart/cloudfront-us-east-1.images.arcpublishing.com/advancelocal/X2QHFGSIRRA23AZUELIWMJVKSA.jpg",
//       publishedAt: "2023-01-11T15:40:05Z",
//       content:
//       "台灣醒報記者呂翔禾綜合報導】通膨讓各國政府都面臨高民怨！孟加拉在全國10個城市11日爆發嚴重抗議，反對黨民眾呼籲無法處理高物價的總理哈西娜下台，並舉行選舉，反對派也批評政府箝制言論自由、打壓異己。孟加拉因通膨出現糧食價格高漲，政府雖有發給窮苦民眾食物，但仍無法平息民怨。 ##政府無能處理通膨 根據《[半島電視台]( https://www.aljazeera.com/news/2023/1/11/thousands-in-bangladesh-rally-in-anti-government-demonstra…",
//       ),
// ];
