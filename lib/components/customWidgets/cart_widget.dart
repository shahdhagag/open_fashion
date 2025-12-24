import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:open_fashion/components/customWidgets/quantity_widgets.dart';

import '../../core/app_styles.dart';
import '../../models/product_model.dart';

class CartWidget extends StatefulWidget {
  const CartWidget({super.key, required this.product, required this.onChanged, required this.quantity});
  final ProductModel product;
  final Function(int) onChanged;
  final int quantity;

  @override
  State<CartWidget> createState() => _CartWidgetState();
}

class _CartWidgetState extends State<CartWidget> {
 late int number ;

 @override
  void initState() {
   number = 1;
   number=widget.quantity;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Image.asset(widget.product.image, width: 120),
        Gap(15),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(10),
            SizedBox(
              width: width * 0.54,
              child: Text(
                widget.product.title.toUpperCase(),
                style: AppStyles.normal16black,
              ),
            ),
            Gap(7),
            SizedBox(
              width: width * 0.5,
              child: Text(
                widget.product.description,
                style: AppStyles.normal14black,
              ),
            ),
            Gap(10),
            Row(
              children: [
                QuantityWidget(
                  image: "assets/min.svg",
                  onTap: () {
                    setState(() {
                      if (number > 0) {
                        number--;
                        widget.onChanged(number);
                      } else {
                        return;
                      }
                    });
                  },
                ),
                Gap(12),
                Text(
                  number.toString(),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Gap(12),
                QuantityWidget(
                  image: "assets/plus.svg",
                  onTap: () {
                    setState(() {
                      number++;
                      widget.onChanged(number);

                    });
                  },
                ),
              ],
            ),
            Gap(18),
            Text(
              "\$${widget.product.price}",
              style: AppStyles.normal20black.copyWith(
                color: Colors.red.shade200,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
