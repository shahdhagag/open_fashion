
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class QuantityWidget extends StatelessWidget {
  const QuantityWidget({
    super.key, required this.image,
    required this.onTap
  });
final String image;
final VoidCallback  onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
    onTap:onTap ,
      child: Container(
        padding: EdgeInsets.all(3),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.grey.shade400,width:1),
        ),
        child:
        SvgPicture.asset(image),
      ),
    );
  }
}
