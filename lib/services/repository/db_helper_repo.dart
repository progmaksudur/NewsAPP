import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:news_app_with_api/models/add_fab_model.dart';
import 'package:news_app_with_api/models/user_model.dart';
import 'package:news_app_with_api/views/pages/landing/favourite.dart';

class DBHelperRepo {

  static final FirebaseFirestore _db = FirebaseFirestore.instance;

  static String collectionUsers = "User";
  static String collectionFavNews = "Favourite_News";



   static Future<void> addUser(UserModel userModel) {
    return _db
        .collection(collectionUsers)
        .doc(userModel.uid)
        .set(userModel.toMap());
  }
  static Future<void> addToFab(String uid, FabNewsModelClass favNews) {
    return _db
        .collection(collectionUsers)
        .doc(uid)
        .collection(collectionFavNews)
        .doc(favNews.userCreationTime)
        .set(favNews.toMap());
  }
  static Stream<QuerySnapshot<Map<String, dynamic>>> getAllFavNews(
      String uid) =>
      _db
          .collection(collectionUsers)
          .doc(uid)
          .collection(collectionFavNews)
          .snapshots();




}