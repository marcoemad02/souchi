// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:souchi/authentication/widgets/custom_text.dart';
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
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 60),

           Padding(
             padding: EdgeInsetsDirectional.symmetric(horizontal: 10),
             child: Text('You can call us ,'
                ,style: GoogleFonts.poppins(

               color: Colors.black,
               fontWeight: FontWeight.w500,
               fontSize: 24,



             )),
           ),
           Padding(
             padding: EdgeInsetsDirectional.symmetric(horizontal: 10),
             child: Text(
                 'on the below numbers ',style: GoogleFonts.poppins(

               color: Colors.black,
               fontWeight: FontWeight.w500,
               fontSize: 20,



             )),
           ),
           Padding(
             padding: EdgeInsetsDirectional.symmetric(horizontal: 10),
             child: Text(
                 'we are always happy to be at your service. ',style: GoogleFonts.poppins(

               color: Colors.black,
               fontWeight: FontWeight.w500,
               fontSize: 20



             )),
           ),
            SizedBox(height: 50,),
            CustomHelpCenterCard(
              number: number3,
              onPressed: () {
                _callNumber(number3);
                _copyToClipboard(context, number3);
              },
            ),
            CustomHelpCenterCard(
              number: number2,
              onPressed: () {
                _callNumber(number2);
                _copyToClipboard(context, number2);
              },
            ),
            CustomHelpCenterCard(
              number: number1,
              onPressed: () {
                _callNumber(number1);
                _copyToClipboard(context, number1);
              },
            ),
            SizedBox(height: 60,),
            Row(
          mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Contact us",style: GoogleFonts.poppins(

                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                  fontSize: 22,



                )),
                SizedBox(width: 10,),
                Icon(Icons.headset_mic,color: Colors.grey),
              ],
            )


          ],
        ),
      ),
    );
  }
}
class CustomHelpCenterCard extends StatelessWidget {
  const CustomHelpCenterCard({Key? key, required this.onPressed,required this.number}) : super(key: key);

  final VoidCallback onPressed;
  final String? number;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 15, 10, 2),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(

            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12)
            ),
            width: double.infinity,
            height: 80,
            child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('$number',style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    textStyle: const TextStyle(
                      color: Colors.black,
                      letterSpacing: 1,
                      fontSize: 20,

                    )),),
                IconButton(onPressed: onPressed, icon: Icon(Icons.phone,color: Colors.green,))
              ],)
        ),
        // child: Container(
        //   height: 60,
        //   width: double.infinity,
        //   decoration: BoxDecoration(
        //     color: kPrimaryColor,
        //     borderRadius: BorderRadius.circular(30),
        //     boxShadow: [
        //       BoxShadow(
        //         color: Colors.grey.withOpacity(0.2),
        //         spreadRadius: 2,
        //         blurRadius: 5,
        //         offset: const Offset(0, 0), // changes position of shadow
        //       ),
        //     ],
        //   ),
        //   child: Center(
        //     child: Text(
        //       buttonLabel!,
        //       style: CustomTextStyle.button,
        //     ),
        //   ),
        // ),
      ),
    );
  }
}