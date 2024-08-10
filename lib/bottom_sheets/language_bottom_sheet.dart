import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../app_colors.dart';
import '../providers/my_provider.dart';

class LanguageBottomSheet extends StatelessWidget {
  const LanguageBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    var pro =Provider.of<MyProvider>(context);


    return Container
      (
      height: MediaQuery.of(context).size.height*.5,

      decoration: BoxDecoration(
          color:pro.appTheme==ThemeMode.dark?
          AppColors.darkColor
              :
          Colors.white,
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
              child: InkWell(
                onTap: () {
                  context.setLocale(Locale('ar')).then((onValue){
                    Navigator.pop(context);
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    Text("arabic".tr(),
                        style:Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color:context.locale==Locale('ar')?
                            pro.appTheme==ThemeMode.dark?
                                AppColors.primaryDark
                                :
                                AppColors.primary
                                :
                            pro.appTheme==ThemeMode.dark?
                                Colors.white
                                :
                                Colors.black
                        )),
                    context.locale==Locale('ar')?
                    Icon(Icons.done,color:
                    pro.appTheme==ThemeMode.dark?
                    AppColors.primaryDark
                        :
                    AppColors.primary)
                        :
                    SizedBox(),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: InkWell(
                onTap: () {
                  context.setLocale(Locale('en')).then((onValue){
                    Navigator.pop(context);
                  });

                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    Text("english".tr(),style:Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color:context.locale==Locale('en')?
                        pro.appTheme==ThemeMode.dark?
                        AppColors.primaryDark
                            :
                        AppColors.primary
                            :
                        pro.appTheme==ThemeMode.dark?
                        Colors.white
                            :
                        Colors.black
                    )),
                    context.locale==Locale('en')?
                    Icon(Icons.done,color:
                    pro.appTheme==ThemeMode.dark?
                    AppColors.primaryDark
                        :
                    AppColors.primary)
                        :
                    SizedBox(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
