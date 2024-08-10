import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../app_colors.dart';
import '../providers/my_provider.dart';

class ThemeBottomSheet extends StatelessWidget {
  const ThemeBottomSheet({super.key});

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
                  pro.changeTheme(ThemeMode.light).then((onValue){
                    Navigator.pop(context);
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("light".tr(),style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color:pro.appTheme==ThemeMode.dark?
                    Colors.white
                            :
                    AppColors.primaryDark

                    )),
                    pro.appTheme==ThemeMode.dark?
                        SizedBox()
                        :
                    Icon(Icons.done,color:
                    pro.appTheme==ThemeMode.dark?
                    AppColors.primaryDark
                        :
                    AppColors.primary),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: InkWell(
                onTap: () {
                        pro.changeTheme(ThemeMode.dark).then((onValue){
                          Navigator.pop(context);
                        });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    Text("dark".tr(),style:Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color:pro.appTheme!=ThemeMode.dark?
                        Colors.black
                            :
                        AppColors.primaryDark

                    ) ),
                    pro.appTheme!=ThemeMode.dark?
                    SizedBox()
                        :
                    Icon(Icons.done,color:
                    pro.appTheme==ThemeMode.dark?
                    AppColors.primaryDark
                        :
                    AppColors.primary),
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
