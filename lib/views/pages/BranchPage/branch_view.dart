import 'package:flutter/material.dart';
import 'package:souchi/views/pages/BranchPage/elements/body.dart';
import 'package:souchi/views/pages/BranchPage/elements/select_brach_txt_widget.dart';

class BranchScreen extends StatelessWidget {
  const BranchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          SelectBranch(),
          Expanded(child: Body()),
        ],
      ),
    );
  }
}
