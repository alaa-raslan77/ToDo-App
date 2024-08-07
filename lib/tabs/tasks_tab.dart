import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../app_colors.dart';
import '../task_item.dart';

class TasksTab extends StatelessWidget {
  const TasksTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [


        CalendarTimeline(
          initialDate: DateTime.now(),
          firstDate: DateTime.now().subtract( Duration(days: 365)),
          lastDate: DateTime.now().add( Duration(days: 365)),
          onDateSelected: (date) => print(date),
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
        Expanded(
          child: ListView.separated(itemBuilder:
          (context, index) {
            return TaskItem();
          
          },separatorBuilder: (context, index) => SizedBox(height: 12,),
            itemCount: 30,
          ),
        )

      ],
    );
  }
}
