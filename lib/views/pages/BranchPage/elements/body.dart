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
        padding: const EdgeInsets.all(0),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Column(
              children: [
                BranchWidget(
                  ptsRef: FirebaseFirestore.instance.collection('users').snapshots(),

                    streamBranch: FirebaseFirestore.instance
                        .collection('HosaryShopItems')
                        .snapshots(),
                    branchName: 'Hosary',
                    branchImage: 'assets/image/حصري.png',
                    branchId: 1,
                streamBranchRaw: FirebaseFirestore.instance.collection('HosaryShopItems').doc('RawItems').collection('RawItemsList').snapshots(),
                streamBranchFried: FirebaseFirestore.instance.collection('HosaryShopItems').doc('FriedItems').collection('FriedItemsList').snapshots(),
                streamBranchSauces: FirebaseFirestore.instance.collection('HosaryShopItems').doc('SauceItems').collection('SauceItemsList').snapshots(), brachImage: 'assets/image/حصري.png',


                ),
                const SizedBox(
                  height: 5,
                ),
                BranchWidget(
                  ptsRef: FirebaseFirestore.instance.collection('users').snapshots(),
                    streamBranch: FirebaseFirestore.instance
                        .collection('MohandseenShopItems')
                        .snapshots(),
                    branchName: 'Mohandseen',
                    branchImage: 'assets/image/مهندسين.png',
                    branchId: 2,
                  streamBranchRaw: FirebaseFirestore.instance.collection('MohandseenShopItems').doc('RawItems').collection('RawItemsList').snapshots(),
                  streamBranchFried: FirebaseFirestore.instance.collection('MohandseenShopItems').doc('FriedItems').collection('FriedItemsList').snapshots(),
                  streamBranchSauces: FirebaseFirestore.instance.collection('MohandseenShopItems').doc('SaucesItems').collection('SauceItemsList').snapshots(), brachImage: 'assets/image/مهندسين.png',

                ),
                const SizedBox(
                  height:5,
                ),

                BranchWidget(
                  ptsRef: FirebaseFirestore.instance.collection('users').snapshots(),
                  streamBranch: FirebaseFirestore.instance
                      .collection('MohandseenShopItems')
                      .snapshots(),
                  branchName: 'Mohandseen',
                  branchImage: 'assets/image/التجمع.png',
                  branchId: 2,
                  streamBranchRaw: FirebaseFirestore.instance.collection('MohandseenShopItems').doc('RawItems').collection('RawItemsList').snapshots(),
                  streamBranchFried: FirebaseFirestore.instance.collection('MohandseenShopItems').doc('FriedItems').collection('FriedItemsList').snapshots(),
                  streamBranchSauces: FirebaseFirestore.instance.collection('MohandseenShopItems').doc('SaucesItems').collection('SauceItemsList').snapshots(), brachImage: 'assets/image/التجمع.png',

                ),
                const SizedBox(
                  height:5,
                ),


                BranchWidget(
                  ptsRef: FirebaseFirestore.instance.collection('users').snapshots(),
                  streamBranch: FirebaseFirestore.instance
                      .collection('MohandseenShopItems')
                      .snapshots(),
                  branchName: 'Mohandseen',
                  branchImage: 'assets/image/زايد.png',
                  branchId: 2,
                  streamBranchRaw: FirebaseFirestore.instance.collection('MohandseenShopItems').doc('RawItems').collection('RawItemsList').snapshots(),
                  streamBranchFried: FirebaseFirestore.instance.collection('MohandseenShopItems').doc('FriedItems').collection('FriedItemsList').snapshots(),
                  streamBranchSauces: FirebaseFirestore.instance.collection('MohandseenShopItems').doc('SaucesItems').collection('SauceItemsList').snapshots(), brachImage: 'assets/image/زايد.png',

                ),
                const SizedBox(
                  height:5,
                ),


                BranchWidget(
                  ptsRef: FirebaseFirestore.instance.collection('users').snapshots(),
                  streamBranch: FirebaseFirestore.instance
                      .collection('MohandseenShopItems')
                      .snapshots(),
                  branchName: 'Mohandseen',
                  branchImage: 'assets/image/حلوان.png',
                  branchId: 2,
                  streamBranchRaw: FirebaseFirestore.instance.collection('MohandseenShopItems').doc('RawItems').collection('RawItemsList').snapshots(),
                  streamBranchFried: FirebaseFirestore.instance.collection('MohandseenShopItems').doc('FriedItems').collection('FriedItemsList').snapshots(),
                  streamBranchSauces: FirebaseFirestore.instance.collection('MohandseenShopItems').doc('SaucesItems').collection('SauceItemsList').snapshots(), brachImage: 'assets/image/حلوان.png',

                ),
                const SizedBox(
                  height:5,
                ),


                BranchWidget(
                  ptsRef: FirebaseFirestore.instance.collection('users').snapshots(),
                  streamBranch: FirebaseFirestore.instance
                      .collection('MohandseenShopItems')
                      .snapshots(),
                  branchName: 'Mohandseen',
                  branchImage: 'assets/image/الساحل.png',
                  branchId: 2,
                  streamBranchRaw: FirebaseFirestore.instance.collection('MohandseenShopItems').doc('RawItems').collection('RawItemsList').snapshots(),
                  streamBranchFried: FirebaseFirestore.instance.collection('MohandseenShopItems').doc('FriedItems').collection('FriedItemsList').snapshots(),
                  streamBranchSauces: FirebaseFirestore.instance.collection('MohandseenShopItems').doc('SaucesItems').collection('SauceItemsList').snapshots(), brachImage: 'assets/image/الساحل.png',

                ),
                const SizedBox(
                  height:5,
                ),


                BranchWidget(
                  ptsRef: FirebaseFirestore.instance.collection('users').snapshots(),
                  streamBranch: FirebaseFirestore.instance
                      .collection('MohandseenShopItems')
                      .snapshots(),
                  branchName: 'Mohandseen',
                  branchImage: 'assets/image/مهندسين.png',
                  branchId: 2,
                  streamBranchRaw: FirebaseFirestore.instance.collection('MohandseenShopItems').doc('RawItems').collection('RawItemsList').snapshots(),
                  streamBranchFried: FirebaseFirestore.instance.collection('MohandseenShopItems').doc('FriedItems').collection('FriedItemsList').snapshots(),
                  streamBranchSauces: FirebaseFirestore.instance.collection('MohandseenShopItems').doc('SaucesItems').collection('SauceItemsList').snapshots(), brachImage: 'assets/image/مهندسين.png',

                ),
                const SizedBox(
                  height:5,
                ),


                BranchWidget(
                  ptsRef: FirebaseFirestore.instance.collection('users').snapshots(),
                  streamBranch: FirebaseFirestore.instance
                      .collection('MohandseenShopItems')
                      .snapshots(),
                  branchName: 'Mohandseen',
                  branchImage: 'assets/image/مهندسين.png',
                  branchId: 2,
                  streamBranchRaw: FirebaseFirestore.instance.collection('MohandseenShopItems').doc('RawItems').collection('RawItemsList').snapshots(),
                  streamBranchFried: FirebaseFirestore.instance.collection('MohandseenShopItems').doc('FriedItems').collection('FriedItemsList').snapshots(),
                  streamBranchSauces: FirebaseFirestore.instance.collection('MohandseenShopItems').doc('SaucesItems').collection('SauceItemsList').snapshots(), brachImage: 'assets/image/مهندسين.png',

                ),
                const SizedBox(
                  height:5,
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
