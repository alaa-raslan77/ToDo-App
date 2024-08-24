import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/providers/my_provider.dart';
import 'firebase_options.dart';
import 'my_app.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await EasyLocalization.ensureInitialized();
  await FirebaseFirestore.instance.enableNetwork();

  runApp(ChangeNotifierProvider(
      create: (context)=>MyProvider(),
      child: EasyLocalization(
          supportedLocales: [Locale('en'), Locale('ar')],
          path: 'assets/translations',
          startLocale: Locale('en'),
          saveLocale: true,
          child: MyApp())));

}