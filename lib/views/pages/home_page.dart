import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:souchi/const.dart';
import 'package:souchi/styles.dart';
import 'package:souchi/views/pages/ProfilePage/Helpcenter_Screen.dart';
import 'package:souchi/views/widgets/app_bar.dart';
import 'package:souchi/views/widgets/category_icon.dart';
import 'package:souchi/views/widgets/location_widget.dart';
import 'package:souchi/views/widgets/popular_list.dart';

import '../../enums.dart';
import '../widgets/NavBar.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
    required this.productStream,
    required this.branchName1,
    required this.branchId,
    required this.streamBranchRaw,
    required this.streamBranchFried,
    required this.streamBranchSauces,
  });

  final Stream<QuerySnapshot> productStream;
  final String branchName1;
  final int branchId;
  final Stream<QuerySnapshot> streamBranchRaw;
  final Stream<QuerySnapshot> streamBranchFried;
  final Stream<QuerySnapshot> streamBranchSauces;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
      // Fetch uidT from SharedPreferences
      future: SharedPreferences.getInstance()
          .then((prefs) => prefs.getString('uid')),
      builder: (context, uidSnapshot) {
        if (!uidSnapshot.hasData) {
          return const Center(child: CircularProgressIndicator());
        }

        final uidT = uidSnapshot.data!; // Use uidT here

        return Scaffold(
          //floatingActionButton: FloatingActionButton(
            //backgroundColor: kPrimaryColor,
            //child: const Icon(
              //Icons.phone,
            //),
            //onPressed: () {
              //Get.to(() => const HelpCenter());
            //},
          //),
          backgroundColor: Colors.grey[60],
          appBar: CustomAppBar(
            branchId: branchId,
            branchName: branchName1,
            streamBranch: productStream,
          ),
          body: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    StreamBuilder<dynamic>(
                      stream: FirebaseFirestore.instance
                          .collection('users')
                          .doc(uidT)
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return const Text('Waiting');
                        }
                        if (snapshot.connectionState == ConnectionState.none) {
                          return const Text('waiting Connection');
                        }
                        if (snapshot.hasError) {
                          return const Text('waiting');
                        }
                        dynamic points = snapshot.requireData;
                        setpoints(points['points']);
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Your Point Is ',style: TextStyle(fontFamily: 'poppins',color:Color(0xffFF7517),fontSize:18),),
                            Text('${points['points']}',style: const TextStyle(
                              color: Color(0xffFF7517),
                              fontFamily: 'poppins',
                              fontSize: 18,
                            )
                              ,),
                          ],
                        );
                      },
                    ),
                    const SizedBox(height: 15),
                    LocationWidget(branchName: branchName1),
                    const SizedBox(height: 10),
                    Image.asset('assets/image/homeimage.jpg'),
                    const SizedBox(height: 10),
                    const Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child:
                              Text('CATEGORY', style: Styles.textStyle30orange),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Category(
                      productStream: productStream,
                      branchId: branchId,
                      branchName1: branchName1,
                      streamBranchRaw: streamBranchRaw,
                      streamBranchSauces: streamBranchSauces,
                      streamBranchFried: streamBranchFried,
                    ),
                    const SizedBox(height: 20),
                    const BesteSellerList(),
                  ],
                ),
              ),
            ],
          ),
          bottomNavigationBar: CustomBottomNavBar(
            selectedMenu: MenuState.location,
            branchId: branchId,
            branchName: branchName1,
            streamBranch:
                FirebaseFirestore.instance.collection('activee').snapshots(),
          ),
        );
      },
    );
  }

  // ... (Rest of your code remains the same)

  setpoints(points) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('points', points);
  }
}





// class HomePage extends StatelessWidget {
//   const HomePage({
//     Key? key,
//     required this.productStream,
//     required this.branchName1,
//     required this.branchId,
//     required this.streamBranchRaw,
//     required this.streamBranchFried,
//     required this.streamBranchSauces,
//   });
//
//   //var controllerr = Get.put(ProductController());
//   final Stream<QuerySnapshot> productStream;
//   final String branchName1;
//   final int branchId;
//   final Stream<QuerySnapshot> streamBranchRaw;
//   final Stream<QuerySnapshot> streamBranchFried;
//   final Stream<QuerySnapshot> streamBranchSauces;
//
//   // final  Stream<QuerySnapshot> ptsRef;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(
//         backgroundColor: kPrimaryColor,
//         child: const Icon(
//           Icons.phone,
//         ),
//         onPressed: () {
//           Get.to(() => const HelpCenter());
//         },
//       ),
//       backgroundColor: Colors.grey[60],
//       appBar: CustomAppBar(
//           branchId: branchId,
//           branchName: branchName1,
//           streamBranch: productStream),
//       body: CustomScrollView(
//         slivers: [
//           SliverToBoxAdapter(
//             child: Column(
//               children: [
//                 StreamBuilder<dynamic>(
//                   stream: FirebaseFirestore.instance
//                       .collection('users')
//                       .doc(uidT)
//                       .snapshots(),
//                   builder: (context, snapshot) {
//                     if (!snapshot.hasData) {
//                       return const Text('Waiting');
//                     }
//                     if (snapshot.connectionState == ConnectionState.none) {
//                       return const Text('waiting Connection');
//                     }
//                     if (snapshot.hasError) {
//                       return const Text('waiting');
//                     }
//                     dynamic points = snapshot.requireData;
//                     setpoints(points['points']);
//                     return Text('${points['points']}');
//                   },
//                 ),
//                 // FutureBuilder(
//                 //
//                 //     future: getDoubleValuesSF(),
//                 //     builder: (context, snapshot) {
//                 //       if(!snapshot.hasData){
//                 //         return const Text('Waiting');
//                 //       }
//                 //       if(snapshot.connectionState== ConnectionState.none){
//                 //         return const Text('waiting Connection');
//                 //       }
//                 //       if(snapshot.hasError){
//                 //         return const Text('waiting');
//                 //       }
//                 //
//                 //       return Text('${snapshot.requireData}');
//                 //     }, ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 LocationWidget(branchName: branchName1),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 Image.asset('assets/image/homeimage.jpg'),
//                 const SizedBox(height: 10),
//                 const Row(
//                   children: [
//                     Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 20),
//                       child: Text('CATEGORY', style: Styles.textStyle30orange),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 20),
//                 Category(
//                   productStream: productStream,
//                   branchId: branchId,
//                   branchName1: branchName1,
//                   streamBranchRaw: streamBranchRaw,
//                   streamBranchSauces: streamBranchSauces,
//                   streamBranchFried: streamBranchFried,
//                 ),
//                 const SizedBox(height: 20),
//                 const BesteSellerList(),
//               ],
//             ),
//           ),
//         ],
//       ),
//       bottomNavigationBar: CustomBottomNavBar(
//         selectedMenu: MenuState.home,
//         branchId: branchId,
//         branchName: branchName1,
//         streamBranch:
//         FirebaseFirestore.instance.collection('activee').snapshots(),
//       ),
//     );
//   }
//
//   Future<int?> getDoubleValuesSF() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     //Return double
//     int? doubleValue = prefs.getInt('points');
//     print('double value${doubleValue}');
//     return doubleValue;
//   }
//
//   // Stream<DocumentSnapshot> getStream()  {
//   //   SharedPreferences prefs = await SharedPreferences.getInstance();
//   //   // int? doubleValue = prefs.getInt('points');
//   //   // print('double value${doubleValue}');
//   //  String? uid = prefs.getString('uid');
//   //
//   //  return FirebaseFirestore.instance.collection('users').doc(uid).snapshots();
//   //
//   // }
//
//   setpoints(points) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.setInt('points', points);
//   }
// }