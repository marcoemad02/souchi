import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LocationWidget extends StatelessWidget {
  LocationWidget({super.key, required this.branchName});
  final String branchName;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         Row(
          children: [
            const SizedBox(width: 32,),
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
            Text(branchName,style: const TextStyle(fontSize: 22),)
          ],
        ),
      ],
    );
  }
}
