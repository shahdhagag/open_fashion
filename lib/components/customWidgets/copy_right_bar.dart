import 'package:flutter/material.dart';
import 'package:open_fashion/core/app_styles.dart';

class CopyrightBar extends StatelessWidget {
  const CopyrightBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color:Colors.grey.shade400,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 30.0,top: 20),
        child: Text("Copyright© OpenUI All Rights Reserved.",textAlign: TextAlign.center,style: AppStyles.normal16white,),
      ),
    );
  }
}