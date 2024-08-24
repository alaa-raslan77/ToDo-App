import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/firebase_functions.dart';
import 'package:todo_app/user_model.dart';

class MyProvider extends ChangeNotifier{

  UserModel? userModel;
  User? firebaseUser;

  MyProvider(){
  firebaseUser=FirebaseAuth.instance.currentUser;
  if(firebaseUser!= null){
    initUser();
  }

  }

  initUser()async{
  userModel=await FirebaseFunctions.readUserData();
  notifyListeners();

  }
  ThemeMode appTheme = ThemeMode.light;
  Future<void> getTheme ()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? isDark = prefs.getBool('isDark');
    if (isDark!=null){
      if(isDark == true){
        appTheme = ThemeMode.dark;
      }
      else {
        appTheme = ThemeMode.light;
      }
      notifyListeners();
    }
  }

  Future<void> changeTheme(ThemeMode themeMode)async{
    appTheme=themeMode;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDark', appTheme == ThemeMode.dark);

    notifyListeners();

  }



  }







