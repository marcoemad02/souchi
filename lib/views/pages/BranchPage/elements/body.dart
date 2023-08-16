import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

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


                // Faisal Branches   // ID = 1
                const NewWidget(),
                const SizedBox(
                  height: 5,
                ),
                const NewWidget2(),
                const SizedBox(
                  height: 5,
                ),
                BranchWidget(


                  streamBranch: FirebaseFirestore.instance
                      .collection('FaisalShopItems')
                      .snapshots(),
                  branchName: 'شارع نصر الثورة',
                  branchImage: 'assets/image/حصري.png',
                  branchId: 1,
                  streamBranchRaw: FirebaseFirestore.instance.collection('FaisalShopItems').doc('RawItems').collection('RawItemsList').snapshots(),
                  streamBranchFried: FirebaseFirestore.instance.collection('FaisalShopItems').doc('FriedItems').collection('FriedItemsList').snapshots(),
                  streamBranchSauces: FirebaseFirestore.instance.collection('FaisalShopItems').doc('SauceItems').collection('SauceItemsList').snapshots(), brachImage: 'assets/image/حصري.png',


                ),
                const SizedBox(
                  height: 5,
                ),


                // Haram Branches     //  ID =2
                BranchWidget(

                  streamBranch: FirebaseFirestore.instance
                      .collection('HaramShopItems')
                      .snapshots(),
                  branchName: 'شارع النخيل',
                  branchImage: 'assets/image/حصري.png',
                  branchId: 2,
                  streamBranchRaw: FirebaseFirestore.instance.collection('HaramShopItems').doc('RawItems').collection('RawItemsList').snapshots(),
                  streamBranchFried: FirebaseFirestore.instance.collection('HaramShopItems').doc('FriedItems').collection('FriedItemsList').snapshots(),
                  streamBranchSauces: FirebaseFirestore.instance.collection('HaramShopItems').doc('SauceItems').collection('SauceItemsList').snapshots(), brachImage: 'assets/image/حصري.png',


                ),
                const SizedBox(
                  height: 5,
                ),
                BranchWidget(


                  streamBranch: FirebaseFirestore.instance
                      .collection('HaramShopItems')
                      .snapshots(),
                  branchName: 'فاطمه رشدي',
                  branchImage: 'assets/image/حصري.png',
                  branchId: 2,
                  streamBranchRaw: FirebaseFirestore.instance.collection('HaramShopItems').doc('RawItems').collection('RawItemsList').snapshots(),
                  streamBranchFried: FirebaseFirestore.instance.collection('HaramShopItems').doc('FriedItems').collection('FriedItemsList').snapshots(),
                  streamBranchSauces: FirebaseFirestore.instance.collection('HaramShopItems').doc('SauceItems').collection('SauceItemsList').snapshots(), brachImage: 'assets/image/حصري.png',


                ),
                const SizedBox(
                  height: 5,
                ),



                //October Branches  ID = 3
                BranchWidget(


                  streamBranch: FirebaseFirestore.instance
                      .collection('OctoberShopItems')
                      .snapshots(),
                  branchName: 'Wadi Degla 1',
                  branchImage: 'assets/image/حصري.png',
                  branchId: 3,
                  streamBranchRaw: FirebaseFirestore.instance.collection('OctoberShopItems').doc('RawItems').collection('RawItemsList').snapshots(),
                  streamBranchFried: FirebaseFirestore.instance.collection('OctoberShopItems').doc('FriedItems').collection('FriedItemsList').snapshots(),
                  streamBranchSauces: FirebaseFirestore.instance.collection('OctoberShopItems').doc('SauceItems').collection('SauceItemsList').snapshots(), brachImage: 'assets/image/حصري.png',


                ),
                const SizedBox(
                  height: 5,
                ),
                BranchWidget(


                  streamBranch: FirebaseFirestore.instance
                      .collection('OctoberShopItems')
                      .snapshots(),
                  branchName: 'Wadi Degla 2',
                  branchImage: 'assets/image/حصري.png',
                  branchId: 3,
                  streamBranchRaw: FirebaseFirestore.instance.collection('OctoberShopItems').doc('RawItems').collection('RawItemsList').snapshots(),
                  streamBranchFried: FirebaseFirestore.instance.collection('OctoberShopItems').doc('FriedItems').collection('FriedItemsList').snapshots(),
                  streamBranchSauces: FirebaseFirestore.instance.collection('OctoberShopItems').doc('SauceItems').collection('SauceItemsList').snapshots(), brachImage: 'assets/image/حصري.png',


                ),
                const SizedBox(
                  height: 5,
                ),
                BranchWidget(


                  streamBranch: FirebaseFirestore.instance
                      .collection('OctoberShopItems')
                      .snapshots(),
                  branchName: 'امام العبد ',
                  branchImage: 'assets/image/حصري.png',
                  branchId: 3,
                  streamBranchRaw: FirebaseFirestore.instance.collection('OctoberShopItems').doc('RawItems').collection('RawItemsList').snapshots(),
                  streamBranchFried: FirebaseFirestore.instance.collection('OctoberShopItems').doc('FriedItems').collection('FriedItemsList').snapshots(),
                  streamBranchSauces: FirebaseFirestore.instance.collection('OctoberShopItems').doc('SauceItems').collection('SauceItemsList').snapshots(), brachImage: 'assets/image/حصري.png',


                ),
                const SizedBox(
                  height: 5,
                ),
                BranchWidget(


                  streamBranch: FirebaseFirestore.instance
                      .collection('OctoberShopItems')
                      .snapshots(),
                  branchName: 'الحي الاول شارع الشهداء ',
                  branchImage: 'assets/image/حصري.png',
                  branchId: 3,
                  streamBranchRaw: FirebaseFirestore.instance.collection('OctoberShopItems').doc('RawItems').collection('RawItemsList').snapshots(),
                  streamBranchFried: FirebaseFirestore.instance.collection('OctoberShopItems').doc('FriedItems').collection('FriedItemsList').snapshots(),
                  streamBranchSauces: FirebaseFirestore.instance.collection('OctoberShopItems').doc('SauceItems').collection('SauceItemsList').snapshots(), brachImage: 'assets/image/حصري.png',


                ),
                const SizedBox(
                  height: 5,
                ),
                BranchWidget(


                  streamBranch: FirebaseFirestore.instance
                      .collection('OctoberShopItems')
                      .snapshots(),
                  branchName: 'الحي السابع ',
                  branchImage: 'assets/image/حصري.png',
                  branchId: 3,
                  streamBranchRaw: FirebaseFirestore.instance.collection('OctoberShopItems').doc('RawItems').collection('RawItemsList').snapshots(),
                  streamBranchFried: FirebaseFirestore.instance.collection('OctoberShopItems').doc('FriedItems').collection('FriedItemsList').snapshots(),
                  streamBranchSauces: FirebaseFirestore.instance.collection('OctoberShopItems').doc('SauceItems').collection('SauceItemsList').snapshots(), brachImage: 'assets/image/حصري.png',


                ),
                const SizedBox(
                  height: 5,
                ),

                // Nasr City Branches

                BranchWidget(


                  streamBranch: FirebaseFirestore.instance
                      .collection('NasrCityShopItems')
                      .snapshots(),
                  branchName: 'اول عباس ',
                  branchImage: 'assets/image/حصري.png',
                  branchId: 4,
                  streamBranchRaw: FirebaseFirestore.instance.collection('NasrCityShopItems').doc('RawItems').collection('RawItemsList').snapshots(),
                  streamBranchFried: FirebaseFirestore.instance.collection('NasrCityShopItems').doc('FriedItems').collection('FriedItemsList').snapshots(),
                  streamBranchSauces: FirebaseFirestore.instance.collection('NasrCityShopItems').doc('SauceItems').collection('SauceItemsList').snapshots(), brachImage: 'assets/image/حصري.png',


                ),
                const SizedBox(
                  height: 5,
                ),
                BranchWidget(


                  streamBranch: FirebaseFirestore.instance
                      .collection('NasrCityShopItems')
                      .snapshots(),
                  branchName: 'اول مكرم ',
                  branchImage: 'assets/image/حصري.png',
                  branchId: 4,
                  streamBranchRaw: FirebaseFirestore.instance.collection('NasrCityShopItems').doc('RawItems').collection('RawItemsList').snapshots(),
                  streamBranchFried: FirebaseFirestore.instance.collection('NasrCityShopItems').doc('FriedItems').collection('FriedItemsList').snapshots(),
                  streamBranchSauces: FirebaseFirestore.instance.collection('NasrCityShopItems').doc('SauceItems').collection('SauceItemsList').snapshots(), brachImage: 'assets/image/حصري.png',


                ),
                const SizedBox(
                  height: 5,
                ),
                BranchWidget(


                  streamBranch: FirebaseFirestore.instance
                      .collection('NasrCityShopItems')
                      .snapshots(),
                  branchName: 'مساكن شيراتون ',
                  branchImage: 'assets/image/حصري.png',
                  branchId: 4,
                  streamBranchRaw: FirebaseFirestore.instance.collection('NasrCityShopItems').doc('RawItems').collection('RawItemsList').snapshots(),
                  streamBranchFried: FirebaseFirestore.instance.collection('NasrCityShopItems').doc('FriedItems').collection('FriedItemsList').snapshots(),
                  streamBranchSauces: FirebaseFirestore.instance.collection('NasrCityShopItems').doc('SauceItems').collection('SauceItemsList').snapshots(), brachImage: 'assets/image/حصري.png',


                ),
                const SizedBox(
                  height: 5,
                ),


                // Zayed City

                BranchWidget(


                  streamBranch: FirebaseFirestore.instance
                      .collection('ZayedCityShopItems')
                      .snapshots(),
                  branchName: 'DownTown ',
                  branchImage: 'assets/image/حصري.png',
                  branchId: 5,
                  streamBranchRaw: FirebaseFirestore.instance.collection('ZayedCityShopItems').doc('RawItems').collection('RawItemsList').snapshots(),
                  streamBranchFried: FirebaseFirestore.instance.collection('ZayedCityShopItems').doc('FriedItems').collection('FriedItemsList').snapshots(),
                  streamBranchSauces: FirebaseFirestore.instance.collection('ZayedCityShopItems').doc('SaucesItems').collection('SaucesItemsList').snapshots(), brachImage: 'assets/image/حصري.png',


                ),
                const SizedBox(
                  height: 5,
                ),

                // Giza
                BranchWidget(


                  streamBranch: FirebaseFirestore.instance
                      .collection('GizaShopItems')
                      .snapshots(),
                  branchName: 'Cairo Universty ',
                  branchImage: 'assets/image/حصري.png',
                  branchId: 6,
                  streamBranchRaw: FirebaseFirestore.instance.collection('GizaShopItems').doc('RawItems').collection('RawItemsList').snapshots(),
                  streamBranchFried: FirebaseFirestore.instance.collection('GizaShopItems').doc('FriedItems').collection('FriedItemsList').snapshots(),
                  streamBranchSauces: FirebaseFirestore.instance.collection('GizaShopItems').doc('SauceItems').collection('SauceItemsList').snapshots(), brachImage: 'assets/image/حصري.png',


                ),
                const SizedBox(
                  height: 5,
                ),
                BranchWidget(

                  streamBranch: FirebaseFirestore.instance
                      .collection('GizaShopItems')
                      .snapshots(),
                  branchName: 'Dokki Mesahaa ',
                  branchImage: 'assets/image/حصري.png',
                  branchId: 6,
                  streamBranchRaw: FirebaseFirestore.instance.collection('GizaShopItems').doc('RawItems').collection('RawItemsList').snapshots(),
                  streamBranchFried: FirebaseFirestore.instance.collection('GizaShopItems').doc('FriedItems').collection('FriedItemsList').snapshots(),
                  streamBranchSauces: FirebaseFirestore.instance.collection('GizaShopItems').doc('SauceItems').collection('SauceItemsList').snapshots(), brachImage: 'assets/image/حصري.png',


                ),
                const SizedBox(
                  height: 5,
                ),






              ],
            ),
          ),
        ),
      ),
    );
  }
}

class NewWidget2 extends StatelessWidget {
  const NewWidget2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BranchWidget(

      streamBranch: FirebaseFirestore.instance
          .collection('FaisalShopItems')
          .snapshots(),
      branchName: 'شارع ضياء',
      branchImage: 'assets/image/حصري.png',
      branchId: 1,
      streamBranchRaw: FirebaseFirestore.instance.collection('FaisalShopItems').doc('RawItems').collection('RawItemsList').snapshots(),
      streamBranchFried: FirebaseFirestore.instance.collection('FaisalShopItems').doc('FriedItems').collection('FriedItemsList').snapshots(),
      streamBranchSauces: FirebaseFirestore.instance.collection('FaisalShopItems').doc('SauceItems').collection('SauceItemsList').snapshots(), brachImage: 'assets/image/حصري.png',


    );
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BranchWidget(

      streamBranch: FirebaseFirestore.instance
          .collection('FaisalShopItems')
          .snapshots(),
      branchName: 'شارع العريش',
      branchImage: 'assets/image/حصري.png',
      branchId: 1,
      streamBranchRaw: FirebaseFirestore.instance.collection('FaisalShopItems').doc('RawItems').collection('RawItemsList').snapshots(),
      streamBranchFried: FirebaseFirestore.instance.collection('FaisalShopItems').doc('FriedItems').collection('FriedItemsList').snapshots(),
      streamBranchSauces: FirebaseFirestore.instance.collection('FaisalShopItems').doc('SaucesItems').collection('SaucesItemsList').snapshots(), brachImage: 'assets/image/حصري.png',


    );
  }
}
