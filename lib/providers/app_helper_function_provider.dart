import 'package:flutter/material.dart';

class AppHelperFunctionProvider extends ChangeNotifier{
  String? emailError;
  String? passwordError;
  String? nameError;



  String? validetion(RegExp regExp,String value,String? errorMessage){
    if(value.isEmpty){
      return "This field must not be empty";
    }
    else{
      final bool valid =regExp.hasMatch(value);
      if(valid==false){
        return errorMessage??"Please enter valid email";
      }
      else{
        return null;
      }
    }
  }

  ///Bottom AppBar
  int selectedIndex=0;
  Color? floatAccButtonColor;

  void changeBottomAppbarIndex(int value){
    selectedIndex=value;
    notifyListeners();
  }






}