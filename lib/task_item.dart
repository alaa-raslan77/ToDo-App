import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:todo_app/app_colors.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12),
      height: 115,
      width: double.infinity,
       decoration: BoxDecoration(
           color: Colors.white,

         borderRadius: BorderRadius.circular(25)
       ),
      child: Slidable(
        startActionPane: ActionPane(motion: DrawerMotion(),

            children: [SlidableAction(onPressed: (context) {},
              label: "Delete",
              backgroundColor: Colors.red,
              icon: Icons.delete,
              autoClose: false,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(25),bottomLeft: Radius.circular(25)),
              spacing: 10,),
              SlidableAction(onPressed: (context) {},
                  label: "Edite",
                  backgroundColor: AppColors.primary,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(25),bottomRight: Radius.circular(25)),
                  icon: Icons.edit,
                  autoClose: false,

                  spacing: 10)]),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(children: [
            Container(
              height: 62,
              width: 3,
              decoration: BoxDecoration(
                  color: AppColors.primary,
                borderRadius: BorderRadius.circular(25)
              ),
            ),
            SizedBox(width: 15,),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text("Text Title ",style:  TextStyle(fontSize: 15,color: AppColors.primary ),),
              Text("Task Describtion",style:  TextStyle(fontSize: 15,color: AppColors.gray ),)
            ],),
            Spacer(),
            ElevatedButton(onPressed: () {}, style:
            ElevatedButton.styleFrom(backgroundColor: AppColors.primary)
                ,child: Icon(Icons.done,color: Colors.white,size: 30,))
          ],),
        ),
      ),
    );
  }
}
