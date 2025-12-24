import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:open_fashion/components/customWidgets/custom_app_bar.dart';
import 'package:open_fashion/components/customWidgets/header.dart';

import '../components/customWidgets/custom_button.dart';
import '../components/customWidgets/custom_text_field.dart';
import '../models/address_model.dart';
class AddAddress extends StatefulWidget {
  const AddAddress({super.key});

  @override
  State<AddAddress> createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController zipController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    addressController.dispose();
    cityController.dispose();
    stateController.dispose();
    zipController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(isBlackk: false),
      body: Column(
        children: [
          Header(title: "Add shipping adress"),

          /// 🔹 MIDDLE FORM (SCROLLABLE)
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const SizedBox(height: 20),

                  /// First & Last name
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextField(
                          label: "First name",
                          controller: firstNameController,
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: CustomTextField(
                          label: "Last name",
                          controller: lastNameController,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  /// Address
                  CustomTextField(
                    label: "Address",
                    controller: addressController,
                  ),

                  const SizedBox(height: 20),

                  /// City
                  CustomTextField(
                    label: "City",
                    controller: cityController,
                  ),

                  const SizedBox(height: 20),

                  /// State & ZIP
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextField(
                          label: "State",
                          controller: stateController,
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: CustomTextField(
                          label: "ZIP code",
                          controller: zipController,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  /// Phone
                  CustomTextField(
                    label: "Phone number",
                    controller: phoneController,
                  ),

                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),

          /// 🔹 BOTTOM BUTTON
          Padding(
            padding: const EdgeInsets.all(15),
            child: Button(
              isSvgs: false,
              title: 'ADD NOW',
              onTap: () {
                final address = AddressModel(
                    firstName: firstNameController.text,
                    lastName: lastNameController.text,
                    address: addressController.text,
                    city: cityController.text,
                    state: stateController.text,
                    zip: zipController.text,
                    phone: phoneController.text,);
                // You can access values like:
                // firstNameController.text
                context.pop(address);
              },
            ),
          ),
        ],
      ),
    );
  }
}
