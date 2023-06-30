import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:souchi/styles.dart';
import 'package:souchi/views/widgets/app_bar.dart';
import 'package:souchi/views/widgets/second_appBar.dart';

class RawPage extends StatelessWidget {
  const RawPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: SecondAppBar(),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: const [
                  Text('RAW SOUSHI',
                  style: Styles.textStyle30orange,
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

          ],
          
        ),

      ),
    );
  }
}
