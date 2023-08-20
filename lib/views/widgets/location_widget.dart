import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:souchi/const.dart';

class LocationWidget extends StatelessWidget {
  LocationWidget({super.key, required this.branchName});
  final String branchName;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         Row(
          children: [

             SizedBox(width: 32,),
            Text('BIKE LOCATION ',style: const TextStyle(fontSize: 14),),
          ],
        ),
        Row(

          children: [
            const SizedBox(width: 15,),
            IconButton(
              color: const Color(0xffFF7517),
                iconSize: 32,
                onPressed:(){},
                icon: const Icon(
                    Icons.location_on_outlined
                )
            ),
            Text(branchName,style: const TextStyle(fontSize: 20,fontFamily: 'poppins'),),
            SizedBox(width: 10,),
            // SelectableText(
            //   onTap: () async{
            //    // Clipboard.setData(const ClipboardData(text: '01207774925'));
            //    await Clipboard.getData('01207774925');
            //   },
            //
            //     '01207774925',style: TextStyle(color: kPrimaryColor)),
          ],
        ),
      ],
    );
  }
}
