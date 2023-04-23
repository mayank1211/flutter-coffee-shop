import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'dart:convert';
import 'package:flutter/material.dart';

class PaymentController extends GetxController {
  Map<String, dynamic>? paymentIntentData;

  payFee() {
    try {
      //if you want to upload data to any database do it here
    } catch (e) {
      // exception while uploading data
    }
  }

  Future<void> makePayment(
      double amount, String currency) async {
    // Provider.of<CoffeeShop>(null, listen: false).emptyUserCart();
    try {
      const billingDetails = BillingDetails(
        email: 'mayank.patel1211.mp@gmail.com',
        phone: '+447123456789',
        address: Address(
          city: 'London',
          country: 'GB',
          line1: '114 Leeds Road',
          line2: 'Leeds',
          state: 'West Yorkshire',
          postalCode: 'LS1 7NG',
        ),
      );

      paymentIntentData = await createPaymentIntent(amount, currency);
      await Stripe.instance
          .initPaymentSheet(
            paymentSheetParameters: SetupPaymentSheetParameters(
              allowsDelayedPaymentMethods: true,
              appearance: const PaymentSheetAppearance(
                shapes: PaymentSheetShape(
                  shadow: PaymentSheetShadowParams(color: Colors.red),
                ),
                primaryButton: PaymentSheetPrimaryButtonAppearance(
                  shapes: PaymentSheetPrimaryButtonShape(blurRadius: 0),
                  colors: PaymentSheetPrimaryButtonTheme(
                    light: PaymentSheetPrimaryButtonThemeColors(
                      background: Color.fromARGB(255, 231, 235, 30),
                      text: Color.fromARGB(255, 235, 92, 30),
                      border: Color.fromARGB(255, 235, 92, 30),
                    ),
                  ),
                ),
              ),
              billingDetails: billingDetails,
              style: ThemeMode.dark,
              // customFlow: true,
              merchantDisplayName: 'Mayank',
              // customerId: paymentIntentData!['customer'],
              paymentIntentClientSecret: paymentIntentData!['client_secret'],
              // customerEphemeralKeySecret: paymentIntentData!['ephemeralKey'],
            ),
          )
          .then((value) {});
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  displayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet().then((newValue) {
        // payFee();
        paymentIntentData = null;
      }).onError((error, stackTrace) {
        if (kDebugMode) {
          print(error);
        }
      });
    } on StripeException catch (e) {
      Get.snackbar(
        'Payment',
        'Payment Error',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
        margin: const EdgeInsets.all(10),
        duration: const Duration(seconds: 2),
      );
      if (kDebugMode) {
        print(e);
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  createPaymentIntent(double amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': (amount * 100).toStringAsFixed(0),
        'currency': currency,
        'payment_method_types[]': 'card'
      };
      var response = await http.post(
          Uri.parse('https://api.stripe.com/v1/payment_intents'),
          body: body,
          headers: {
            'Authorization':
                'Bearer sk_test_51KtCCyCmrbEExMw5uumd5XcmQYhZk4ox8vjvAOUeW9OMBNX9CtfHk8IqIaFGpbIewxhrVZrqPFSyeJLeTpsKiSfC00cyWHFp8n',
            'Content-Type': 'application/x-www-form-urlencoded'
          });
      return jsonDecode(response.body);
    } catch (err) {
      if (kDebugMode) {
        print(err);
      }
    }
  }
}
