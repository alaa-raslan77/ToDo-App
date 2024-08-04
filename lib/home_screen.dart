import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/app_colors.dart';
import 'package:todo_app/bottom_sheets/add_task.dart';
import 'package:todo_app/tabs/settings_tab.dart';
import 'package:todo_app/tabs/tasks_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName ="home";

  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex =0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: AppColors.secondary,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Text("ToDo App",style: TextStyle(
            fontSize: 35,
            color: Colors.white,
        fontWeight: FontWeight.bold),
      ) ,
        toolbarHeight: 120,
    ),
      floatingActionButtonLocation:
      FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        onPressed: () {
          showModalBottomSheet(context: context, builder: (context) =>
              Padding(
                padding:  EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                child: AddTask(),
              ),
          isDismissible: false,
          isScrollControlled: true,
           );
        },
        child: Icon(Icons.add,color: Colors.white,),
        shape: RoundedRectangleBorder(
          borderRadius:
          BorderRadius.circular(30),
            side: BorderSide(color: Colors.white,width: 4)
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        //color: Colors.white,

        notchMargin: 12,
        padding: EdgeInsets.zero,
        shape: CircularNotchedRectangle(),
        child: BottomNavigationBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          selectedItemColor: AppColors.primary,
          unselectedItemColor: AppColors.gray,

          currentIndex: 0,
          onTap: (value){
            selectedIndex=value;
            setState(() {});
          },

          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings_outlined),label: "Settings"),
          ],
        ),
      ),
      body: tabs[selectedIndex],




    );
  }
  List<Widget>tabs=[
    TasksTab(),
    SettingsTab()
  ];
}
