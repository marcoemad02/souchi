import 'package:flutter/material.dart';
import 'package:souchi/views/pages/BranchPage/elements/body.dart';

class BranchScreen extends StatelessWidget {
  const BranchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: Body()),
    );
  }
}
