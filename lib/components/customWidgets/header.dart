import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../core/app_styles.dart';
class Header extends StatelessWidget {
  const Header({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Gap(20),
        Center(child: Text(
         title.toUpperCase(),
          style: AppStyles.normal25black.copyWith(fontSize: 17),)),
        Gap(20),
        Image.asset("assets/line.png", width: 160,color: Colors.black,),
        Gap(20),

      ],
    );
  }
}
