import 'package:flutter/material.dart';
import 'package:todo_app/app_colors.dart';

class AddTask extends StatelessWidget {
  const AddTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("Add New Task",textAlign: TextAlign.center,style: TextStyle(fontSize:25 ,fontWeight:FontWeight.bold),),
             TextFormField( decoration: InputDecoration(
               label: Text("Tiltle"),
               border: OutlineInputBorder(
                 borderRadius: BorderRadius.circular(18)
               )

             ),),
            SizedBox(height: 20,),
            TextFormField( decoration: InputDecoration(
                label: Text("Describtion"),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18)
                )

            ),),
            SizedBox(height: 15,),

            Text("Select Time",
              style: TextStyle(fontSize: 20,
                  fontWeight: FontWeight.w400),
              textAlign: TextAlign.left,),
            SizedBox(height: 15,),
            InkWell(
              onTap: () {
                showDatePicker(
                    context: context,
                    firstDate: firstDate,
                    lastDate: lastDate)
              },
              child: Text("7/7/2002",textAlign: TextAlign.center,
                  style:  TextStyle(fontSize: 15,color: AppColors.primary )),
            ),
            SizedBox(height: 15,),
            ElevatedButton(onPressed: () {},
              style:ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary
              ),
              child: Text("Add Task",style: TextStyle(color: Colors.white),),
            )
          ],
      ),
    ) ;
  }
}
