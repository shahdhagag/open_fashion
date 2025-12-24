import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:open_fashion/core/app_styles.dart';

class Promo extends StatelessWidget {
  const Promo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Gap(20),
        Divider(),
        Gap(20),
        Row(
          children: [
            SvgPicture.asset("assets/promo.svg",width: 26, ),
            Gap(20),
            Text("Add promo code",style: AppStyles.normal16black,),

          ],
        ),
        Divider(),
        Gap(20),
        Row(
          children: [
            SvgPicture.asset("assets/delivery.svg",width: 25, ),
            Gap(20),
            Text("Delivery",style: AppStyles.normal16black,),
            Spacer(),
            Text("Free"),
            Gap(10),
          ],
        ),
        Divider(),

      ],
    );
  }
}
