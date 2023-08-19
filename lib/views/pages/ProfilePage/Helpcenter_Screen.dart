import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:souchi/const.dart';
import '../../../enums.dart';
import '../../widgets/NavBar.dart';
class HelpCenter extends StatelessWidget {
  const HelpCenter({
    Key? key
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('HELP CENTER         ',
            style: TextStyle(fontFamily: 'poppins'),
            ),
          ],
        ),
        backgroundColor: kPrimaryColor,
      ),
      body:Center(
        child: Column(
          children: [
            const SizedBox(height: 32,),
            const Text('ارقمنا',style: TextStyle(fontFamily: 'alexandria',fontSize: 28),),
            const SizedBox(height: 26), // Optional spacing from the top
            Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Aligns the inner column at the top
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      '01024129909',
                      style: TextStyle(fontFamily: 'poppins', fontSize: 28),
                    ),
                    IconButton(
                      onPressed: () async {
                        await Clipboard.setData(const ClipboardData(text: "01024129909"));
                      },
                      icon: const Icon(Icons.copy),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      '01150535430',
                      style: TextStyle(fontFamily: 'poppins', fontSize: 28),
                    ),
                    IconButton(
                      onPressed: () async {
                        await Clipboard.setData(const ClipboardData(text: "01150535430"));
                      },
                      icon: const Icon(Icons.copy),
                    ),
                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      '01000175017 ',
                      style: TextStyle(fontFamily: 'poppins', fontSize: 28),
                    ),
                    IconButton(
                      onPressed: () async {
                        await Clipboard.setData(const ClipboardData(text: "01000175017"));
                      },
                      icon: const Icon(Icons.copy),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      )

    );
  }
}
