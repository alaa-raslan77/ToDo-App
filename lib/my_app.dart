import 'package:flutter/material.dart';
import 'package:todo_app/tabs/edit_tab.dart';

import 'home_screen.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName:(context)=>HomeScreen(),
        EditTab.routeName:(context)=>EditTab(),

      },
    );
  }
}
