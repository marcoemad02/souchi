import 'dart:ffi';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:souchi/views/widgets/location_widget.dart';

class Body extends StatelessWidget {
  List<String> names = <String>[
    'Salomn',
    'Salomn',
    'Salomn',
    'Salomn',
    'Salomn',
    'Salomn',
    'Salomn',
    'Salomn',
  ];

  List<String> images = <String>[
    'assets/image/sauces.jpg',
    'assets/image/sauces.jpg',
    'assets/image/sauces.jpg',
    'assets/image/sauces.jpg',
    'assets/image/sauces.jpg',
    'assets/image/sauces.jpg',
    'assets/image/sauces.jpg',
    'assets/image/sauces.jpg',
  ];

  List<int> prices = <int>[
    100,
    100,
    100,
    100,
    100,
    100,
    100,
    100,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal:20),
        child: Container(
          child:

          ListView.builder(
            itemCount: names.length,
            itemBuilder: (context, index) {
              return Container(
                height: 140,
                child: Row(
                  children: [
                    Container(
                      height: 120,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          images[index],
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 10),
                      child: Column(
                        children: [
                          Text(
                            names[index],
                            style: TextStyle(
                              color: Color(0xffFF7517),
                              fontSize: 24,
                              fontFamily: 'Poppins',
                            ),
                          ),
                          Row(
                            children: [
                              Text(' PRICE : ',style: TextStyle(color: Colors.black45,fontFamily: 'Poppins',fontSize: 18),),
                              SizedBox(width: 5,),
                              Text(
                                prices[index].toString(),
                                style: TextStyle(
                                  color: Colors.black45,
                                  fontSize: 18,
                                  fontFamily: 'Poppins',
                                ),
                              ),
                            ],
                          ),
                      SizedBox(height: 10,),
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),),
                            child:Row(
                              children: [
                                SizedBox(width: 6,),
                                Icon(Icons.minimize_outlined),
                                Text('  2  ', style: TextStyle(fontSize: 18),),
                                Icon(Icons.add_outlined),
                                SizedBox(width: 6,),
                              ],
                            )

                          ),

                        ],
                      ),
                    ),
                  ],
                ),
              );

            },
          ),
        ),
      ),
    );
  }
}
