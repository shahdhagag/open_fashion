import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:open_fashion/components/customWidgets/custom_app_bar.dart';
import 'package:open_fashion/components/customWidgets/header.dart';
import 'package:open_fashion/core/app_routes.dart';
import 'package:open_fashion/core/app_styles.dart';
import 'package:open_fashion/models/address_model.dart';
import 'package:open_fashion/models/card_model.dart';

import '../components/customWidgets/cart_widget.dart';
import '../components/customWidgets/custom_button.dart';
import '../components/customWidgets/custom_container.dart';
import '../components/customWidgets/shipping_address.dart';
import '../components/customWidgets/shipping_method.dart';
import '../models/product_model.dart';

class PlaceOrder extends StatefulWidget {
  const PlaceOrder({
    super.key,
    required this.image,
    required this.name,
    required this.descrp,
    required this.qty,
    required this.price,
    required this.total,
    this.address,
  });

  final String image;
  final String name;
  final String descrp;
  final int qty;
  final double price;
  final double total;
  final AddressModel? address;

  @override
  State<PlaceOrder> createState() => _PlaceOrderState();
}

class _PlaceOrderState extends State<PlaceOrder> {
  AddressModel? currentAddress;
  CardData? selectedCard;
  late ProductModel cartProduct;
  int selectedQty = 1;




  @override
  void initState() {
    super.initState();
    currentAddress = widget.address;
    selectedQty = widget.qty;
    cartProduct = ProductModel(
      image: widget.image,
      title: widget.name,
      description: widget.descrp,
      price: widget.price,
    );
  }

  Future<void> _addOrEditAddress() async {
    final result = await GoRouter.of(context).push(
      AppRoutes.addAddressScreen,
    );

    if (result != null && result is AddressModel) {
      setState(() {
        currentAddress = result;
      });
    }
  }

  Future<void> _openCardScreen() async {
    final result = await GoRouter.of(context).push(
      AppRoutes.addCardScreen,
    );

    if (result != null && result is CardData) {
      setState(() {
        selectedCard = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(isBlackk: false),
      body: Column(
        children: [
          /// 🔹 SCROLLABLE CONTENT
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Header(title: "Checkout"),
                  //const Gap(20),

                  /// ================= SHIPPING ADDRESS =================

                  ShippingAddressSection(
                    currentAddress: currentAddress,
                    onAddOrEdit: _addOrEditAddress,),

                  //  const Gap(28),
                  /// ================= SHIPPING METHOD =================
                  currentAddress!=null&&selectedCard!=null?SizedBox.shrink():ShippingMethod(),

                  /// ================= PAYMENT METHOD =================
                  currentAddress!=null&&selectedCard!=null?SizedBox.shrink():  Text(
                    "PAYMENT METHOD",
                    style: AppStyles.normal16black.copyWith(
                      color: Colors.grey,
                    ),
                  ),
                  const Gap(10),

                  /// 🔹 IF CARD NOT SELECTED
                  if (selectedCard == null)
                    GestureDetector(
                      onTap: _openCardScreen,
                      child: const CustomContainer(
                        label: "Select payment method",
                        icon: Icons.keyboard_arrow_down_rounded,
                      ),
                    ),

                  /// 🔹 IF CARD SELECTED
                  if (selectedCard != null)
                    GestureDetector(
                      onTap: _openCardScreen,
                      child: Container(

                        child: Column(
                          children: [
                            Divider(color: Colors.grey.shade300,),
                            Gap(20),
                            Row(
                              children: [
                                SvgPicture.asset(
                                  "assets/Mastercard.svg",
                                  width: 50,
                                ),
                                const Gap(10),
                                Text(
                                  "Master Card ending",
                                  style: AppStyles.normal16black.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Gap(6),
                                Text(
                                  '...${selectedCard!.cardNumber.substring(
                                    selectedCard!.cardNumber.length - 4,
                                  )}',
                                  style: AppStyles.normal16black.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Spacer(),

                                /// 🔥 ONLY THIS IS CLICKABLE
                                GestureDetector(
                                  onTap: _openCardScreen,
                                  child: SvgPicture.asset(
                                    "assets/arrow.svg",
                                  ),
                                ),
                              ],
                            ),
                            Gap(20),
                            Divider(color: Colors.grey.shade300,),
                            Gap(20),
                          ],
                        ),
                      ),

                    ),

                selectedCard!=null&&currentAddress!=null

                    ?CartWidget(
                    product: cartProduct,
                    onChanged: (quantity) {
                      setState(() {
                        selectedQty = quantity;
                      });
                    }, quantity: widget.qty,
                  ):SizedBox.shrink()
                  // const Gap(30),
                ],
              ),
            ),
          ),

          /// 🔹 FIXED BOTTOM SECTION


          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                Row(
                  children: [
                    Text("TOTAL", style: AppStyles.normal16black),
                    const Spacer(),
                    Text(
                      "\$${widget.total.toStringAsFixed(2)}",
                      style: AppStyles.normal16black.copyWith(
                        color: Colors.red.shade200,
                      ),
                    ),
                  ],
                ),
                const Gap(20),
                Button(
                  isSvgs: true,
                  title: 'Place order',
                  onTap: currentAddress != null &&
                      selectedCard != null
                      ? () {
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context) {
                        return Dialog(
                          backgroundColor: Colors.transparent,
                          insetPadding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Container(
                            width: double.infinity,
                            height: 520,
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                /// CLOSE ICON
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: InkWell(
                                    onTap: () => Navigator.pop(context),
                                    child: const Icon(CupertinoIcons.clear),
                                  ),
                                ),

                                const Gap(20),

                                /// TITLE
                                Text(
                                  "PAYMENT SUCCESS",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.2,
                                  ),
                                ),

                                const Gap(30),

                                /// SVG ICON (REPLACE PATH)
                                SvgPicture.asset(
                                  "assets/done.svg",
                                  width: 50,
                                  height: 50,
                                ),

                                const Gap(24),

                                /// MESSAGE
                                const Text(
                                  "Your payment was success",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),

                                const Gap(6),

                                /// PAYMENT ID
                                const Text(
                                  "Payment ID 15263541",
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                ),

                                const Gap(30),

                                /// RATE TEXT
                                const Text(
                                  "Rate your purchase",
                                  style: TextStyle(
                                    fontSize: 16,
                                  ),
                                ),

                                const Gap(16),

                                /// STARS
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  spacing: 10,
                                  children: [
                                    SvgPicture.asset("assets/emogi1.svg"),
                                    SvgPicture.asset("assets/emogi2.svg"),
                                    SvgPicture.asset("assets/emogi3.svg"),
                                  ]
                                ),

                                const Spacer(),

                                /// BUTTONS
                                Row(
                                  children: [
                                    Expanded(
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.black,
                                          padding: const EdgeInsets.symmetric(vertical: 14),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(30),
                                          ),
                                        ),
                                        onPressed: () {},
                                        child: const Text(
                                          "SUBMIT",
                                          style: TextStyle(
                                            color: Colors.white,
                                            letterSpacing: 1.2,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const Gap(12),
                                    Expanded(
                                      child: OutlinedButton(
                                        style: OutlinedButton.styleFrom(
                                          padding: const EdgeInsets.symmetric(vertical: 14),
                                          side: const BorderSide(color: Colors.black),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(30),
                                          ),
                                        ),
                                        onPressed: () {
                                          context.go(AppRoutes.homeScreen);
                                        },
                                        child: const Text(
                                          "BACK TO HOME",
                                          style: TextStyle(
                                            color: Colors.black,
                                            letterSpacing: 1.2,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );

                  }
                      : null,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

