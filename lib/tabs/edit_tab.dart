import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../app_colors.dart';
import '../providers/my_provider.dart';

class EditTab extends StatefulWidget {
  static const String routeName ="edit";
   EditTab({super.key});

  @override
  State<EditTab> createState() => _EditTabState();
}

class _EditTabState extends State<EditTab> {

  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    var pro =Provider.of<MyProvider>(context);

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
                      TextFormField( decoration: InputDecoration(
                          label: Text("title".tr()),

                      ),),
                      SizedBox(height: 20,),
                      TextFormField( decoration: InputDecoration(
                          label: Text("describtion".tr()),


                      ),),
                      SizedBox(height: 15,),

                      Text("select time".tr(),
                        style: Theme.of(context).textTheme.bodyMedium,
                        textAlign:context.locale==Locale('en')?
                        TextAlign.left
                            :
                        TextAlign.right,),
                      SizedBox(height: 30,),
                      InkWell(
                        onTap: () {
                          selectDateFun();
                        },
                        child: Text(selectedDate.toString().substring(0,10),textAlign: TextAlign.center,
                            style:  TextStyle(fontSize: 15,color: AppColors.primary )),
                      ),
                      SizedBox(height: 60,),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 50),
                        child: ElevatedButton(onPressed: () {},
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
            ],
          ),
          ),
      ],
    );
  }

  selectDateFun()async{
    DateTime? chosenDate = await showDatePicker(
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
    if(chosenDate!=null){
      selectedDate=chosenDate;
      setState(() {});

    }
  }
}
