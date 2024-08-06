import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../app_colors.dart';

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
    return Stack(
      children: [
        Scaffold(
          appBar: AppBar(
            title: Text("ToDo App"
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
                margin: EdgeInsets.only(left: 30),
                width: 352,
                height: 617,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)
                ),
                child:  Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: 20,),
                      Text("Edit Task",textAlign: TextAlign.center,
                        style:GoogleFonts.poppins(fontSize: 18,
                          fontWeight: FontWeight.w700,)),
                      SizedBox(height: 20,),
                      TextFormField( decoration: InputDecoration(
                          label: Text("Tiltle"),

                      ),),
                      SizedBox(height: 20,),
                      TextFormField( decoration: InputDecoration(
                          label: Text("Describtion"),


                      ),),
                      SizedBox(height: 15,),

                      Text("Select Time",
                        style: TextStyle(fontSize: 20,
                            fontWeight: FontWeight.w400),
                        textAlign: TextAlign.left,),
                      SizedBox(height: 15,),
                      InkWell(
                        onTap: () {
                          selectDateFun();
                        },
                        child: Text(selectedDate.toString().substring(0,10),textAlign: TextAlign.center,
                            style:  TextStyle(fontSize: 15,color: AppColors.primary )),
                      ),
                      SizedBox(height: 70,),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 50),
                        child: ElevatedButton(onPressed: () {},
                          style:ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary,
                            minimumSize: Size.fromRadius(25)
                          ),
                          child: Text("Save Changes",style: GoogleFonts.inter(
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
