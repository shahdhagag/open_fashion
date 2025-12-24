import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:open_fashion/core/app_routes.dart';
import 'package:open_fashion/core/app_styles.dart';
import 'package:open_fashion/models/address_model.dart';

class ShippingAddressSection extends StatelessWidget {
  const ShippingAddressSection({
    super.key,
    required this.currentAddress,
    required this.onAddOrEdit,
  });

  final AddressModel? currentAddress;
  final VoidCallback onAddOrEdit;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// ================= SHIPPING ADDRESS =================
        if (currentAddress == null) Text(
          "SHIPPING ADDRESS",
          style: AppStyles.normal16black.copyWith(
            color: Colors.grey,
          ),
        ),
        const Gap(10),

        if (currentAddress != null)
          Container(
            padding: const EdgeInsets.all(15),
            // decoration: BoxDecoration(
            //   color: Colors.grey.shade100,
            //   borderRadius: BorderRadius.circular(20),
            // ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${currentAddress!.firstName} ${currentAddress!.lastName}",
                      style: AppStyles.normal25black.copyWith(
                        fontSize: 19,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Gap(6),
                    Text(
                      currentAddress!.address,
                      style: AppStyles.normal16black.copyWith(
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      "${currentAddress!.city}, ${currentAddress!.state}",
                      style: AppStyles.normal16black.copyWith(
                        color: Colors.grey,
                      ),
                    ),
                    const Gap(4),
                    Text(
                      currentAddress!.phone,
                      style: AppStyles.normal16black.copyWith(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: (){GoRouter.of(context).push(AppRoutes.addAddressScreen);},
                  child: const Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 18,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),

       //const Gap(12),
        if (currentAddress == null)
        GestureDetector(
          onTap: onAddOrEdit,
          child: const _AddAddressButton(),
        ),

        //const Gap(28),
      ],
    );
  }
}

/// ================= ADD ADDRESS BUTTON =================
class _AddAddressButton extends StatelessWidget {
  const _AddAddressButton();

  @override
  Widget build(BuildContext context) {
    return
      Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 14,
      ),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: const [
          Text(
            "Add shipping address",
            style: TextStyle(
              color: Colors.black54,
              fontSize: 16,
            ),
          ),
          Spacer(),
          Icon(Icons.add, color: Colors.black54),
        ],
      ),
    );
  }
}
