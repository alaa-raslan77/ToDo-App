import 'package:flutter/material.dart';

import '../app_colors.dart';

class EditTab extends StatelessWidget {
  static const String routeName ="edit";
  const EditTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          extendBody: true,
          backgroundColor: AppColors.secondary,
          appBar: AppBar(
            backgroundColor: AppColors.primary,
            title: Text("ToDo App"
              ,style: TextStyle(
                  fontSize: 35,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ) ,
            toolbarHeight: 150,
          ),
          ),
        Container(
          margin: EdgeInsets.only(top: 160,left: 30),
          width: 352,
          height: 617,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15)
          ),
          child: Column(
            children: [



            ],
          ),
        ),

      ],
    );
  }
}
