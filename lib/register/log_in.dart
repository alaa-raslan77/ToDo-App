import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/app_colors.dart';
import 'package:todo_app/firebase_functions.dart';
import 'package:todo_app/home_screen.dart';
import 'package:todo_app/register/sign_up.dart';
import 'package:todo_app/register/text_input_form.dart';
import '../providers/my_provider.dart';

class LogIn extends StatefulWidget {
  static const String routeName = "logIn";

   LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {

  var emailController =TextEditingController();

  var passwordController =TextEditingController();

  @override
  Widget build(BuildContext context) {
    var pro =Provider.of<MyProvider>(context);

    return Scaffold(
      backgroundColor:
      pro.appTheme==ThemeMode.dark?
          AppColors.secondaryDark
      :
      AppColors.secondary,
      body:
      SingleChildScrollView(
        child: Column(
          children: [
            Center(child: Padding(
              padding: const EdgeInsets.only(top: 100,),
              child: Image.asset(
                pro.appTheme==ThemeMode.dark?
                "assets/images/splash_dark.png"
                    :
                "assets/images/splash_light.png",
                width: 250,height: 300,),
            )),
            TextInputForm(controller:emailController ,hint:"Email" ,
              keyType:TextInputType.emailAddress ,isObscure: false,
            ),
            SizedBox(height: 22,),
            TextInputForm(controller:passwordController ,hint:"Password" ,
              keyType:TextInputType.text ,
              isObscure: true,
            ),
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              ElevatedButton(onPressed: () {
                FirebaseFunctions.login(emailController.text, passwordController.text,
                onSuccess: (){
                  Navigator.pushNamedAndRemoveUntil(
                    context, HomeScreen.routeName, (route) => false,);
                },
                onError: (error){
                  showDialog(context: context, builder:
                      (context) => AlertDialog(
                    backgroundColor:
                    pro.appTheme==ThemeMode.dark?
                    AppColors.secondaryDark:AppColors.secondary,
                    title: Text("Error",style: TextStyle(
                        color: pro.appTheme==ThemeMode.dark?
                        Colors.white
                            :
                        AppColors.primary,
                        fontSize: 40,fontWeight: FontWeight.w700),),
                    content: Text(error),
                    actions: [
                      ElevatedButton(onPressed: () {
                        Navigator.pop(context);

                      },style: ElevatedButton.styleFrom(
                          backgroundColor:
                          pro.appTheme==ThemeMode.dark?
                          AppColors.primaryDark
                              :
                          AppColors.primary),
                          child: Text("Okay",style: TextStyle(
                              color:
                              pro.appTheme==ThemeMode.dark?
                              AppColors.secondaryDark:
                              AppColors.secondary,fontSize: 20),)
                      )

                    ],
                  ),);

                });

              }, style: ElevatedButton.styleFrom(
                 padding: EdgeInsets.symmetric(horizontal: 50,vertical: 10)),
                 child: Text("LOG IN",style: TextStyle(color: Colors.white,fontSize: 25),))
            ],)
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, SignUp.routeName);
          },
          child: Text.rich(
              textAlign: TextAlign.center,
              TextSpan(children: [
            TextSpan(text: "Don't have an account? ",style:
            TextStyle(fontSize: 20)),
            TextSpan( text: "SIGN UP",style: TextStyle(fontSize: 25,color: Colors.white,
                backgroundColor:
                pro.appTheme==ThemeMode.dark?
                AppColors.primaryDark
                    :
                AppColors.primary))
          ])),
        ),
      ),
    );
  }
}
