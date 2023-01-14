

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:news_app_with_api/models/user_model.dart';
import 'package:news_app_with_api/services/repository/db_helper_repo.dart';

class AuthService {
  static final FirebaseAuth _auth = FirebaseAuth.instance;
  static User? get user => _auth.currentUser;

  static Future<bool> login(String email, String password) async {
    final credential = await _auth.signInWithEmailAndPassword(
        email: email, password: password);

    return credential.user != null;
  }

   static Future<void> register(
      String name,
      String email,
      String password,
      ) async {
    final credential = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);

    UserModel userModel = UserModel(
        uid: credential.user!.uid,
        email: email,
        name: name,
        userCreationTime:Timestamp.fromDate(credential.user!.metadata.creationTime!));
    return DBHelperRepo.addUser(userModel);
  }

  static Future<void> addUser(UserModel userModel) => DBHelperRepo.addUser(userModel);

  static Future<void> deleteCurrentUser() => _auth.currentUser!.delete();

  static Future<void> logout() => _auth.signOut();
}