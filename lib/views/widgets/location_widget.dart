import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LocationWidget extends StatelessWidget {
  const LocationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         Row(
          children: [
            SizedBox(width: 32,),
            Text('BIKE LOCATION ',style: TextStyle(fontSize: 14),),
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
            const Text('HOSARY',style: TextStyle(fontSize: 22),)
          ],
        ),
      ],
    );
  }
}
