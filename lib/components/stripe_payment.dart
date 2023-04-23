import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'dart:convert';
import 'package:flutter/material.dart';

class PaymentController extends GetxController {
  Map<String, dynamic>? paymentIntentData;

  Future<void> makePayment(
      {required String amount, required String currency}) async {
    try {
      const billingDetails = BillingDetails(
        email: 'email@stripe.com',
        phone: '+48888000888',
        address: Address(
          city: 'Houston',
          country: 'US',
          line1: '1459  Circle Drive',
          line2: '',
          state: 'Texas',
          postalCode: '77063',
        ),
      ); // mocked data for tests
      paymentIntentData = await createPaymentIntent(amount, currency);
      if (paymentIntentData != null) {
        await Stripe.instance.initPaymentSheet(
          paymentSheetParameters: SetupPaymentSheetParameters(
            // applePay: const PaymentSheetApplePay(
            //   merchantCountryCode: 'US',
            // ),
            googlePay: const PaymentSheetGooglePay(
              merchantCountryCode: 'US',
              testEnv: true,
            ),
            appearance: const PaymentSheetAppearance(
              // colors: PaymentSheetAppearanceColors(
              //   background: Colors.lightBlue,
              //   primary: Colors.blue,
              //   componentBorder: Colors.red,
              // ),
              shapes: PaymentSheetShape(
                //borderWidth: 4.0,
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
            customFlow: true,
            merchantDisplayName: 'Prospects',
            customerId: paymentIntentData!['customer'],
            paymentIntentClientSecret: paymentIntentData!['client_secret'],
            customerEphemeralKeySecret: paymentIntentData!['ephemeralKey'],
          ),
        );
        displayPaymentSheet();
      }
    } catch (e, s) {
      print(paymentIntentData);
    }
  }

  displayPaymentSheet() async {
    try {
      // TODO: Fix the payment notification ui
      await Stripe.instance.presentPaymentSheet();
      Get.snackbar('Payment', 'Payment Successful',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
          margin: const EdgeInsets.all(10),
          duration: const Duration(seconds: 2));
    } on Exception catch (e) {
      if (e is StripeException) {
        print("Error from Stripe: ${e.error.localizedMessage}");
      } else {
        print("Unforeseen error: ${e}");
      }
    } catch (e) {
      print("exception:$e");
    }
  }

  //  Future<Map<String, dynamic>>
  createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': calculateAmount(amount),
        'currency': currency,
        'payment_method_types[]': 'card'
      };
      var response = await http.post(
          Uri.parse('https://api.stripe.com/v1/payment_intents'),
          body: body,
          headers: {
            'Authorization':
                'Bearer sk_test_51KtCCyCmrbEExMw5uumd5XcmQYhZk4ox8vjvAOUeW9OMBNX9CtfHk8IqIaFGpbIewxhrVZrqPFSyeJLeTpsKiSfC00cyWHFp8n', //your secret key here
            'Content-Type': 'application/x-www-form-urlencoded'
          });
      return jsonDecode(response.body);
    } catch (err) {
      print('err charging user: ${err.toString()}');
    }
  }

  calculateAmount(String amount) {
    final a = (int.parse(amount)) * 100;
    return a.toString();
  }
}