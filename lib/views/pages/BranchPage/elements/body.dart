import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:souchi/views/pages/BranchPage/elements/select_brach_txt_widget.dart';

import '../../../widgets/branch_widget.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      Padding(
        padding: const EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(6.0),
                child: Column(
                  children: [
                    BranchWidget(

                        streamBranch: FirebaseFirestore.instance
                            .collection('HosaryShopItems')
                            .snapshots(),
                        branchName: 'Hosary',
                        branchId: 1,
                    streamBranchRaw: FirebaseFirestore.instance.collection('HosaryShopItems').doc('RawItems').collection('RawItemsList').snapshots(),
                    streamBranchFried: FirebaseFirestore.instance.collection('HosaryShopItems').doc('FriedItems').collection('FriedItemsList').snapshots(),
                    streamBranchSauces: FirebaseFirestore.instance.collection('HosaryShopItems').doc('SauceItems').collection('SauceItemsList').snapshots(),


                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    BranchWidget(
                        streamBranch: FirebaseFirestore.instance
                            .collection('MohandseenShopItems')
                            .snapshots(),
                        branchName: 'Mohandseen',
                        branchId: 2,
                      streamBranchRaw: FirebaseFirestore.instance.collection('MohandseenShopItems').doc('RawItems').collection('RawItemsList').snapshots(),
                      streamBranchFried: FirebaseFirestore.instance.collection('MohandseenShopItems').doc('FriedItems').collection('FriedItemsList').snapshots(),
                      streamBranchSauces: FirebaseFirestore.instance.collection('MohandseenShopItems').doc('SaucesItems').collection('SauceItemsList').snapshots(),

                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    // BranchWidget(
                    //     streamBranch: FirebaseFirestore.instance
                    //         .collection('HosaryShopItems')
                    //         .snapshots(),
                    //     branchName: 'Hosary',
                    //     branchId: 1),
                    // const SizedBox(
                    //   height: 10,
                    // ),
                    //
                    // BranchWidget(
                    //     streamBranch: FirebaseFirestore.instance
                    //         .collection('HosaryShopItems')
                    //         .snapshots(),
                    //     branchName: 'Hosary',
                    //     branchId: 1),
                    // const SizedBox(
                    //   height: 10,
                    // ),
                    // BranchWidget(
                    //     streamBranch: FirebaseFirestore.instance
                    //         .collection('HosaryShopItems')
                    //         .snapshots(),
                    //     branchName: 'Hosary',
                    //     branchId: 1),
                    // const SizedBox(
                    //   height: 10,
                    // ),
                    // BranchWidget(
                    //     streamBranch: FirebaseFirestore.instance
                    //         .collection('HosaryShopItems')
                    //         .snapshots(),
                    //     branchName: 'Hosary',
                    //     branchId: 1),
                    // const SizedBox(
                    //   height: 10,
                    // ),


                  ],
                ),
              ),




              // Padding(
              //   padding: const EdgeInsets.all(6.0),
              //   child: Column(
              //     children: [
              //       BranchWidget(
              //           streamBranch: FirebaseFirestore.instance
              //               .collection('HosaryShopItems')
              //               .snapshots(),
              //           branchName: 'Hosary',
              //           branchId: 1),
              //       const SizedBox(
              //         height: 10,
              //       ),
              //       BranchWidget(
              //           streamBranch: FirebaseFirestore.instance
              //               .collection('MohandseenShopItems')
              //               .snapshots(),
              //           branchName: 'Mohandseen',
              //           branchId: 2),
              //       const SizedBox(
              //         height: 10,
              //       ),
              //
              //       BranchWidget(
              //           streamBranch: FirebaseFirestore.instance
              //               .collection('HosaryShopItems')
              //               .snapshots(),
              //           branchName: 'Hosary',
              //           branchId: 1),
              //       const SizedBox(
              //         height: 10,
              //       ),
              //
              //       BranchWidget(
              //           streamBranch: FirebaseFirestore.instance
              //               .collection('HosaryShopItems')
              //               .snapshots(),
              //           branchName: 'Hosary',
              //           branchId: 1),
              //       const SizedBox(
              //         height: 10,
              //       ),
              //       BranchWidget(
              //           streamBranch: FirebaseFirestore.instance
              //               .collection('HosaryShopItems')
              //               .snapshots(),
              //           branchName: 'Hosary',
              //           branchId: 1),
              //       const SizedBox(
              //         height: 10,
              //       ),
              //       BranchWidget(
              //           streamBranch: FirebaseFirestore.instance
              //               .collection('HosaryShopItems')
              //               .snapshots(),
              //           branchName: 'Hosary',
              //           branchId: 1),
              //       const SizedBox(
              //         height: 10,
              //       ),
              //
              //
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
