import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:ionicons/ionicons.dart';
import 'package:open_fashion/core/app_colors.dart';
import 'package:open_fashion/core/app_styles.dart';
import 'package:open_fashion/models/cover_model.dart';
import 'package:open_fashion/models/product_model.dart';

import '../components/customWidgets/copy_right_bar.dart';
import '../components/customWidgets/custom_app_bar.dart';
import '../components/customWidgets/home_footer.dart';
import '../components/customWidgets/product_card.dart';
import '../components/customWidgets/product_grid.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.BalckAppColor,
      appBar: CustomAppBar(isBlackk: true),
      body: Stack(
        children: [
          ///texts
          Positioned(
            top: 10,
            left: 0,
            right: 0,
            child: SvgPicture.asset("assets/text/10.svg"),
          ),
          Positioned(
            top: 40,
            left: 0,
            right: 0,
            child: SvgPicture.asset("assets/text/October.svg"),
          ),
          Positioned(
            top: 85,
            left: 0,
            right: 0,
            child: SvgPicture.asset("assets/text/Collection.svg"),
          ),

          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    children: [
                      Gap(112),
                      Image.asset("assets/cover/cover1.png"),
                      Gap(20),
                      ProductGrid(),
                      Gap(20),
                      Text(
                        "You may also like".toUpperCase(),
                        style: AppStyles.normal25white,
                      ),
                      Image.asset("assets/line.png", width: 190),
                      Gap(40),
                      Product_card(),
                      Gap(100),
                      HomeFooter(),

                      Gap(20),
                    ],
                  ),
                ),
                CopyrightBar(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
