// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:souchi/const.dart';

import '../../../authentication/widgets/custom_button.dart';
import '../../../authentication/widgets/custom_snackbar.dart';

class HelpCenter extends StatelessWidget {
  const HelpCenter({Key? key}) ;

  // Phone numbers
  final String number1 = '01000175017';
  final String number2 = '01150535430';
  final String number3 = '01024129909';

  // Function to call a number using flutter_phone_direct_caller
  _callNumber(String number) async {
    bool? res = await FlutterPhoneDirectCaller.callNumber(number);
    if (res == true) {
      // print('Calling $number...');
    } else {
      // print('Failed to call $number');
    }
  }

  _copyToClipboard(BuildContext context, String number) {
    Clipboard.setData(ClipboardData(text: number));
    showCustomSnackBar(
        context, 'Number copied to clipboard', SnackBarType.Info);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help Center'),
        backgroundColor: kPrimaryColor,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            CustomButton(
              buttonLabel: '📞 Call '+ number3,
              onPressed: () {
                _callNumber(number3);
                _copyToClipboard(context, number3);
              },
            ),
            CustomButton(
              buttonLabel: '📞 Call '+ number2,
              onPressed: () {
                _callNumber(number2);
                _copyToClipboard(context, number2);
              },
            ),

            CustomButton(
              buttonLabel: '📞 Call '+ number1,
              onPressed: () {
                _callNumber(number1);
                _copyToClipboard(context, number1);
              },
            )


          ],
        ),
      ),
    );
  }
}
