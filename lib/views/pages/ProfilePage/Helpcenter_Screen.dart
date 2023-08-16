import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:souchi/const.dart';
class HelpCenter extends StatelessWidget {
  const HelpCenter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
      ),
      body: Column(
        children: [
          Row(
            children: [
              const Text('01024129909'),
              IconButton(onPressed: () async{
                 await  Clipboard.setData(const ClipboardData(text: "01024129909"));
              }, icon:const Icon( Icons.copy)),
            ],
          ),
          Row(
            children: [
              const Text('01150535430'),
              IconButton(onPressed: () async{
                await  Clipboard.setData(const ClipboardData(text: "01150535430 "));
              }, icon:const Icon( Icons.copy)),
            ],
          ),
          Row(
            children: [
              const Text('01000175017'),
              IconButton(onPressed: () async{
                await  Clipboard.setData(const ClipboardData(text: "01000175017"));
              }, icon:const Icon( Icons.copy)),
            ],
          ),
        ],
      ),
    );
  }
}
