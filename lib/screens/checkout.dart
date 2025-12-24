import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:open_fashion/components/customWidgets/custom_app_bar.dart';
import 'package:open_fashion/components/customWidgets/header.dart';
import 'package:open_fashion/core/app_routes.dart';
import 'package:open_fashion/core/app_styles.dart';
import 'package:open_fashion/models/address_model.dart';

import '../components/customWidgets/cart_widget.dart';
import '../components/customWidgets/custom_button.dart';
import '../components/customWidgets/promo_widget.dart';
import '../components/customWidgets/quantity_widgets.dart';
import '../models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:open_fashion/components/customWidgets/custom_app_bar.dart';
import 'package:open_fashion/components/customWidgets/header.dart';
import 'package:open_fashion/core/app_routes.dart';
import 'package:open_fashion/core/app_styles.dart';
import 'package:open_fashion/models/address_model.dart';

import '../components/customWidgets/cart_widget.dart';
import '../components/customWidgets/custom_button.dart';
import '../components/customWidgets/promo_widget.dart';
import '../models/product_model.dart';

class CheckOut extends StatefulWidget {
  const CheckOut({super.key, required this.product});
  final ProductModel product;

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  int selectedQty = 1;
  AddressModel? selectedAddress;

  @override
  Widget build(BuildContext context) {
    final total = widget.product.price * selectedQty;

    return Scaffold(
      appBar: CustomAppBar(isBlackk: false),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Header(title: "Checkout"),

            CartWidget(
              product: widget.product,
              onChanged: (v) {
                setState(() {
                  selectedQty = v;
                });
              }, quantity: selectedQty,
            ),

            Promo(),
            Gap(20),

            const Spacer(),

            Row(
              children: [
                Text("Est. Total", style: AppStyles.normal16black),
                const Spacer(),
                Text(
                  "\$${total.toStringAsFixed(2)}",
                  style: AppStyles.normal16black.copyWith(
                    color: Colors.red.shade200,
                  ),
                ),
              ],
            ),

            Gap(20),

            Button(
              isSvgs: true,
              title: 'Checkout',
              onTap: () async {
                final result = await GoRouter.of(context).push(
                  AppRoutes.placeOrderScreen,
                  extra: {
                    'image': widget.product.image,
                    'name': widget.product.title,
                    'descrp': widget.product.description,
                    'qty': selectedQty,
                    'price': widget.product.price,
                    'total': total,
                    'address': selectedAddress,
                  },
                );

                if (result != null && result is AddressModel) {
                  setState(() {
                    selectedAddress = result;
                  });
                }
              },
            ),

            Gap(30),
          ],
        ),
      ),
    );
  }
}
