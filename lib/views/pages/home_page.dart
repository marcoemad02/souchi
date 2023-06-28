import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:souchi/views/widgets/app_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[60],
      appBar: CustomAppBar(),
      body:Column(

      ),
    );
  }
}
