import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:open_fashion/core/app_colors.dart';
import 'package:open_fashion/core/app_styles.dart';

class Button extends StatelessWidget {
  const Button({super.key, required this.isSvgs, required this.title,required this.onTap});
  final bool isSvgs;
  final String title;
  final Function()?onTap;
  @override
  Widget build(BuildContext context) {
    bool isSvg =isSvgs;
    return GestureDetector(
      onTap: onTap,
      child: Container(
         color: AppColors.balckColor,
        width: double.infinity,
        child:Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 13),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              isSvg?
              SvgPicture.asset("assets/shopping bag.svg",width: 22,)
              :SizedBox.shrink(),
              Gap(10),
              Text(title.toUpperCase(),style: AppStyles.normal16white.copyWith(color: AppColors.whiteColor),),
            ],
          ),
        ) ,

      ),
    );
  }
}
