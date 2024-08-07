import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/app_colors.dart';
import '../providers/my_provider.dart';

class AddTask extends StatefulWidget {
  AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  DateTime selectedDate = DateTime.now();

  
  @override
  Widget build(BuildContext context) {
    var pro =Provider.of<MyProvider>(context);

    return Container(
      decoration: BoxDecoration(
        color:  pro.appTheme==ThemeMode.dark?
        AppColors.darkColor
            :
        Colors.white,
        borderRadius: BorderRadius.only(topRight: Radius.circular(25),topLeft:Radius.circular(25) )
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text("add new task".tr(),textAlign: TextAlign.center,style: Theme.of(context).textTheme.bodyLarge),
               TextFormField( decoration: InputDecoration(
                 label: Text("title".tr()),
                 border: OutlineInputBorder(
                   borderRadius: BorderRadius.circular(18)
                 )

               ),),
              SizedBox(height: 20,),
              TextFormField( decoration: InputDecoration(
                  label: Text("describtion".tr()),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18)
                  )
              ),),
              SizedBox(height: 15,),
              Text("select time".tr(),
                style: TextStyle(fontSize: 20,
                    fontWeight: FontWeight.w400),
                textAlign:context.locale==Locale('en')?
                TextAlign.left
                :
                TextAlign.right
                ,),
              SizedBox(height: 15,),
              InkWell(
                onTap: () {
                  selectDateFun();
                },
                child: Text(selectedDate.toString().substring(0,10),textAlign: TextAlign.center,
                    style:  TextStyle(fontSize: 15,color: AppColors.primary )),
              ),
              SizedBox(height: 15,),
              ElevatedButton(onPressed: () {},
                child: Text("add task".tr(),style: TextStyle(color: Colors.white),),
              )
            ],
        ),
      ),
    ) ;
  }

  selectDateFun()async{
    DateTime? chodenDate = await showDatePicker(
        context: context,
        builder: (context, child) => Theme(
          data: Theme.of(context).copyWith(colorScheme: ColorScheme.light(
              primary: AppColors.primary,
          )),
          child:child! ,
        ),
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));
    if(chodenDate!=null){
      selectedDate=chodenDate;
      setState(() {});

    }
  }
}
