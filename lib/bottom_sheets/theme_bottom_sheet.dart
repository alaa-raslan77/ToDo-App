import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../app_colors.dart';

class ThemeBottomSheet extends StatelessWidget {
  const ThemeBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {

    return Container
      (
      height: MediaQuery.of(context).size.height*.5,

      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20)
          )
      ),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("light",style: GoogleFonts.inter(color: AppColors.primary,
                      fontSize: 25,fontWeight: FontWeight.w400)),
                  Icon(Icons.done),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Text("dark",style: GoogleFonts.inter(color: AppColors.primary,
                      fontSize: 25,fontWeight: FontWeight.w400)),
                  Icon(Icons.done)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
