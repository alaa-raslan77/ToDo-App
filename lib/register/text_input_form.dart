import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../app_colors.dart';
import '../providers/my_provider.dart';

class TextInputForm extends StatelessWidget {
  var controller ;
  String hint;
  TextInputType keyType;
  bool isObscure;

  TextInputForm({super.key,required this.controller,required this.hint, required this.keyType, required this.isObscure});


  @override
  Widget build(BuildContext context) {
    var pro =Provider.of<MyProvider>(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: TextFormField(
        obscureText: isObscure,
        keyboardType: keyType,
        controller: controller,
        decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(
                fontSize: 25,
                color:
                pro.appTheme==ThemeMode.dark?
                    AppColors.primaryDark
                :
                AppColors.primary
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(15))
            )
        ),),
    );
  }
}
