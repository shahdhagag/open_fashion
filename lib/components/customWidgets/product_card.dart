
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../core/app_styles.dart';
import '../../models/cover_model.dart';

class Product_card extends StatelessWidget {
  const Product_card({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      child: ListView.builder(
          padding: EdgeInsets.zero,
          scrollDirection: Axis.horizontal,
          itemCount: CoverModel.covers.length,
          itemBuilder: (context,index){
            final item=CoverModel.covers[index];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(item.image,height: 350,fit: BoxFit.cover,),
                Gap(6),
                Text(item.title.toUpperCase(),style: AppStyles.normal16white,)
              ],
            );
          }),
    );
  }
}
