import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/my_theme_data.dart';
import 'package:todo_app/providers/my_provider.dart';
import 'package:todo_app/register/log_in.dart';
import 'package:todo_app/register/sign_up.dart';
import 'package:todo_app/tabs/edit_tab.dart';
import 'home_screen.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var pro =Provider.of<MyProvider>(context);
    pro.getTheme();
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      theme: MyThemeData.lightTheme,
      darkTheme: MyThemeData.darkTheme,
      themeMode: pro.appTheme,
      initialRoute:pro.firebaseUser!=null?
      HomeScreen.routeName :LogIn.routeName,
      routes: {
        HomeScreen.routeName:(context)=>HomeScreen(),
        EditTab.routeName:(context)=>EditTab(),
        LogIn.routeName:(context)=>LogIn(),
        SignUp.routeName:(context)=>SignUp(),

      },
    );
  }
}
