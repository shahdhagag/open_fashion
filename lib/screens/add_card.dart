import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:gap/gap.dart';
import 'package:open_fashion/components/customWidgets/header.dart';

import '../components/customWidgets/custom_app_bar.dart';
import '../components/customWidgets/custom_button.dart';
import '../models/card_model.dart';
class AddCard extends StatefulWidget {
  const AddCard({super.key});

  @override
  State<AddCard> createState() => _AddCardState();
}


class _AddCardState extends State<AddCard> {
  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){FocusScope.of(context).unfocus();},
      child: Scaffold(
        appBar: CustomAppBar(isBlackk: false),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Header(title: "Payment method"),

                ///visa
                CreditCardWidget(
                    cardNumber: cardNumber,
                    expiryDate: expiryDate,
                    cardHolderName: cardHolderName,
                    cvvCode: cvvCode,
                    showBackView: isCvvFocused,
                    onCreditCardWidgetChange: (v){},
                   obscureCardCvv: false,
                  obscureCardNumber: false,
                   cardBgColor:Colors.black ,
                   cardType: CardType.visa,
                  isHolderNameVisible: true,
            
                ),
            
                ///form
                CreditCardForm(
                  formKey: formKey,
                    cardNumber: cardNumber,
                    expiryDate: expiryDate,
                    cardHolderName: cardHolderName,
                    cvvCode: cvvCode,
                    onCreditCardModelChange: onCreditCardModelChange,
                    isCardHolderNameUpperCase: true,
                    obscureCvv: true,
                    obscureNumber: true,
                ),
            
                Gap(20),
                Button(
                  isSvgs: false,
                  title: "ADD CARD",
                  onTap: () {
                    if (formKey.currentState!.validate()) {
                      final cardData = CardData(
                        cardNumber: cardNumber,
                        expiryDate: expiryDate,
                        cardHolderName: cardHolderName,
                        cvvCode: cvvCode,
                      );

                      Navigator.pop(context, cardData); // 👈 return model
                    }
                  },
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }

  void onCreditCardModelChange(CreditCardModel v){
    setState(() {
      cardNumber = v.cardNumber;
      expiryDate = v.expiryDate;
      cardHolderName = v.cardHolderName;
      cvvCode = v.cvvCode;
      isCvvFocused = v.isCvvFocused;

    });
  }


}
