import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/app_colors.dart';
import 'package:todo_app/firebase_functions.dart';
import 'package:todo_app/providers/my_provider.dart';
import 'package:todo_app/tabs/edit_tab.dart';
import 'package:todo_app/task_model.dart';

class TaskItem extends StatelessWidget {
  TaskModel taskModel;
   TaskItem({super.key,required this.taskModel});

  @override
  Widget build(BuildContext context) {
    var pro =Provider.of<MyProvider>(context);

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12),
      height: 115,
      width: double.infinity,
       decoration: BoxDecoration(
           color:pro.appTheme==ThemeMode.dark?
           AppColors.darkColor
               :
           Colors.white,

         borderRadius: BorderRadius.circular(25)
       ),
      child: Slidable(
        startActionPane: ActionPane(motion: DrawerMotion(),

            children: [SlidableAction(onPressed: (context) {
              FirebaseFunctions.deleteTask(taskModel.id);
            },
              label: "delete".tr(),
              backgroundColor: Colors.red,
              icon: Icons.delete,
              autoClose: false,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(25),bottomLeft: Radius.circular(25)),
              spacing: 10,),
              SlidableAction(onPressed: (context) {
               Navigator.pushNamed(context, EditTab.routeName,
                   arguments:TaskModel(title:taskModel.title , subTitle: taskModel.subTitle, date: taskModel.date,
                     id: taskModel.id,userId:  FirebaseAuth.instance.currentUser!.uid
                  ));
              },
                  label: "edit".tr(),
                  backgroundColor: AppColors.primary,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(25),bottomRight: Radius.circular(25)),
                  icon: Icons.edit,
                  autoClose: false,
                  spacing: 10,)]),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(children: [
            Container(
              height: 62,
              width: 3,
              decoration: BoxDecoration(
                  color:taskModel.isDone?
                      Colors.green
                  :
                  AppColors.primary,
                borderRadius: BorderRadius.circular(25)
              ),
            ),
            SizedBox(width: 15,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text(taskModel.title,style:  TextStyle(fontSize: 15,color: taskModel.isDone?
              Colors.green
                  :AppColors.primary ),),
              Text(taskModel.subTitle,style:  TextStyle(fontSize: 15,color: AppColors.gray ),)
            ],),
            Spacer(),
            taskModel.isDone?
            Text("Done!!",style: TextStyle(color: Colors.green,fontSize: 22,fontWeight: FontWeight.w700),)

                :
            ElevatedButton(onPressed: () {
              taskModel.isDone=true;
              FirebaseFunctions.updateTask(taskModel);
            }, style:
            ElevatedButton.styleFrom(backgroundColor: AppColors.primary)
                ,child: Icon(Icons.done,color: taskModel.isDone?
                Colors.green
                    :Colors.white,size: 30,))
           ],
          ),
        ),
      ),
    );
  }
}
