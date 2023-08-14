import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';

const kSecondcolor = Color(0xff222831);
const kPrimaryColor = Color(0xffFF7517);
const kAppBarHight = 70.0 ;
const kfontPop = 'Poppins';
const kfontAlex = 'Alexandria';
dynamic uidT='';
final Stream<QuerySnapshot> productStream = FirebaseFirestore.instance.collection('shopitems').snapshots();

