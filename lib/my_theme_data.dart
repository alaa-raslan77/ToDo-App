import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

class MyThemeData{


  static ThemeData lightTheme =ThemeData(
    scaffoldBackgroundColor: AppColors.secondary,
    appBarTheme: AppBarTheme(

      backgroundColor: AppColors.primary,
      toolbarHeight: 120,
      iconTheme: IconThemeData(
        color: AppColors.secondary,
        size: 30,
      ),
      titleTextStyle: TextStyle(
          fontSize: 35,
          color: Colors.white,
          fontWeight: FontWeight.bold),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 0,

      backgroundColor: Colors.transparent,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: AppColors.gray,


    ),
    bottomAppBarTheme: BottomAppBarTheme(
      color: Colors.white
    ),
    iconTheme: IconThemeData(
      color: AppColors.primary,
      size:30
    ),
    textTheme: TextTheme(
      bodySmall:GoogleFonts.poppins(
          color: Colors.black,
          fontWeight: FontWeight.w700,
          fontSize: 15),
      bodyMedium: GoogleFonts.poppins(
          color: Colors.black,
          fontWeight: FontWeight.w400,
          fontSize: 20),
      bodyLarge: GoogleFonts.poppins(
          color: Colors.black,
          fontWeight: FontWeight.normal,
          fontSize: 25)
    ),
    colorScheme: ColorScheme(
      onSurface:AppColors.primary ,
      surface:AppColors.primary ,
      primary: AppColors.primary,
      onPrimary:AppColors.primary ,
      onError:AppColors.primary ,
      error: AppColors.primary,
      secondary:AppColors.primary ,
      onSecondary: AppColors.primary,
      brightness: Brightness.light,
      background:AppColors.primary ,
      onBackground:AppColors.primary
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,

      )
    )
  );


  static ThemeData darkTheme =ThemeData(
      scaffoldBackgroundColor: AppColors.secondaryDark,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.primaryDark,
        toolbarHeight: 120,
        iconTheme: IconThemeData(
          color: AppColors.secondaryDark,
          size: 30,
        ),
        titleTextStyle: TextStyle(
            fontSize: 35,
            color: AppColors.secondaryDark,
            fontWeight: FontWeight.bold),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        elevation: 0,
        backgroundColor: Colors.transparent,
        selectedItemColor: AppColors.primaryDark,
        unselectedItemColor: Colors.white,

      ),
      bottomAppBarTheme: BottomAppBarTheme(
        color: AppColors.darkColor,

      ),
      iconTheme: IconThemeData(
          color: AppColors.primaryDark,
          size:30
      ),
      textTheme: TextTheme(
          bodySmall:GoogleFonts.poppins(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 15),
          bodyMedium: GoogleFonts.poppins(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontSize: 20),
          bodyLarge: GoogleFonts.poppins(
              color: Colors.white,
              fontWeight: FontWeight.normal,
              fontSize: 25)
      ),
      colorScheme: ColorScheme(
          onSurface:AppColors.primaryDark ,
          surface:AppColors.primaryDark ,
          primary: AppColors.primaryDark,
          onPrimary:AppColors.primaryDark ,
          onError:AppColors.primaryDark ,
          error: AppColors.primaryDark,
          secondary:AppColors.primaryDark ,
          onSecondary: AppColors.primaryDark,
          brightness: Brightness.light,
          background:AppColors.primaryDark ,
          onBackground:AppColors.primaryDark
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primaryDark,

          )
      ),

  );


}