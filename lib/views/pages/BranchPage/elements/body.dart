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

                ExpansionTile(title:TextWithDividerWidget(text: '   FAISAL BRANCHES'),children: [BranchWidget(


                  streamBranch: FirebaseFirestore.instance
                      .collection('FaisalShopItems')
                      .snapshots(),
                  branchName: 'Nasr El-Sawra Street', //1
                  branchImage: 'assets/image/branches/faisal,nasr elsawra.png',
                  branchId: 1,
                  streamBranchRaw: FirebaseFirestore.instance.collection('FaisalShopItems').doc('RawItems').collection('RawItemsList').snapshots(),
                  streamBranchFried: FirebaseFirestore.instance.collection('FaisalShopItems').doc('FriedItems').collection('FriedItemsList').snapshots(),
                  streamBranchSauces: FirebaseFirestore.instance.collection('FaisalShopItems').doc('SaucesItems').collection('SaucesItemsList').snapshots(),
                  brachImage: 'assets/image/branches/faisal,nasr elsawra.png',


                ),
                  const SizedBox(
                    height: 5,
                  ),


                  BranchWidget(


                    streamBranch: FirebaseFirestore.instance
                        .collection('FaisalShopItems')
                        .snapshots(),
                    branchName: 'Al-Arish Street', //2
                    branchImage: 'assets/image/branches/faisal,alarish.jpg',
                    branchId: 1,
                    streamBranchRaw: FirebaseFirestore.instance.collection('FaisalShopItems').doc('RawItems').collection('RawItemsList').snapshots(),
                    streamBranchFried: FirebaseFirestore.instance.collection('FaisalShopItems').doc('FriedItems').collection('FriedItemsList').snapshots(),
                    streamBranchSauces: FirebaseFirestore.instance.collection('FaisalShopItems').doc('SaucesItems').collection('SaucesItemsList').snapshots(),
                    brachImage: 'assets/image/branches/faisal,alarish.jpg',


                  ),
                  const SizedBox(
                    height: 5,
                  ),



                  BranchWidget(


                    streamBranch: FirebaseFirestore.instance
                        .collection('FaisalShopItems')
                        .snapshots(),
                    branchName: 'Deyaa Street',  //3
                    branchImage: 'assets/image/branches/faisal,deyaa.jpg',
                    branchId: 1,
                    streamBranchRaw: FirebaseFirestore.instance.collection('FaisalShopItems').doc('RawItems').collection('RawItemsList').snapshots(),
                    streamBranchFried: FirebaseFirestore.instance.collection('FaisalShopItems').doc('FriedItems').collection('FriedItemsList').snapshots(),
                    streamBranchSauces: FirebaseFirestore.instance.collection('FaisalShopItems').doc('SaucesItems').collection('SaucesItemsList').snapshots(),
                    brachImage: 'assets/image/branches/faisal,deyaa.jpg',


                  ),
                  const SizedBox(
                    height: 5,
                  ),], ),




                // Haram Branches     //  ID =2
                const TextWithDividerWidget(text: '   HARAM BRANCHES'),
                BranchWidget(

                  streamBranch: FirebaseFirestore.instance
                      .collection('HaramShopItems')
                      .snapshots(),
                  branchName: 'Al-Nakheel Street',   //4
                  branchImage: 'assets/image/branches/haram,alnakheel.jpg',
                  branchId: 2,
                  streamBranchRaw: FirebaseFirestore.instance.collection('HaramShopItems').doc('RawItems').collection('RawItemsList').snapshots(),
                  streamBranchFried: FirebaseFirestore.instance.collection('HaramShopItems').doc('FriedItems').collection('FriedItemsList').snapshots(),
                  streamBranchSauces: FirebaseFirestore.instance.collection('HaramShopItems').doc('SaucesItems').collection('SaucesItemsList').snapshots(),
                  brachImage: 'assets/image/branches/haram,alnakheel.jpg',


                ),
                const SizedBox(
                  height: 5,
                ),
                BranchWidget(


                  streamBranch: FirebaseFirestore.instance
                      .collection('HaramShopItems')
                      .snapshots(),
                  branchName: 'Fatima Rushdi',  //5
                  branchImage: 'assets/image/branches/haram,fatima rushdi.jpg',
                  branchId: 2,
                  streamBranchRaw: FirebaseFirestore.instance.collection('HaramShopItems').doc('RawItems').collection('RawItemsList').snapshots(),
                  streamBranchFried: FirebaseFirestore.instance.collection('HaramShopItems').doc('FriedItems').collection('FriedItemsList').snapshots(),
                  streamBranchSauces: FirebaseFirestore.instance.collection('HaramShopItems').doc('SaucesItems').collection('SaucesItemsList').snapshots(),
                  brachImage: 'assets/image/branches/haram,fatima rushdi.jpg',


                ),
                const SizedBox(
                  height: 5,
                ),



                //October Branches  ID = 3
                const TextWithDividerWidget(text: '   OCTOBER BRANCHES'),

                BranchWidget(


                  streamBranch: FirebaseFirestore.instance
                      .collection('OctoberShopItems')
                      .snapshots(),
                  branchName: 'Nady El-Nady',
                  branchImage: 'assets/image/branches/october , nady el nady.png',
                  branchId: 3,
                  streamBranchRaw: FirebaseFirestore.instance.collection('OctoberShopItems').doc('RawItems').collection('RawItemsList').snapshots(),
                  streamBranchFried: FirebaseFirestore.instance.collection('OctoberShopItems').doc('FriedItems').collection('FriedItemsList').snapshots(),
                  streamBranchSauces: FirebaseFirestore.instance.collection('OctoberShopItems').doc('SaucesItems').collection('SaucesItemsList').snapshots(),
                  brachImage: 'assets/image/branches/october , nady el nady.png',


                ),
                const SizedBox(
                  height: 5,
                ),



                BranchWidget(


                  streamBranch: FirebaseFirestore.instance
                      .collection('OctoberShopItems')
                      .snapshots(),
                  branchName: 'El-Abd',
                  branchImage: 'assets/image/branches/oct,elabd.jpg',
                  branchId: 3,
                  streamBranchRaw: FirebaseFirestore.instance.collection('OctoberShopItems').doc('RawItems').collection('RawItemsList').snapshots(),
                  streamBranchFried: FirebaseFirestore.instance.collection('OctoberShopItems').doc('FriedItems').collection('FriedItemsList').snapshots(),
                  streamBranchSauces: FirebaseFirestore.instance.collection('OctoberShopItems').doc('SaucesItems').collection('SaucesItemsList').snapshots(),
                  brachImage: 'assets/image/branches/oct,elabd.jpg',


                ),
                const SizedBox(
                  height: 5,
                ),
                BranchWidget(


                  streamBranch: FirebaseFirestore.instance
                      .collection('OctoberShopItems')
                      .snapshots(),
                  branchName: 'First District',
                  branchImage: 'assets/image/branches/oct,first dist.jpg',
                  branchId: 3,
                  streamBranchRaw: FirebaseFirestore.instance.collection('OctoberShopItems').doc('RawItems').collection('RawItemsList').snapshots(),
                  streamBranchFried: FirebaseFirestore.instance.collection('OctoberShopItems').doc('FriedItems').collection('FriedItemsList').snapshots(),
                  streamBranchSauces: FirebaseFirestore.instance.collection('OctoberShopItems').doc('SaucesItems').collection('SaucesItemsList').snapshots(),
                  brachImage: 'assets/image/branches/oct,first dist.jpg',


                ),
                const SizedBox(
                  height: 5,
                ),
                BranchWidget(


                  streamBranch: FirebaseFirestore.instance
                      .collection('OctoberShopItems')
                      .snapshots(),
                  branchName: 'Seven District',
                  branchImage: 'assets/image/branches/oct,seventh dist.jpg',
                  branchId: 3,
                  streamBranchRaw: FirebaseFirestore.instance.collection('OctoberShopItems').doc('RawItems').collection('RawItemsList').snapshots(),
                  streamBranchFried: FirebaseFirestore.instance.collection('OctoberShopItems').doc('FriedItems').collection('FriedItemsList').snapshots(),
                  streamBranchSauces: FirebaseFirestore.instance.collection('OctoberShopItems').doc('SaucesItems').collection('SaucesItemsList').snapshots(),
                  brachImage: 'assets/image/branches/oct,seventh dist.jpg',


                ),
                const SizedBox(
                  height: 5,
                ),
                BranchWidget(


                  streamBranch: FirebaseFirestore.instance
                      .collection('OctoberShopItems')
                      .snapshots(),
                  branchName: 'Wadi Degla Gate 1',
                  branchImage: 'assets/image/branches/oct,wadi degla1.jpg',
                  branchId: 3,
                  streamBranchRaw: FirebaseFirestore.instance.collection('OctoberShopItems').doc('RawItems').collection('RawItemsList').snapshots(),
                  streamBranchFried: FirebaseFirestore.instance.collection('OctoberShopItems').doc('FriedItems').collection('FriedItemsList').snapshots(),
                  streamBranchSauces: FirebaseFirestore.instance.collection('OctoberShopItems').doc('SaucesItems').collection('SaucesItemsList').snapshots(),
                  brachImage: 'assets/image/branches/oct,wadi degla1.jpg',


                ),
                const SizedBox(
                  height: 5,
                ),
                BranchWidget(


                  streamBranch: FirebaseFirestore.instance
                      .collection('OctoberShopItems')
                      .snapshots(),
                  branchName: 'Wadi Degla Gate 2',
                  branchImage: 'assets/image/branches/oct,wadi degla2.jpg',
                  branchId: 3,
                  streamBranchRaw: FirebaseFirestore.instance.collection('OctoberShopItems').doc('RawItems').collection('RawItemsList').snapshots(),
                  streamBranchFried: FirebaseFirestore.instance.collection('OctoberShopItems').doc('FriedItems').collection('FriedItemsList').snapshots(),
                  streamBranchSauces: FirebaseFirestore.instance.collection('OctoberShopItems').doc('SaucesItems').collection('SaucesItemsList').snapshots(),
                  brachImage: 'assets/image/branches/oct,wadi degla2.jpg',


                ),
                const SizedBox(
                  height: 5,
                ),

                // Nasr City Branches
                const TextWithDividerWidget(text: '   NASR CITY BRANCHES'),
                BranchWidget(


                  streamBranch: FirebaseFirestore.instance
                      .collection('NasrCityShopItems')
                      .snapshots(),
                  branchName: 'Awel Abbas',
                  branchImage: 'assets/image/branches/nasr,awel abbas.jpg',
                  branchId: 4,
                  streamBranchRaw: FirebaseFirestore.instance.collection('NasrCityShopItems').doc('RawItems').collection('RawItemsList').snapshots(),
                  streamBranchFried: FirebaseFirestore.instance.collection('NasrCityShopItems').doc('FriedItems').collection('FriedItemsList').snapshots(),
                  streamBranchSauces: FirebaseFirestore.instance.collection('NasrCityShopItems').doc('SaucesItems').collection('SaucesItemsList').snapshots(), brachImage: 'assets/image/branches/nasr,awel abbas.jpg',


                ),
                const SizedBox(
                  height: 5,
                ),
                BranchWidget(


                  streamBranch: FirebaseFirestore.instance
                      .collection('NasrCityShopItems')
                      .snapshots(),
                  branchName: 'Awel Makram',
                  branchImage: 'assets/image/branches/nasr,awel makram.jpg',
                  branchId: 4,
                  streamBranchRaw: FirebaseFirestore.instance.collection('NasrCityShopItems').doc('RawItems').collection('RawItemsList').snapshots(),
                  streamBranchFried: FirebaseFirestore.instance.collection('NasrCityShopItems').doc('FriedItems').collection('FriedItemsList').snapshots(),
                  streamBranchSauces: FirebaseFirestore.instance.collection('NasrCityShopItems').doc('SaucesItems').collection('SaucesItemsList').snapshots(), brachImage: 'assets/image/branches/nasr,awel makram.jpg',


                ),
                const SizedBox(
                  height: 5,
                ),
                BranchWidget(


                  streamBranch: FirebaseFirestore.instance
                      .collection('NasrCityShopItems')
                      .snapshots(),
                  branchName: 'Sheraton',
                  branchImage: 'assets/image/branches/nasr,sheraton resid.jpg',
                  branchId: 4,
                  streamBranchRaw: FirebaseFirestore.instance.collection('NasrCityShopItems').doc('RawItems').collection('RawItemsList').snapshots(),
                  streamBranchFried: FirebaseFirestore.instance.collection('NasrCityShopItems').doc('FriedItems').collection('FriedItemsList').snapshots(),
                  streamBranchSauces: FirebaseFirestore.instance.collection('NasrCityShopItems').doc('SaucesItems').collection('SaucesItemsList').snapshots(), brachImage: 'assets/image/branches/nasr,sheraton resid.jpg',


                ),
                const SizedBox(
                  height: 5,
                ),


                // Zayed City
                const TextWithDividerWidget(text: '   ZAYED CITY BRANCHES'),
                BranchWidget(


                  streamBranch: FirebaseFirestore.instance
                      .collection('ZayedCityShopItems')
                      .snapshots(),
                  branchName: 'Zayed, Down town',
                  branchImage: 'assets/image/branches/zayed,downtoen.jpg',
                  branchId: 5,
                  streamBranchRaw: FirebaseFirestore.instance.collection('ZayedCityShopItems').doc('RawItems').collection('RawItemsList').snapshots(),
                  streamBranchFried: FirebaseFirestore.instance.collection('ZayedCityShopItems').doc('FriedItems').collection('FriedItemsList').snapshots(),
                  streamBranchSauces: FirebaseFirestore.instance.collection('ZayedCityShopItems').doc('SaucesItems').collection('SaucesItemsList').snapshots(), brachImage: 'assets/image/branches/zayed,downtoen.jpg',


                ),
                const SizedBox(
                  height: 5,
                ),

                // Giza
                const TextWithDividerWidget(text: '   GIZA BRANCHES'),
                BranchWidget(


                  streamBranch: FirebaseFirestore.instance
                      .collection('GizaShopItems')
                      .snapshots(),
                  branchName: 'Cairo University',
                  branchImage: 'assets/image/branches/giza,cairo university.jpg',
                  branchId: 6,
                  streamBranchRaw: FirebaseFirestore.instance.collection('GizaShopItems').doc('RawItems').collection('RawItemsList').snapshots(),
                  streamBranchFried: FirebaseFirestore.instance.collection('GizaShopItems').doc('FriedItems').collection('FriedItemsList').snapshots(),
                  streamBranchSauces: FirebaseFirestore.instance.collection('GizaShopItems').doc('SaucesItems').collection('SaucesItemsList').snapshots(),
                  brachImage: 'assets/image/branches/giza,cairo university.jpg',


                ),
                const SizedBox(
                  height: 5,
                ),
                BranchWidget(

                  streamBranch: FirebaseFirestore.instance
                      .collection('GizaShopItems')
                      .snapshots(),
                  branchName: 'Dokki Mesaha Square ',
                  branchImage: 'assets/image/branches/giza,dokki.jpg',
                  branchId: 6,
                  streamBranchRaw: FirebaseFirestore.instance.collection('GizaShopItems').doc('RawItems').collection('RawItemsList').snapshots(),
                  streamBranchFried: FirebaseFirestore.instance.collection('GizaShopItems').doc('FriedItems').collection('FriedItemsList').snapshots(),
                  streamBranchSauces: FirebaseFirestore.instance.collection('GizaShopItems').doc('SaucesItems').collection('SaucesItemsList').snapshots(),
                  brachImage: 'assets/image/branches/giza,dokki.jpg',


                ),
                const SizedBox(
                  height: 5,
                ),


                const TextWithDividerWidget(text: '   SHOUBRA BRANCHES'),
                BranchWidget(

                  streamBranch: FirebaseFirestore.instance
                      .collection('ShoubraShopItems')
                      .snapshots(),
                  branchName: 'Khalfawi',
                  branchImage: 'assets/image/branches/Khalfawi.png',
                  branchId: 7,
                  streamBranchRaw: FirebaseFirestore.instance.collection('ShoubraShopItems').doc('RawItems').collection('RawItemsList').snapshots(),
                  streamBranchFried: FirebaseFirestore.instance.collection('ShoubraShopItems').doc('FriedItems').collection('FriedItemsList').snapshots(),
                  streamBranchSauces: FirebaseFirestore.instance.collection('ShoubraShopItems').doc('SaucesItems').collection('SaucesItemsList').snapshots(),
                  brachImage: 'assets/image/branches/Khalfawi.png',


                ),
                const SizedBox(
                  height: 5,
                ),
                BranchWidget(

                  streamBranch: FirebaseFirestore.instance
                      .collection('ShoubraShopItems')
                      .snapshots(),
                  branchName: 'Rawd El-Farag',
                  branchImage: 'assets/image/branches/Rawd Al-Farag.png',
                  branchId: 7,
                  streamBranchRaw: FirebaseFirestore.instance.collection('ShoubraShopItems').doc('RawItems').collection('RawItemsList').snapshots(),
                  streamBranchFried: FirebaseFirestore.instance.collection('ShoubraShopItems').doc('FriedItems').collection('FriedItemsList').snapshots(),
                  streamBranchSauces: FirebaseFirestore.instance.collection('ShoubraShopItems').doc('SaucesItems').collection('SaucesItemsList').snapshots(),
                  brachImage: 'assets/image/branches/Rawd Al-Farag.png',


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






class TextWithDividerWidget extends StatelessWidget {
  final String text;

  const TextWithDividerWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Column(

      children: [
        const SizedBox(height: 12,),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              text,
              style: const TextStyle(fontFamily: 'poppins',color: Color(0xffFF7517),fontSize: 24),
            ),
          ],
        ),
        const SizedBox(height: 8,),
        const Divider(height:1,thickness: 3,),
      ],
    );
  }
}