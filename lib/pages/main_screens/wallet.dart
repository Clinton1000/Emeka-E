import 'package:flutter/material.dart';

class Wallet extends StatelessWidget {
  const Wallet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: const Center(
          child: Text(
            'Manage Fiat',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: const Center(
          child: Text(
        'Coming Soon',
        style: TextStyle(color: Colors.black),
      )),
    );
  }
}

// await StripePayment.setOptions(StripeOptions(
// publishableKey: 'YOUR_PUBLISHABLE_KEY',
// merchantId: 'YOUR_MERCHANT_ID',
// androidPayMode: 'test'));
//

// PaymentMethod paymentMethod = PaymentMethod();
//
// // Set the payment method details
// paymentMethod.card = CreditCard(
// number: '4111111111111111',
// expMonth: 12,
// expYear: 24,
// cvc: '123',
// );
//
// // Call the 'confirmPaymentIntent' function to process the payment
// ConfirmPaymentIntentResponse response =
//     await StripePayment.confirmPaymentIntent(PaymentIntent(
// clientSecret: 'YOUR_CLIENT_SECRET',
// paymentMethodId: paymentMethod.id,
// ));
//
// if (response.status == 'succeeded') {
// // Payment succeeded!
// }
