import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/app_colors.dart';
import 'package:todo_app/bottom_sheets/add_task.dart';
import 'package:todo_app/providers/my_provider.dart';
import 'package:todo_app/register/log_in.dart';
import 'package:todo_app/tabs/settings_tab.dart';
import 'package:todo_app/tabs/tasks_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName ="home";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex =0;

  @override
  Widget build(BuildContext context) {
    var pro =Provider.of<MyProvider>(context);

    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: Text(selectedIndex==0?
          "ToDo App ${pro.userModel?.userName}"
            :
          "settings".tr()

      ) ,
        actions: [
          IconButton(onPressed: () {
            FirebaseAuth.instance.signOut();
            Navigator.pushNamedAndRemoveUntil(
              context, LogIn.routeName , (route) => false,);}, icon: Icon(Icons.logout))
        ],
    ),
      floatingActionButtonLocation:
      FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor:pro.appTheme==ThemeMode.dark?
        AppColors.primaryDark:AppColors.primary,
        onPressed: () {
          showModalBottomSheet(context: context, builder: (context) =>
              Padding(
                padding:  EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                child: AddTask(),
              ),
          isDismissible: true,
          isScrollControlled: true,
           );
        },
        child:const Icon(Icons.add,color: Colors.white,),
        shape: RoundedRectangleBorder(
          borderRadius:
          BorderRadius.circular(30),
            side:const BorderSide(color: Colors.white,width: 4)
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        notchMargin: 12,
        padding: EdgeInsets.zero,
        shape: const CircularNotchedRectangle(),
        child: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: (value){
            selectedIndex=value;
            setState(() {});
          },

          items:  [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),label: "home".tr()),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings_outlined),label: "settings".tr()),
          ],
        ),
      ),
      body: tabs[selectedIndex],




    );
  }
  List<Widget>tabs= const[
    TasksTab(),
    SettingsTab()
  ];
}
