import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/firebase_functions.dart';
import 'package:todo_app/home_screen.dart';
import '../app_colors.dart';
import '../providers/my_provider.dart';
import 'text_input_form.dart';

class SignUp extends StatefulWidget {
  static const String routeName = "signUp";
   SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var emailController =TextEditingController();

  var passwordController =TextEditingController();

  var userNameController =TextEditingController();

  var ageController =TextEditingController();

  var phoneController =TextEditingController();

  @override
  Widget build(BuildContext context) {
    var pro =Provider.of<MyProvider>(context);

    return  Scaffold(
      backgroundColor:
      pro.appTheme==ThemeMode.dark?
          AppColors.secondaryDark
      :
      AppColors.secondary,
      body:
      SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 100,bottom: 70),
                child: Text("Sign Up",style: TextStyle(
                  fontSize: 60,
                    color:
                    pro.appTheme==ThemeMode.dark?
                        AppColors.primaryDark
                    :

                    AppColors.primary,
                fontWeight: FontWeight.w700,
                wordSpacing: 10,
                ),),
              ),
              TextInputForm(controller:emailController ,hint:"Email" ,
             keyType:TextInputType.emailAddress,
                isObscure: false,
                ),
              SizedBox(height: 22,),
              TextInputForm(controller:passwordController ,hint:"Password" ,
             keyType: TextInputType.text,
                isObscure: true,
              ),
              SizedBox(height: 22,),
              TextInputForm(controller:userNameController ,hint:"Name" ,
               keyType:TextInputType.text , isObscure: false
              ),
              SizedBox(height: 22,),
              TextInputForm(controller:phoneController ,hint:"Phone" ,
             keyType:TextInputType.number , isObscure: false
              ),
              SizedBox(height: 22,),
              TextInputForm(controller:ageController ,hint:"Age" ,
            keyType: TextInputType.number, isObscure: false
              ),
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: () {
                    FirebaseFunctions.creatAccount(
                        emailController.text, passwordController.text,
                    onSuccess: (){
                          Navigator.pushNamedAndRemoveUntil(
                            context, HomeScreen.routeName , (route) => false,);
                    },
                    onError: (message){
                      showDialog(context: context, builder:
                          (context) => AlertDialog(
                        backgroundColor:
                        pro.appTheme==ThemeMode.dark?
                        AppColors.secondaryDark:AppColors.secondary,
                        title: Text("Error",style: TextStyle(
                            color:
                            pro.appTheme==ThemeMode.dark?
                            Colors.white
                            :
                            AppColors.primary,
                            fontSize: 40,fontWeight: FontWeight.w700),),
                        content: Text(message),
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

                    },
                    age: int.parse(ageController.text),
                    phone: phoneController.text,
                    userName: userNameController.text);

                  }, style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 50,vertical: 10)),
                      child: Text("SIGN UP",
                        style: TextStyle(color: Colors.white,fontSize: 25),)
                  )
                ],)
            ],
          ),
        ),

      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Text.rich(
              textAlign: TextAlign.center,
              TextSpan(children: [
                TextSpan(text: "have an account? ",style:
                TextStyle(fontSize: 20)),
                TextSpan( text: "LOG IN",style: TextStyle(
                    fontSize: 25,color: Colors.white,
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
