import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/app_colors.dart';

import '../bottom_sheets/language_bottom_sheet.dart';
import '../bottom_sheets/theme_bottom_sheet.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 40,left: 40,top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text("Language",style:
          Theme.of(context).textTheme.bodySmall?.copyWith(fontWeight: FontWeight.bold)),
          SizedBox(height: 20 ,),
          GestureDetector(
            onTap: () {
      showModalBottomSheet(context: context,
        isDismissible: false,
        isScrollControlled: true,
        builder: (context) {
          return ThemeBottomSheet();
        },);
      },
            child: Container(
              width: 319,
              height: 48,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  top: BorderSide(color: AppColors.primary),
                  left: BorderSide(color: AppColors.primary),
                  right: BorderSide(color: AppColors.primary),
                  bottom: BorderSide(color: AppColors.primary)
                )
              ),
              child: Row(
                children: [
                  SizedBox(width: 20,),
                  Text("English",style: GoogleFonts.inter(color: AppColors.primary,
                  fontSize: 14,fontWeight: FontWeight.w400),),
                  Spacer(),
                  IconButton(onPressed: () {},
                      icon: Icon(Icons.keyboard_arrow_down))
                ],
              ),
            ),
          ),
          SizedBox(height: 20,),
          Text("Mode",style: GoogleFonts.poppins(
              color: Colors.black,
              fontWeight: FontWeight.w700,
              fontSize: 14),),
          SizedBox(height: 20 ,),
          GestureDetector(
            onTap: () {
              showModalBottomSheet(context: context,
                isDismissible: false,
                isScrollControlled: true,
                builder: (context) {
                  return LanguageBottomSheet();
                },);
            },
            child: Container(
              width: 319,
              height: 48,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                      top: BorderSide(color: AppColors.primary),
                      left: BorderSide(color: AppColors.primary),
                      right: BorderSide(color: AppColors.primary),
                      bottom: BorderSide(color: AppColors.primary)
                  )
              ),
              child: Row(
                children: [
                  SizedBox(width: 20,),
                  Text("Light",style: GoogleFonts.inter(color: AppColors.primary,
                      fontSize: 14,fontWeight: FontWeight.w400),),
                  Spacer(),
                  IconButton(onPressed: () {},
                      icon: Icon(Icons.keyboard_arrow_down))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
