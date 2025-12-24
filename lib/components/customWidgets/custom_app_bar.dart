
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../core/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.isBlackk});
  final bool isBlackk;

  @override
  Size get preferredSize => const Size.fromHeight(80);
  // kToolbarHeight = 56 (default AppBar height)

  @override
  Widget build(BuildContext context) {
    bool isBlack=isBlackk;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AppBar(
        backgroundColor: isBlack ?AppColors.BalckAppColor :AppColors.whiteColor,
        leading: SvgPicture.asset("assets/Menu.svg",color: isBlack?AppColors.whiteColor:AppColors.BalckAppColor),
        leadingWidth: 25,

        title:  SvgPicture.asset("assets/logo/logo-bg.svg",color: isBlack?AppColors.whiteColor:AppColors.BalckAppColor),
        centerTitle: true,

        actions: [
          SvgPicture.asset("assets/Search.svg",color: isBlack?AppColors.whiteColor:AppColors.BalckAppColor),
          Gap(20),
          SvgPicture.asset("assets/shopping bag.svg",color: isBlack?AppColors.whiteColor:AppColors.BalckAppColor),
        ],

      ),
    );
  }
}
