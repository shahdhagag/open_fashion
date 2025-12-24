


import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:open_fashion/core/app_routes.dart';

import '../../core/app_styles.dart';
import '../../models/product_model.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: ProductModel.products.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 0,
        crossAxisSpacing: 15,
        childAspectRatio: 0.50,
      ),
      itemBuilder: (context, index) {
        final item = ProductModel.products[index];
        return GestureDetector(
          onTap: (){
            context.push(AppRoutes.checkoutScreen,extra: item,
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(item.image),
              Gap(10),
              Text(
                item.title,
                maxLines: 1,
                style: AppStyles.normal14white,
              ),
              Text(
                item.description,
                style: AppStyles.normal14white.copyWith(
                  color: Colors.grey,
                ),
              ),
              Gap(7),
              Text(
                "\$${item.price}",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: AppStyles.normal14white.copyWith(
                  color: Colors.red.shade200,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
