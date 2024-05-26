import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:four_apps_in_one_multi_user_app/client/features/client_home/view/delivery_progres_page.dart';
import 'package:four_apps_in_one_multi_user_app/global_core/constants/constants.dart';
import 'package:four_apps_in_one_multi_user_app/global_core/helpers/helpers.dart';
import 'package:four_apps_in_one_multi_user_app/global_core/widgets/my_button.dart';

class CheckOutPage extends StatefulWidget {
  const CheckOutPage({super.key});

  @override
  State<CheckOutPage> createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String cardNumber = "";
  String expiryDate = "";
  String cardHolderName = "";
  String cvvCode = "";
  bool isCvvFocused = false;
  String onCreditCardWidgetChange = "";

  // user wants to pay
  void userTappedPay() {
    if (formKey.currentState!.validate()) {
      //only show dialog if form is valid
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Confirm Payment"),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text("Card Number : $cardNumber"),
                Text("Expiry Date : $expiryDate"),
                Text("Card Holder Name : $cardHolderName"),
                Text("CVV : $cvvCode"),
              ],
            ),
          ),
          actions: [
            //cancel button
            TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Cancel")),

            // yes button
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DeliveryProgresPage(),
                      ));
                },
                child: const Text("Yes"))
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kOffWhite,
      appBar: AppBar(
        backgroundColor: kPrimary,
        foregroundColor: kDark,
        title: const Text("C H E C K O U T"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // credit card
          CreditCardWidget(
            cardNumber: cardNumber,
            expiryDate: expiryDate,
            cardHolderName: cardHolderName,
            cvvCode: cvvCode,
            showBackView: isCvvFocused,
            onCreditCardWidgetChange: (p0) {},
          ),
      
          //credit card form
          CreditCardForm(
            cardNumber: cardNumber,
            expiryDate: expiryDate,
            cardHolderName: cardHolderName,
            cvvCode: cvvCode,
            onCreditCardModelChange: (data) {
              setState(() {
                cardNumber = data.cardNumber;
                expiryDate = data.expiryDate;
                cardHolderName = data.cardHolderName;
                cvvCode = data.cvvCode;
              });
            },
            formKey: formKey,
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: MyButton(
              onPressed: userTappedPay,
              backGroudcolor: kPrimary,
              child: const Text("Pay Now"),
            ),
          ),
          25.verticalSpace,
        ],
      ),
    );
  }
}
