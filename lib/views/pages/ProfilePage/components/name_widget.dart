import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NameWidget extends StatelessWidget {
  const NameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: FutureBuilder(

        future: getName(),
        builder: (context, snapshot) {
          if(!snapshot.hasData){
            return const Text('Waiting');
          }
          if(snapshot.connectionState== ConnectionState.none){
            return const Text('waiting Connection');
          }
          if(snapshot.hasError){
            return const Text('waiting');
          }

          return Text('HI , ${snapshot.requireData}',
            style: const TextStyle(fontFamily: 'Poppins',fontSize: 22 ,color: Colors.black

            ),
          );
        }, ),

    );
  }

}
Future<String?>getName()async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  //Return double
  String? nameValue = prefs.getString('name');
  print('double value${nameValue}');
  return nameValue;


}