import 'package:flutter/material.dart';
import 'package:souchi/views/pages/BranchPage/elements/body.dart';
import 'package:souchi/views/pages/BranchPage/elements/select_brach_txt_widget.dart';

import '../../../enums.dart';
import '../../widgets/NavBar.dart';

class BranchScreen extends StatelessWidget {
  const BranchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(

        children: [
          SelectBranch(),
          const Expanded(child: Body()),
        ],
      ),

    );
  }
}
