import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:news_app_with_api/models/add_fab_model.dart';
import 'package:news_app_with_api/models/news_model.dart';
import 'package:news_app_with_api/services/auth_services/authentication.dart';
import 'package:news_app_with_api/services/repository/db_helper_repo.dart';
import 'package:news_app_with_api/services/repository/fatch_news.dart';


class NewsDataProvider extends ChangeNotifier{

  GetNewsRepo getNewsRepo;


  NewsDataProvider({required this.getNewsRepo});

  bool _isLoading=false;
  bool get isLoading=>_isLoading;
  List<Articles>? _articalList;
  List<FabNewsModelClass>? _favnewslList;
  NewsModel? newsModel;
  List<Articles>? get articalList=>_articalList;
  List<FabNewsModelClass>? get favnewslList=>_favnewslList;

  Future<void> getNews()async{

    _isLoading=true;

    Response apiResponse = await getNewsRepo.getNews();

    if (apiResponse != null && apiResponse.statusCode == 200) {
      _isLoading=false;
      newsModel = NewsModel.fromJson(apiResponse.data);
      _articalList = newsModel!.articles;
      print("+++++++  ${articalList!.length}");
      notifyListeners();
    }
    else{
      print("Cant Fatch data");
    }

    notifyListeners();

  }
  Future<void> addFabnews(FabNewsModelClass newsModel) => DBHelperRepo.addToFab(AuthService.user!.uid,newsModel);

  getAllFavNews(){
    DBHelperRepo.getAllFavNews(AuthService.user!.uid).listen((event) {
      _favnewslList = List.generate(event.docs.length, (index) => FabNewsModelClass.fromMap(event.docs[index].data()));
      notifyListeners();
    });}


}