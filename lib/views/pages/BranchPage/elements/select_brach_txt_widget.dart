import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:souchi/const.dart';

class SelectBranch extends StatelessWidget {
  const SelectBranch({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Please',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 40,
                        color: Colors.orange,
                      ),
                    ),
                    Text(
                      'Select Your Branch ',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 20,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'لو سمحت',
                        style: TextStyle(
                          color: Colors.orange,
                          fontSize: 28,
                          fontFamily: kfontAlex,
                        ),
                      ),
                      SizedBox(height: 10,),
                      Text(
                        'اختار  الفرع',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                          fontFamily: kfontAlex,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
          Divider(
            color: Colors.grey,
            thickness: 1,
          ),
        ],
      ),
    );

  }
}
