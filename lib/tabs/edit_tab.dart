import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../app_colors.dart';
import '../firebase_functions.dart';
import '../providers/my_provider.dart';
import '../task_model.dart';

class EditTab extends StatefulWidget {

  static const String routeName ="edit";


   EditTab({super.key});

  @override
  State<EditTab> createState() => _EditTabState();
}

class _EditTabState extends State<EditTab> {
  var titleController =TextEditingController();
  var subTitleController =TextEditingController();



  @override
  Widget build(BuildContext context) {
    var pro =Provider.of<MyProvider>(context);
    var model =ModalRoute.of(context)?.settings.arguments as TaskModel;

    // titleController = TextEditingController( text: model.title);
    // subTitleController = TextEditingController( text: model.subTitle);

    return Stack(
      children: [
        Scaffold(

          appBar: AppBar(
            title: Text("toDo app".tr()
            ) ,
            toolbarHeight: 97,
            titleSpacing: 0,
          ),
          body: Stack(
            children: [
              Container(
                width: double.infinity,
                height: 40,
                color: AppColors.primary,
              ),
              Container(

                margin: EdgeInsets.only(left: 30,right: 30),
                width: 352,
                height: 617,
                decoration: BoxDecoration(
                    color:pro.appTheme==ThemeMode.dark?
                    AppColors.darkColor
                        :
                    Colors.white,
                    borderRadius: BorderRadius.circular(15)
                ),
                child:  Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(height: 20,),
                        Text("edit task".tr(),textAlign: TextAlign.center,
                          style:Theme.of(context).textTheme.bodyLarge?.copyWith(color:
                          pro.appTheme==ThemeMode.dark?
                          Colors.white
                              :
                          Colors.black,
                          fontWeight: FontWeight.bold,)),
                        SizedBox(height: 20,),
                        TextFormField(

                          initialValue: model.title,
                         onChanged: (newText){
                            model.title=newText;
                         },
                         //controller: titleController,
                          decoration: InputDecoration(
                           label: Text("new title"),



                        ),),
                        SizedBox(height: 20,),
                        TextFormField(
                         initialValue: model.subTitle,
                          onChanged: (newText){
                            model.subTitle=newText;
                          },
                         // controller: subTitleController,
                          decoration: InputDecoration(
                            label: Text("new subTitle"),



                        ),),
                        SizedBox(height: 15,),

                        Text("Select New Time",
                          style: Theme.of(context).textTheme.bodyMedium,
                          textAlign:context.locale==Locale('en')?
                          TextAlign.left
                              :
                          TextAlign.right,),
                        SizedBox(height: 30,),
                        InkWell(
                          onTap: () {
                            selectDateFun(model);
                          },
                          child: Text(
                          DateTime.fromMicrosecondsSinceEpoch(model.date).toString().substring(0,10)
                              ,textAlign: TextAlign.center,
                              style:  TextStyle(fontSize: 15,color: AppColors.primary )),
                        ),
                        SizedBox(height: 60,),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 50),
                          child: ElevatedButton(onPressed: () {
                            DateTime dateTime = DateTime.fromMicrosecondsSinceEpoch(model.date);
                               model.title=model.title;
                               model.subTitle=model.subTitle;
                               model.date= DateUtils.dateOnly(dateTime).microsecondsSinceEpoch;

                            FirebaseFunctions.updateTask(model);
                            Navigator.pop(context);

                          },
                            style:ElevatedButton.styleFrom(
                              minimumSize: Size.fromRadius(25)
                            ),
                            child: Text("save changes".tr(),style: GoogleFonts.inter(
                              fontSize: 18,fontWeight: FontWeight.w400,color: Colors.white
                            )),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
         ),
      ],
    );
  }

  selectDateFun(TaskModel taskmodel)async{
    DateTime? chodenDate = await showDatePicker(
        context: context,
        builder: (context, child) => Theme(
          data: Theme.of(context).copyWith(colorScheme: ColorScheme.light(
            primary: AppColors.primary,
          )),
          child:child! ,
        ),
        initialDate: DateTime.fromMicrosecondsSinceEpoch(taskmodel.date),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(Duration(days: 365)));
    if(chodenDate!=null){
      taskmodel.date=chodenDate.microsecondsSinceEpoch;
      setState(() {});

    }
  }
}
