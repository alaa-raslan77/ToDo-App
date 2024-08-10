import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/firebase_functions.dart';
import '../app_colors.dart';
import '../task_item.dart';

class TasksTab extends StatefulWidget {
  const TasksTab({super.key});
  @override
  State<TasksTab> createState() => _TasksTabState();
}

class _TasksTabState extends State<TasksTab> {
  DateTime date=DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [


        CalendarTimeline(
          initialDate: date,
          firstDate: DateTime.now().subtract( Duration(days: 365)),
          lastDate: DateTime.now().add( Duration(days: 365)),
          onDateSelected: (dateTime) {
            date=dateTime;
            setState(() {});

          },
          leftMargin: 20,
          monthColor: AppColors.gray,
          dayColor: AppColors.primary,
          dotColor: Colors.white,
          activeDayColor: Colors.white,
          activeBackgroundDayColor: AppColors.primary,
          //dotsColor: Color(0xFF333A47),
          selectableDayPredicate: (date) => date.day != 23,
          locale: context.locale==Locale('en')?
          'en':'ar',
        ),
        SizedBox(height: 24,),
        StreamBuilder(
            stream: FirebaseFunctions.getTasks(date),
            builder: (context, snapshot) {

              if (snapshot.connectionState==ConnectionState.waiting){
                return CircularProgressIndicator();
              }
              if(snapshot.hasError){
                return Center(
                  child: Column(
                    children: [
                      Text("Something went wrong"),
                      ElevatedButton(onPressed: () {},
                          child: Text("Try Again"))
                    ],
                  ),
                );

              }
              var tasks =snapshot.data?.docs.map((doc)=>doc.data()).toList()??[];

              if (tasks.isEmpty){
                return Center(child: Text("No Tasks"));
              }
              return    Expanded(
                child: ListView.separated(itemBuilder:
                    (context, index) {
                  return TaskItem(taskModel: tasks[index],);

                },separatorBuilder: (context, index) => SizedBox(height: 12,),
                  itemCount: tasks.length,
              ),
            );
           }
        ,)
      ],
    );
  }
}
