import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../core/app_styles.dart';
import '../../screens/place_order.dart';
import 'custom_container.dart';
class ShippingMethod extends StatelessWidget {
  const ShippingMethod({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "SHIPPING METHOD",
          style: AppStyles.normal16black.copyWith(
            color: Colors.grey,
          ),
        ),
        const Gap(10),

        const CustomContainer(
          label: "Pickup at store",
          icon: Icons.keyboard_arrow_down_rounded,
          trailingText: "Free",
        ),

        // const Gap(28),
      ],
    );
  }
}
