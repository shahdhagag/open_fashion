import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ionicons/ionicons.dart';
import 'package:open_fashion/core/app_colors.dart';
import 'package:open_fashion/core/app_styles.dart';

class HomeFooter extends StatelessWidget {
  const HomeFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Ionicons.logo_twitter,color: AppColors.whiteColor,),
            Gap(30),
            Icon(Ionicons.logo_instagram,color: AppColors.whiteColor,),
            Gap(30),
            Icon(Ionicons.logo_facebook,color: AppColors.whiteColor,),


          ],
        ),
        Gap(20),
        Image.asset("assets/line.png",width: 190,),
        Gap(20),
        Text("support@openui.design \n+60 825 876\n08:00 - 22:00 - Everyday",style: AppStyles.normal16white.copyWith(height:2.5 ),),
        Gap(20),
        Image.asset("assets/line.png",width: 190,),
        Gap(20),
        Text("About   Contact  Blog",style: AppStyles.normal16white,),
        Gap(20),

      ],
    );
  }
}