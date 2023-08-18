

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../../views/pages/BranchPage/branch_view.dart';

class ProductController extends GetxController {
  // Branch IDs
    int    branchIdFaisal    = 1;
    int    branchIdHaram     = 2;
    int    branchIdOctober   = 3;
    int    branchIdNasrCity  = 4;
    int    branchIdZayedCity = 5;
    int    branchIdGiza      = 6;


    //

    double TotalPriceLE =0;
  // double totalHosary=0;
  // double totalMohandseen=0;
   //String AddressHosary='';
   //String NameHosary='';
  // String PhoneHosary='';
   String UserAddress='';
   String UserName='';
   String UserPhone='';
  // int currentPoints=0;
   //int PtsTotalPrice=0;
   int rewardPoints=0;
   int TotalRewardPoints=0;
   //int newNotExistPoints=0;
 //  int newExistPoints=0;
   int PtsTotalPrice=0;



  // Firestore Collections
  DocumentReference datacolFaisal =
  FirebaseFirestore.instance.collection('FaisalOrders').doc();
  DocumentReference datacolHaram = FirebaseFirestore.instance.collection('HaramOrders').doc();
  DocumentReference datacolOctober = FirebaseFirestore.instance.collection('OctoberOrders').doc();
  DocumentReference datacolNasrCity = FirebaseFirestore.instance.collection('NasrCityOrders').doc();
  DocumentReference datacolZayedCity = FirebaseFirestore.instance.collection('ZayedCityOrders').doc();
  DocumentReference datacolGiza = FirebaseFirestore.instance.collection('GizaOrders').doc();



  List<dynamic> CartItemsFaisal = [];
  List<dynamic> CartItemsHaram = [];
  List<dynamic> CartItemsOctober = [];
  List<dynamic> CartItemsNasrCity = [];
  List<dynamic> CartItemsZayedCity = [];
  List<dynamic> CartItemsGiza = [];

  // Functions to send data to Firestore for Each branch


  Future<void> sendDatatoFire_Faisal(idb,String paymentStatue) async {
   final now = new DateTime.now();
   SharedPreferences prefs=await SharedPreferences.getInstance();

    datacolFaisal.set({
      'order': {
         'Totalprice': TotalPriceLE.toString(),
         'orderlist': loopOnCart_Faisal(),
         'Address':UserAddress.toString(),
         'Phone':UserPhone.toString(),
         'Name' : UserName.toString(),
         'Time' :DateFormat.jm().format(now).toString(),
         'Payment' :paymentStatue,
         'OrderId': datacolFaisal.id,
         'UserID' :prefs.get('uid'),
         'RewardPoints':TotalRewardPoints,
         'UserPoints' : prefs.get('points'),
         // 'TotalAfterReward':currentPoints,
          'PtsTotalPrice':PtsTotalPrice
         //'points':currentPoints


      },
      'color':'White'
    });
  }
  Future<void> sendDatatoFire_Haram(idb,String paymentStatue) async {
   final now = new DateTime.now();
   SharedPreferences prefs=await SharedPreferences.getInstance();

    datacolHaram.set({
      'order': {
         'Totalprice': TotalPriceLE.toString(),
         'orderlist': loopOnCart_Haram(),
         'Address':UserAddress.toString(),
         'Phone':UserPhone.toString(),
         'Name' : UserName.toString(),
         'Time' :DateFormat.jm().format(now).toString(),
         'Payment' :paymentStatue,
         'OrderId': datacolHaram.id,
         'UserID' :prefs.get('uid'),
         'RewardPoints':TotalRewardPoints,
         'UserPoints' : prefs.get('points'),

          'PtsTotalPrice':PtsTotalPrice



      },
      'color':'White'
    });
  }
  Future<void> sendDatatoFire_October(idb,String paymentStatue) async {
   final now = new DateTime.now();
   SharedPreferences prefs=await SharedPreferences.getInstance();

    datacolOctober.set({
      'order': {
         'Totalprice': TotalPriceLE.toString(),
         'orderlist': loopOnCart_October(),
         'Address':UserAddress.toString(),
         'Phone':UserPhone.toString(),
         'Name' : UserName.toString(),
         'Time' :DateFormat.jm().format(now).toString(),
         'Payment' :paymentStatue,
         'OrderId': datacolOctober.id,
         'UserID' :prefs.get('uid'),
         'RewardPoints':TotalRewardPoints,
         'UserPoints' : prefs.get('points'),
         // 'TotalAfterReward':currentPoints,
          'PtsTotalPrice':PtsTotalPrice
         //'points':currentPoints


      },
      'color':'White'
    });
  }
  Future<void> sendDatatoFire_NasrCity(idb,String paymentStatue) async {
   final now = new DateTime.now();
   SharedPreferences prefs=await SharedPreferences.getInstance();

    datacolNasrCity.set({
      'order': {
         'Totalprice': TotalPriceLE.toString(),
         'orderlist': loopOnCart_NasrCity(),
         'Address':UserAddress.toString(),
         'Phone':UserPhone.toString(),
         'Name' : UserName.toString(),
         'Time' :DateFormat.jm().format(now).toString(),
         'Payment' :paymentStatue,
         'OrderId': datacolNasrCity.id,
         'UserID' :prefs.get('uid'),
         'RewardPoints':TotalRewardPoints,
         'UserPoints' : prefs.get('points'),
         // 'TotalAfterReward':currentPoints,
          'PtsTotalPrice':PtsTotalPrice
         //'points':currentPoints


      },
      'color':'White'
    });
  }
  Future<void> sendDatatoFire_ZayedCity(idb,String paymentStatue) async {
   final now = new DateTime.now();
   SharedPreferences prefs=await SharedPreferences.getInstance();

    datacolZayedCity.set({
      'order': {
         'Totalprice': TotalPriceLE.toString(),
         'orderlist': loopOnCart_ZayedCity(),
         'Address':UserAddress.toString(),
         'Phone':UserPhone.toString(),
         'Name' : UserName.toString(),
         'Time' :DateFormat.jm().format(now).toString(),
         'Payment' :paymentStatue,
         'OrderId': datacolZayedCity.id,
         'UserID' :prefs.get('uid'),
         'RewardPoints':TotalRewardPoints,
         'UserPoints' : prefs.get('points'),
         // 'TotalAfterReward':currentPoints,
          'PtsTotalPrice':PtsTotalPrice
         //'points':currentPoints


      },
      'color':'White'
    });
  }
  Future<void> sendDatatoFire_Giza(idb,String paymentStatue) async {
   final now = new DateTime.now();
   SharedPreferences prefs=await SharedPreferences.getInstance();

    datacolGiza.set({
      'order': {
         'Totalprice': TotalPriceLE.toString(),
         'orderlist': loopOnCart_Giza(),
         'Address':UserAddress.toString(),
         'Phone':UserPhone.toString(),
         'Name' : UserName.toString(),
         'Time' :DateFormat.jm().format(now).toString(),
         'Payment' :paymentStatue,
         'OrderId': datacolGiza.id,
         'UserID' :prefs.get('uid'),
         'RewardPoints':TotalRewardPoints,
         'UserPoints' : prefs.get('points'),
         // 'TotalAfterReward':currentPoints,
          'PtsTotalPrice':PtsTotalPrice
         //'points':currentPoints


      },
      'color':'White'
    });
  }




  void validatorBranch(productObject, idbranch, int Quant,int points, bouns) {
    if (branchIdFaisal == idbranch) {
      print('here');
      print('Here contrp${Quant}');
      addItemToCart_Faisal(productObject, Quant,points,bouns);
      print('HosaryList${CartItemsFaisal}');
      print('MohandList${CartItemsHaram}');
      print('MohandList${CartItemsOctober}');
      print('MohandList${CartItemsNasrCity}');
      print('MohandList${CartItemsZayedCity}');
      print('MohandList${CartItemsGiza}');
    }
    if (branchIdHaram== idbranch) {
      print('here');
      print('Here contrp${Quant}');
      addItemToCart_Haram(productObject, Quant,points,bouns);
      print('HosaryList${CartItemsFaisal}');
      print('MohandList${CartItemsHaram}');
      print('MohandList${CartItemsOctober}');
      print('MohandList${CartItemsNasrCity}');
      print('MohandList${CartItemsZayedCity}');
      print('MohandList${CartItemsGiza}');
    }
    if (branchIdOctober == idbranch) {
      print('here');
      print('Here contrp${Quant}');
      addItemToCart_October(productObject, Quant,points,bouns);
      print('HosaryList${CartItemsFaisal}');
      print('MohandList${CartItemsHaram}');
      print('MohandList${CartItemsOctober}');
      print('MohandList${CartItemsNasrCity}');
      print('MohandList${CartItemsZayedCity}');
      print('MohandList${CartItemsGiza}');
    }
    if (branchIdNasrCity == idbranch) {
      print('here');
      print('Here contrp${Quant}');
      addItemToCart_NasrCity(productObject, Quant,points,bouns);
      print('HosaryList${CartItemsFaisal}');
      print('MohandList${CartItemsHaram}');
      print('MohandList${CartItemsOctober}');
      print('MohandList${CartItemsNasrCity}');
      print('MohandList${CartItemsZayedCity}');
      print('MohandList${CartItemsGiza}');
    }
    if (branchIdZayedCity == idbranch) {
      print('here');
      print('Here contrp${Quant}');
      addItemToCart_ZayedCity(productObject, Quant,points,bouns);
      print('HosaryList${CartItemsFaisal}');
      print('MohandList${CartItemsHaram}');
      print('MohandList${CartItemsOctober}');
      print('MohandList${CartItemsNasrCity}');
      print('MohandList${CartItemsZayedCity}');
      print('MohandList${CartItemsGiza}');
    }
    if (branchIdGiza == idbranch) {
      print('here');
      print('Here contrp${Quant}');
      addItemToCart_Giza(productObject, Quant,points,bouns);
      print('HosaryList${CartItemsFaisal}');
      print('MohandList${CartItemsHaram}');
      print('MohandList${CartItemsOctober}');
      print('MohandList${CartItemsNasrCity}');
      print('MohandList${CartItemsZayedCity}');
      print('MohandList${CartItemsGiza}');
    }
  }

  // Function to send cart data to Firestore based on branch ID
  Future<void> validatorCart_Cash({required int id, name, phone, address,paymentStatue}) async {
    if (branchIdFaisal == id) {
      await TakeUserOrderData(id: id,address:  address,name: name,phone: phone);
      await sendDatatoFire_Faisal(id,paymentStatue);

    }
    if(branchIdHaram==id) {
      await TakeUserOrderData(id:  id,address:  address,name: name,phone: phone);
      await sendDatatoFire_Haram(id,paymentStatue);


    }
    if(branchIdOctober==id) {
      await TakeUserOrderData(id:  id,address:  address,name: name,phone: phone);
      await sendDatatoFire_October(id,paymentStatue);


    }
    if(branchIdNasrCity==id) {
      await TakeUserOrderData(id:  id,address:  address,name: name,phone: phone);
      await sendDatatoFire_NasrCity(id,paymentStatue);


    }
    if(branchIdZayedCity==id) {
      await TakeUserOrderData(id:  id,address:  address,name: name,phone: phone);
      await sendDatatoFire_ZayedCity(id,paymentStatue);


    }
    if(branchIdGiza==id) {
      await TakeUserOrderData(id:  id,address:  address,name: name,phone: phone);
      await sendDatatoFire_Giza(id,paymentStatue);


    }
  }
  Future<void> validatorCart_Points({required int id, name, phone, address,points,paymentStatue}) async {
    SharedPreferences prefs=await SharedPreferences.getInstance();
    int? userpoints=prefs.getInt('points') ;
    if (branchIdFaisal == id) {
      await TakeUserOrderData(id: id,address:  address,name: name,phone: phone);
      if(userpoints!<PtsTotalPrice){
        Get.snackbar('Attention', 'You Not have points ',backgroundColor:Colors.yellow);
      }
      else{
       // await updateUserPoints();
        await sendDatatoFire_Faisal(id,paymentStatue);

        Get.snackbar('Attention ', 'Order sent To Bike',backgroundColor: Colors.green);
        Get.offAll(()=>const BranchScreen());



      }

    }
    if(branchIdHaram==id) {
      await TakeUserOrderData(id:  id,address:  address,name: name,phone: phone);
      if(userpoints!<PtsTotalPrice){
        Get.snackbar('Attention', 'You Not have Much points ',backgroundColor:Colors.yellow);
      }
      else{
        //await updateUserPoints();
        await sendDatatoFire_Haram(id,paymentStatue);

        Get.snackbar('Attention ', 'Order sent To Bike',backgroundColor: Colors.green);
        Get.offAll(()=>const BranchScreen());



      }



    }
    if(branchIdOctober==id) {
      await TakeUserOrderData(id:  id,address:  address,name: name,phone: phone);
      if(userpoints!<PtsTotalPrice){
        Get.snackbar('Attention', 'You Not have Much points ',backgroundColor:Colors.yellow);
      }
      else{
        //await updateUserPoints();
        await sendDatatoFire_October(id,paymentStatue);

        Get.snackbar('Attention ', 'Order sent To Bike',backgroundColor: Colors.green);
        Get.offAll(()=>const BranchScreen());



      }



    }
    if(branchIdNasrCity==id) {
      await TakeUserOrderData(id:  id,address:  address,name: name,phone: phone);
      if(userpoints!<PtsTotalPrice){
        Get.snackbar('Attention', 'You Not have Much points ',backgroundColor:Colors.yellow);
      }
      else{
        //await updateUserPoints();
        await sendDatatoFire_NasrCity(id,paymentStatue);

        Get.snackbar('Attention ', 'Order sent To Bike',backgroundColor: Colors.green);
        Get.offAll(()=>const BranchScreen());



      }



    }
    if(branchIdZayedCity==id) {
      await TakeUserOrderData(id:  id,address:  address,name: name,phone: phone);
      if(userpoints!<PtsTotalPrice){
        Get.snackbar('Attention', 'You Not have Much points ',backgroundColor:Colors.yellow);
      }
      else{
        //await updateUserPoints();
        await sendDatatoFire_ZayedCity(id,paymentStatue);

        Get.snackbar('Attention ', 'Order sent To Bike',backgroundColor: Colors.green);
        Get.offAll(()=>const BranchScreen());



      }



    }
    if(branchIdGiza==id) {
      await TakeUserOrderData(id:  id,address:  address,name: name,phone: phone);
      if(userpoints!<PtsTotalPrice){
        Get.snackbar('Attention', 'You Not have Much points ',backgroundColor:Colors.yellow);
      }
      else{
        //await updateUserPoints();
        await sendDatatoFire_Giza(id,paymentStatue);

        Get.snackbar('Attention ', 'Order sent To Bike',backgroundColor: Colors.green);
        Get.offAll(()=>const BranchScreen());



      }



    }
  }

  // Validator Function to clear cart data based on branch ID
  void validatorClear(idbranch) {
    if (branchIdFaisal == idbranch)  {
      CartItemsFaisal.clear();
       TotalPriceLE=0;
       TotalRewardPoints=0;
       PtsTotalPrice=0;


      update();
      print('cartItemCleared');
      print('HosaryList${CartItemsFaisal}');
      print('MohandList${CartItemsHaram}');
      print('MohandList${CartItemsOctober}');
      print('MohandList${CartItemsNasrCity}');
      print('MohandList${CartItemsZayedCity}');
      print('MohandList${CartItemsGiza}');
      print('Total LE :${TotalPriceLE}');
      print('Total reward: ${TotalRewardPoints}');
      print('Total Pts :${PtsTotalPrice}');
    }
    if (branchIdHaram == idbranch) {
      CartItemsHaram.clear();
      TotalPriceLE=0;
      TotalRewardPoints=0;
      PtsTotalPrice=0;
      update();
      print('cartItemCleared');
      print('HosaryList${CartItemsFaisal}');
      print('MohandList${CartItemsHaram}');
      print('MohandList${CartItemsOctober}');
      print('MohandList${CartItemsNasrCity}');
      print('MohandList${CartItemsZayedCity}');
      print('MohandList${CartItemsGiza}');
      print('Total LE :${TotalPriceLE}');
      print('Total reward: ${TotalRewardPoints}');
      print('Total Pts :${PtsTotalPrice}');
    }
    if (branchIdOctober == idbranch) {
      CartItemsOctober.clear();
      TotalPriceLE=0;
      TotalRewardPoints=0;
      PtsTotalPrice=0;
      update();
      print('cartItemCleared');
      print('HosaryList${CartItemsFaisal}');
      print('MohandList${CartItemsHaram}');
      print('MohandList${CartItemsOctober}');
      print('MohandList${CartItemsNasrCity}');
      print('MohandList${CartItemsZayedCity}');
      print('MohandList${CartItemsGiza}');
      print('Total LE :${TotalPriceLE}');
      print('Total reward: ${TotalRewardPoints}');
      print('Total Pts :${PtsTotalPrice}');
    }
    if (branchIdNasrCity == idbranch) {
      CartItemsNasrCity.clear();
      TotalPriceLE=0;
      TotalRewardPoints=0;
      PtsTotalPrice=0;
      update();
      print('cartItemCleared');
      print('HosaryList${CartItemsFaisal}');
      print('MohandList${CartItemsHaram}');
      print('MohandList${CartItemsOctober}');
      print('MohandList${CartItemsNasrCity}');
      print('MohandList${CartItemsZayedCity}');
      print('MohandList${CartItemsGiza}');
      print('Total LE :${TotalPriceLE}');
      print('Total reward: ${TotalRewardPoints}');
      print('Total Pts :${PtsTotalPrice}');
    }
    if (branchIdZayedCity == idbranch) {
      CartItemsZayedCity.clear();
      TotalPriceLE=0;
      TotalRewardPoints=0;
      PtsTotalPrice=0;
      update();
      print('cartItemCleared');
      print('HosaryList${CartItemsFaisal}');
      print('MohandList${CartItemsHaram}');
      print('MohandList${CartItemsOctober}');
      print('MohandList${CartItemsNasrCity}');
      print('MohandList${CartItemsZayedCity}');
      print('MohandList${CartItemsGiza}');
      print('Total LE :${TotalPriceLE}');
      print('Total reward: ${TotalRewardPoints}');
      print('Total Pts :${PtsTotalPrice}');
    }
    if (branchIdGiza == idbranch) {
      CartItemsGiza.clear();
      TotalPriceLE=0;
      TotalRewardPoints=0;
      PtsTotalPrice=0;
      update();
      print('cartItemCleared');
      print('HosaryList${CartItemsFaisal}');
      print('MohandList${CartItemsHaram}');
      print('MohandList${CartItemsOctober}');
      print('MohandList${CartItemsNasrCity}');
      print('MohandList${CartItemsZayedCity}');
      print('MohandList${CartItemsGiza}');
      print('Total LE :${TotalPriceLE}');
      print('Total reward: ${TotalRewardPoints}');
      print('Total Pts :${PtsTotalPrice}');

    }
  }

  //  Validator Function to calculate total price based on branch ID
  void calculationTotalValidator(idb) {

    if (branchIdFaisal == idb) {
      TotalPriceLE = calculateTotal_FaisalBranch();
      TotalRewardPoints=calculateTotalRewardPoints_FaisalBranch();
      PtsTotalPrice=calculateTotalPointsPrice_FaisalBranch() ;
      print('Total LE :${TotalPriceLE}');
      print('Total reward: ${TotalRewardPoints}');
      print('Total Pts :${PtsTotalPrice}');
    }
    if (branchIdHaram == idb) {
      TotalPriceLE = calculateTotal_HaramBranch();
      TotalRewardPoints=calculateTotalRewardPoints_HaramBranch();
      PtsTotalPrice=calculateTotalPointsPrice_HaramBranch();
      print('Total LE :${TotalPriceLE}');
      print('Total reward: ${TotalRewardPoints}');
      print('Total Pts :${PtsTotalPrice}');
    }
    if (branchIdOctober == idb) {
      TotalPriceLE = calculateTotal_OctoberBranch();
      TotalRewardPoints=calculateTotalRewardPoints_OctoberBranch();
      PtsTotalPrice=calculateTotalPointsPrice_OctoberBranch();
      print('Total LE :${TotalPriceLE}');
      print('Total reward: ${TotalRewardPoints}');
      print('Total Pts :${PtsTotalPrice}');
    }
    if (branchIdNasrCity == idb) {
      TotalPriceLE = calculateTotal_NasrCityBranch();
      TotalRewardPoints=calculateTotalRewardPoints_NasrCityBranch();
      PtsTotalPrice=calculateTotalPointsPrice_NasrCityBranch() ;
      print('Total LE :${TotalPriceLE}');
      print('Total reward: ${TotalRewardPoints}');
      print('Total Pts :${PtsTotalPrice}');
    }
    if (branchIdZayedCity == idb) {
      TotalPriceLE = calculateTotal_ZayedCityBranch();
      TotalRewardPoints=calculateTotalRewardPoints_ZayedCityBranch();
      PtsTotalPrice=calculateTotalPointsPrice_ZayedCityBranch();
      print('Total LE :${TotalPriceLE}');
      print('Total reward: ${TotalRewardPoints}');
      print('Total Pts :${PtsTotalPrice}');
    }
    if (branchIdGiza == idb) {
      TotalPriceLE = calculateTotal_GizaBranch();
      TotalRewardPoints=calculateTotalRewardPoints_GizaBranch();
      PtsTotalPrice=calculateTotalPointsPrice_GizaBranch() ;
      print('Total LE :${TotalPriceLE}');
      print('Total reward: ${TotalRewardPoints}');
      print('Total Pts :${PtsTotalPrice}');
    }










  }

 // Function TakeUserOrderData
  Future<void> TakeUserOrderData({required int id, name, phone, address})async{
    if(branchIdFaisal==id){

      UserAddress=takeAddrress(address);
      UserName=takeName(name);
      UserPhone=takePhone(phone);
      update();
    }
    if(branchIdHaram==id){

      UserAddress=takeAddrress(address);
      UserName=takeName(name);
      UserPhone=takePhone(phone);
      update();
    }
    if(branchIdOctober==id){

      UserAddress=takeAddrress(address);
      UserName=takeName(name);
      UserPhone=takePhone(phone);
      update();
    }
    if(branchIdNasrCity==id){

      UserAddress=takeAddrress(address);
      UserName=takeName(name);
      UserPhone=takePhone(phone);
      update();
    }
    if(branchIdZayedCity==id){

      UserAddress=takeAddrress(address);
      UserName=takeName(name);
      UserPhone=takePhone(phone);
      update();
    }
    if(branchIdGiza==id){

      UserAddress=takeAddrress(address);
      UserName=takeName(name);
      UserPhone=takePhone(phone);
      update();
    }


  }
  String takeAddrress(address){
    return address.toString();

  }
  String takeName(name){
    return name.toString();

  }
  String takePhone(phone){
    return phone.toString();

  }

  // Function to calculate total Reward Points for each Branch

 int calculateTotalRewardPoints_FaisalBranch() {

    int totalPoints = 0;
    for (int i = 0; i < CartItemsFaisal.length; i++) {
      totalPoints += ((CartItemsFaisal[i][3] as int )* (CartItemsFaisal[i][1] as int ))   ;

    }
    return totalPoints;
  }
 int calculateTotalRewardPoints_HaramBranch() {

    int totalPoints = 0;
    for (int i = 0; i < CartItemsHaram.length; i++) {
      totalPoints += CartItemsHaram[i][2] as int ;

    }
    return totalPoints;
  }
 int calculateTotalRewardPoints_OctoberBranch() {

    int totalPoints = 0;
    for (int i = 0; i < CartItemsOctober.length; i++) {
      totalPoints += CartItemsOctober[i][2] as int ;

    }
    return totalPoints;
  }
 int calculateTotalRewardPoints_NasrCityBranch() {

    int totalPoints = 0;
    for (int i = 0; i < CartItemsNasrCity.length; i++) {
      totalPoints += CartItemsNasrCity[i][2] as int ;

    }
    return totalPoints;
  }
 int calculateTotalRewardPoints_ZayedCityBranch() {

    int totalPoints = 0;
    for (int i = 0; i < CartItemsZayedCity.length; i++) {
      totalPoints += CartItemsZayedCity[i][2] as int ;

    }
    return totalPoints;
  }
 int calculateTotalRewardPoints_GizaBranch() {

    int totalPoints = 0;
    for (int i = 0; i < CartItemsGiza.length; i++) {
      totalPoints += CartItemsGiza[i][2] as int ;

    }
    return totalPoints;
  }








  //  Functions To Calculate TotalPts Price  for Each Branch

  int calculateTotalPointsPrice_FaisalBranch() {

    int totalPts = 0;
    for (int i = 0; i < CartItemsFaisal.length; i++) {
      totalPts += ((CartItemsFaisal[i][0]['pts'] as int) * (CartItemsFaisal[i][1] as int));

    }
    return totalPts;
  }
  int calculateTotalPointsPrice_HaramBranch() {

    int totalPts = 0;
    for (int i = 0; i < CartItemsHaram.length; i++) {
      totalPts += ((CartItemsHaram[i][0]['pts'] as int) * (CartItemsHaram[i][1] as int));

    }
    return totalPts;
  }
  int calculateTotalPointsPrice_OctoberBranch() {

    int totalPts = 0;
    for (int i = 0; i < CartItemsOctober.length; i++) {
      totalPts += ((CartItemsOctober[i][0]['pts'] as int) * (CartItemsOctober[i][1] as int));

    }
    return totalPts;
  }
  int calculateTotalPointsPrice_NasrCityBranch() {

    int totalPts = 0;
    for (int i = 0; i < CartItemsNasrCity.length; i++) {
      totalPts += ((CartItemsNasrCity[i][0]['pts'] as int) * (CartItemsNasrCity[i][1] as int));

    }
    return totalPts;
  }
  int calculateTotalPointsPrice_ZayedCityBranch() {

    int totalPts = 0;
    for (int i = 0; i < CartItemsZayedCity.length; i++) {
      totalPts += ((CartItemsZayedCity[i][0]['pts'] as int) * (CartItemsZayedCity[i][1] as int));

    }
    return totalPts;
  }
  int calculateTotalPointsPrice_GizaBranch() {

    int totalPts = 0;
    for (int i = 0; i < CartItemsGiza.length; i++) {
      totalPts += ((CartItemsGiza[i][0]['pts'] as int) * (CartItemsGiza[i][1] as int));

    }
    return totalPts;
  }


  // Functions to calculate total price for each Branch
  double calculateTotal_FaisalBranch() {
    double totalPrice = 0;

    for (int i = 0; i < CartItemsFaisal.length; i++) {
      totalPrice += (double.parse(CartItemsFaisal[i][0]['price']) * CartItemsFaisal[i][1]);

    }
    return totalPrice;
  }
  double calculateTotal_HaramBranch() {
    double totalPrice = 0;
    for (int i = 0; i < CartItemsHaram.length; i++) {
      totalPrice += (double.parse(CartItemsHaram[i][0]['price']) * CartItemsHaram[i][1]);
    }
    return totalPrice;
  }
  double calculateTotal_OctoberBranch() {
    double totalPrice = 0;
    for (int i = 0; i < CartItemsOctober.length; i++) {
      totalPrice += (double.parse(CartItemsOctober[i][0]['price']) * CartItemsOctober[i][1]);
    }
    return totalPrice;
  }
  double calculateTotal_NasrCityBranch() {
    double totalPrice = 0;
    for (int i = 0; i < CartItemsNasrCity.length; i++) {
      totalPrice += (double.parse(CartItemsNasrCity[i][0]['price']) * CartItemsNasrCity[i][1]);
    }
    return totalPrice;
  }
  double calculateTotal_ZayedCityBranch() {
    double totalPrice = 0;
    for (int i = 0; i < CartItemsZayedCity.length; i++) {
      totalPrice += (double.parse(CartItemsZayedCity[i][0]['price']) * CartItemsZayedCity[i][1]);
    }
    return totalPrice;
  }
  double calculateTotal_GizaBranch() {
    double totalPrice = 0;
    for (int i = 0; i < CartItemsGiza.length; i++) {
      totalPrice += (double.parse(CartItemsGiza[i][0]['price']) * CartItemsGiza[i][1]);
    }
    return totalPrice;
  }

  // Function to loop on the cart items and get product names for each Branch
  List<dynamic> loopOnCart_Faisal()   {
    List<dynamic> datalist = [];
    for (int i = 0; i < CartItemsFaisal.length; i++) {
      datalist.add({
        'ProductName':CartItemsFaisal[i][0]['productname'],
        'Quantity':CartItemsFaisal[i][1],
      });
    }
    return datalist;
  }
  List<dynamic> loopOnCart_Haram()    {
    List<dynamic> datalist = [];
    for (int i = 0; i < CartItemsHaram.length; i++) {
      datalist.add({
        'ProductName':CartItemsHaram[i][0]['productname'],
        'Quantity':CartItemsHaram[i][1],
      });
    }
    return datalist;
  }
  List<dynamic> loopOnCart_October() {
    List<dynamic> datalist = [];
    for (int i = 0; i < CartItemsOctober.length; i++) {
      datalist.add({
        'ProductName':CartItemsOctober[i][0]['productname'],
        'Quantity':CartItemsOctober[i][1],
      });
    }
    return datalist;
  }
  List<dynamic> loopOnCart_NasrCity() {
    List<dynamic> datalist = [];
    for (int i = 0; i < CartItemsNasrCity.length; i++) {
      datalist.add({
        'ProductName':CartItemsNasrCity[i][0]['productname'],
        'Quantity':CartItemsNasrCity[i][1],
      });
    }
    return datalist;
  }
  List<dynamic> loopOnCart_ZayedCity() {
    List<dynamic> datalist = [];
    for (int i = 0; i < CartItemsZayedCity.length; i++) {
      datalist.add({
        'ProductName':CartItemsZayedCity[i][0]['productname'],
        'Quantity':CartItemsZayedCity[i][1],
      });
    }
    return datalist;
  }
  List<dynamic> loopOnCart_Giza() {
    List<dynamic> datalist = [];
    for (int i = 0; i < CartItemsGiza.length; i++) {
      datalist.add({
        'ProductName':CartItemsGiza[i][0]['productname'],
        'Quantity':CartItemsGiza[i][1],
      });
    }
    return datalist;
  }





  // Functions To Add Item From Cart Depend on Branch
  void addItemToCart_Faisal(QueryDocumentSnapshot product, int quantity,int points,bouns) {
    bool productExists = false;
    for (var cartItem in CartItemsFaisal) {
      if (cartItem[0].get('docId') == product.get('docId')) {
        // Product already exists in the cart, update the quantity
        cartItem[1] = quantity;
        cartItem[2]=points;
        cartItem[3]=bouns;
        productExists = true;
        //newExistPoints=rewardPoints;
        update();
        //print('newExistPoints : ${newExistPoints}');
        break;
      }
    }

    if (!productExists) {
      CartItemsFaisal.add([product, quantity,points,bouns]);
      //newNotExistPoints+=rewardPoints;
      update();

      // print('newNotExistPoints : ${newNotExistPoints}');
      // IncrementPoints(quantity);
    }
    // TotalRewardPoints=newExistPoints+newNotExistPoints;
    // update();
    // print('TotaaaaaaaaaaaaaaalPoints : ${TotalRewardPoints}');
  }
  void addItemToCart_Haram(QueryDocumentSnapshot product, int quantity,int points,bouns) {
    bool productExists = false;
    for (var cartItem in CartItemsHaram) {
      if (cartItem[0].get('docId') == product.get('docId')) {
        // Product already exists in the cart, update the quantity
        cartItem[1] = quantity;
        cartItem[2]=points;
        cartItem[3]=bouns;
        productExists = true;
        //newExistPoints=rewardPoints;
        update();
        //print('newExistPoints : ${newExistPoints}');
        break;
      }
    }

    if (!productExists) {
      CartItemsHaram.add([product, quantity,points,bouns]);
      //newNotExistPoints+=rewardPoints;
      update();

      // print('newNotExistPoints : ${newNotExistPoints}');
      // IncrementPoints(quantity);
    }
    // TotalRewardPoints=newExistPoints+newNotExistPoints;
    // update();
    // print('TotaaaaaaaaaaaaaaalPoints : ${TotalRewardPoints}');
  }
  void addItemToCart_October(QueryDocumentSnapshot product, int quantity,int points,bouns) {
    bool productExists = false;
    for (var cartItem in CartItemsOctober) {
      if (cartItem[0].get('docId') == product.get('docId')) {
        // Product already exists in the cart, update the quantity
        cartItem[1] = quantity;
        cartItem[2]=points;
        cartItem[3]=bouns;
        productExists = true;
        //newExistPoints=rewardPoints;
        update();
        //print('newExistPoints : ${newExistPoints}');
        break;
      }
    }

    if (!productExists) {
      CartItemsOctober.add([product, quantity,points,bouns]);
      //newNotExistPoints+=rewardPoints;
      update();

      // print('newNotExistPoints : ${newNotExistPoints}');
      // IncrementPoints(quantity);
    }
    // TotalRewardPoints=newExistPoints+newNotExistPoints;
    // update();
    // print('TotaaaaaaaaaaaaaaalPoints : ${TotalRewardPoints}');
  }
  void addItemToCart_NasrCity(QueryDocumentSnapshot product, int quantity,int points,bouns) {
    bool productExists = false;
    for (var cartItem in CartItemsNasrCity) {
      if (cartItem[0].get('docId') == product.get('docId')) {
        // Product already exists in the cart, update the quantity
        cartItem[1] = quantity;
        cartItem[2]=points;
        cartItem[3]=bouns;
        productExists = true;
        //newExistPoints=rewardPoints;
        update();
        //print('newExistPoints : ${newExistPoints}');
        break;
      }
    }

    if (!productExists) {
      CartItemsNasrCity.add([product, quantity,points,bouns]);
      //newNotExistPoints+=rewardPoints;
      update();

      // print('newNotExistPoints : ${newNotExistPoints}');
      // IncrementPoints(quantity);
    }
    // TotalRewardPoints=newExistPoints+newNotExistPoints;
    // update();
    // print('TotaaaaaaaaaaaaaaalPoints : ${TotalRewardPoints}');
  }
  void addItemToCart_ZayedCity(QueryDocumentSnapshot product, int quantity,int points,bouns) {
    bool productExists = false;
    for (var cartItem in CartItemsZayedCity) {
      if (cartItem[0].get('docId') == product.get('docId')) {
        // Product already exists in the cart, update the quantity
        cartItem[1] = quantity;
        cartItem[2]=points;
        cartItem[3]=bouns;
        productExists = true;
        //newExistPoints=rewardPoints;
        update();
        //print('newExistPoints : ${newExistPoints}');
        break;
      }
    }

    if (!productExists) {
      CartItemsZayedCity.add([product, quantity,points,bouns]);
      //newNotExistPoints+=rewardPoints;
      update();

      // print('newNotExistPoints : ${newNotExistPoints}');
      // IncrementPoints(quantity);
    }
    // TotalRewardPoints=newExistPoints+newNotExistPoints;
    // update();
    // print('TotaaaaaaaaaaaaaaalPoints : ${TotalRewardPoints}');
  }
  void addItemToCart_Giza(QueryDocumentSnapshot product, int quantity,int points,bouns) {
    bool productExists = false;
    for (var cartItem in CartItemsGiza) {
      if (cartItem[0].get('docId') == product.get('docId')) {
        // Product already exists in the cart, update the quantity
        cartItem[1] = quantity;
        cartItem[2]=points;
        cartItem[3]=bouns;
        productExists = true;
        //newExistPoints=rewardPoints;
        update();
        //print('newExistPoints : ${newExistPoints}');
        break;
      }
    }

    if (!productExists) {
      CartItemsGiza.add([product, quantity,points,bouns]);
      //newNotExistPoints+=rewardPoints;
      update();

      // print('newNotExistPoints : ${newNotExistPoints}');
      // IncrementPoints(quantity);
    }
    // TotalRewardPoints=newExistPoints+newNotExistPoints;
    // update();
    // print('TotaaaaaaaaaaaaaaalPoints : ${TotalRewardPoints}');
  }



  // Functions To remove Item From Cart Depend on Branch
  void removeItemAtIndex_Faisal(int index,dynamic obj) {
    CartItemsFaisal.removeAt(index);
    update();
    TotalPriceLE-=(double.parse(obj[0]['price'])*obj[1]);
    TotalRewardPoints-=((obj[3] as int )* (obj [1] as int ));
    PtsTotalPrice-=((obj[0]['pts']as int) * (obj[1]as int));



    update();
    print('Total LE :${TotalPriceLE}');
    print('Total reward: ${TotalRewardPoints}');
    print('Total Pts :${PtsTotalPrice}');
    print('CartItemsFaisal : ${CartItemsFaisal}');
  }
  void removeItemAtIndex_Haram(int index,dynamic obj)  {
    CartItemsHaram.removeAt(index);
    update();
    TotalPriceLE-=(double.parse(obj[0]['price'])*obj[1]);
    TotalRewardPoints-=((obj[3] as int )* (obj [1] as int ));
    PtsTotalPrice-=((obj[0]['pts']as int) * (obj[1]as int));



    update();
    print('Total LE :${TotalPriceLE}');
    print('Total reward: ${TotalRewardPoints}');
    print('Total Pts :${PtsTotalPrice}');
    print('CartItemsHaram : ${CartItemsHaram}');
  }
  void removeItemAtIndex_October(int index,dynamic obj) {
    CartItemsOctober.removeAt(index);
    update();
    TotalPriceLE-=(double.parse(obj[0]['price'])*obj[1]);
    TotalRewardPoints-=((obj[3] as int )* (obj [1] as int ));
    PtsTotalPrice-=((obj[0]['pts']as int) * (obj[1]as int));



    update();
    print('Total LE :${TotalPriceLE}');
    print('Total reward: ${TotalRewardPoints}');
    print('Total Pts :${PtsTotalPrice}');
    print('CartItemsOctober : ${CartItemsOctober}');
  }
  void removeItemAtIndex_NasrCity(int index,dynamic obj) {
    CartItemsNasrCity.removeAt(index);
    update();
    TotalPriceLE-=(double.parse(obj[0]['price'])*obj[1]);
    TotalRewardPoints-=((obj[3] as int )* (obj [1] as int ));
    PtsTotalPrice-=((obj[0]['pts']as int) * (obj[1]as int));



    update();
    print('Total LE :${TotalPriceLE}');
    print('Total reward: ${TotalRewardPoints}');
    print('Total Pts :${PtsTotalPrice}');
    print('CartItemsNasrCity : ${CartItemsNasrCity}');
  }
  void removeItemAtIndex_ZayedCity(int index,dynamic obj) {
    CartItemsZayedCity.removeAt(index);
    update();
    TotalPriceLE-=(double.parse(obj[0]['price'])*obj[1]);
    TotalRewardPoints-=((obj[3] as int )* (obj [1] as int ));
    PtsTotalPrice-=((obj[0]['pts']as int) * (obj[1]as int));



    update();
    print('Total LE :${TotalPriceLE}');
    print('Total reward: ${TotalRewardPoints}');
    print('Total Pts :${PtsTotalPrice}');
    print('CartItemsZayedCity : ${CartItemsZayedCity}');
  }
  void removeItemAtIndex_Giza(int index,dynamic obj) {
    CartItemsGiza.removeAt(index);
    update();
    TotalPriceLE-=(double.parse(obj[0]['price'])*obj[1]);
    TotalRewardPoints-=((obj[3] as int )* (obj [1] as int ));
    PtsTotalPrice-=((obj[0]['pts']as int) * (obj[1]as int));



    update();
    print('Total LE :${TotalPriceLE}');
    print('Total reward: ${TotalRewardPoints}');
    print('Total Pts :${PtsTotalPrice}');
    print('CartItemsGiza : ${CartItemsGiza}');
  }







// Future<void> updateUserPoints()async{
// SharedPreferences prefs=await SharedPreferences.getInstance();
//   String? docId=prefs.get('uid') as String?;
//   int? userpoints=prefs.getInt('points') ;
//   print('in contro${docId}');
//    //newCurrentPoints=(userpoints!-PtsTotalPrice);
//    update();
//    print('newpoints${newCurrentPoints}');
//   // FirebaseFirestore.instance.collection('users').doc(docId).update({
//   //   'points':newCurrentPoinst
//   // });
// }
// Future<void> updatePointsCash()async{
// SharedPreferences prefs=await SharedPreferences.getInstance();
//   String? docId=prefs.get('uid') as String?;
//   print('in contro${docId}');
//
//   // FirebaseFirestore.instance.collection('users').doc(docId).update({
//   //   'points':currentPoints
//   // });
// }



// int getItemQuantity(String itemId, int branchId) {
//   int quantity = 0;
//   if (branchIdHosary == branchId) {
//     // If the item is in the Hosary branch cart, get its quantity
//     quantity = CartItemsHosary.where((item) => item.get('docId') == itemId).length;
//   } else {
//     // If the item is in the Mohandseen branch cart, get its quantity
//     quantity = CartItemsMohandseen.where((item) => item.get('docId') == itemId).length;
//   }
//   return quantity;
// }


// void removeItemFromCartMohandseen(index) {
//   CartItemsMohandseen
//       .removeWhere((element) => element.get('docId') == index);
//   update();
// }

// Function to delete an item from the cart based on branch ID
// void validatorDeleteItem(index, idb) {
//   if (branchIdHosary == idb) {
//     removeItemFromCartHos(index);
//     update();
//   } else {
//     removeItemFromCartMohandseen(index);
//     update();
//   }
// }

// Hosary branch Function to remove a product from the cart
// void removeItemFromCartHos(index) {
//   CartItemsHosary.removeWhere((element) => element.get('docId') == index);
//   update();
// }

// Mohandseen branch Function to add a product to the cart
// void addItemToCartMohandseen(product, {Quant}) {
//   // bool productExists =
//   // CartItemsMohandseen.any((item) => item.id == product.id);
//   CartItemsMohandseen.add([product, Quant]);
//   update();
//   // if (!productExists) {
//   //
//   //   CartItemsMohandseen.add([product, Quant]);
//   //  // CartItemsMohandseen.add(product);
//   //   update();
//   // } else {
//   // Product already exists in the cart. You can update the quantity or show a message.
//   // For example:
//   // showErrorMessage('Product already in cart.');
//   // }
// }
// Function to send data to Firestore for Mohandseen branch
// Future<void> sendDatatoFireMohandseen(idb,String paymentStatue) async {
//   final now =  DateTime.now();
//   SharedPreferences prefs=await SharedPreferences.getInstance();
//   datacolMohandseen.set({
//     'order': {
//       'Totalprice': totalMohandseen.toString(),
//       'orderlist': loopOnCartMohandseen(),
//       'Address':AddressMohandseen.toString(),
//       'Phone':PhoneMohandseen.toString(),
//       'Name':NameMohandseen.toString(),
//       'Time' :DateFormat.jm().format(now).toString(),
//       'Payment' :paymentStatue,
//       'OrderId':datacolMohandseen.id,
//       'UserID' :prefs.get('uid'),
//       'RewardPoints':TotalRewardPoints,
//       'UserPoints' : prefs.get('points'),
//       //'TotalAfterReward':currentPoints,
//      'PtsTotalPrice':PtsTotalPrice,
//
//
//
//
//     },
//     'color':'White'
//   });
// }
// Hosary branch Function to add a product to the cart
// IncrementPoints(int Quantity)async{
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   int? getpoints=prefs.getInt('points');
//
//   currentPoints=getpoints! +( 1* Quantity);
//   rewardPoints=(1*Quantity);
//   //TotalRewardPoints+=rewardPoints;
//   PtsTotalPrice=(15 *Quantity);
//   // prefs.setInt('points', currentPoints);
//
//   update();
//   print('Current Points ${currentPoints}');
//   print('Current price Points ${PtsTotalPrice}');
//   print('RewardPoints : ${rewardPoints}');
//
// }
// DecrementPoinst( )async{
//   //CartItemsHosary.removeAt(index);
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   int? getpoints=prefs.getInt('points');
//
//   currentPoints=getpoints! - 1  ;
//   Pts-=15;
//   prefs.setInt('points', currentPoints);
//
//
//   update();
//   print('Current Points ${currentPoints}');
//   print('Current price Points ${Pts}');
//
// }
// DecrementPoinst( int obj)async{
//  // CartItemsHosary.removeAt(index);
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   int? getpoints=prefs.getInt('points');
//
//  //currentPoints=getpoints! -( 1 * obj) ;
//   rewardPoints=(1*obj);
//   PtsTotalPrice=(15*obj);
//   // prefs.setInt('points', currentPoints);
//
//
//   update();
//
//   print('Current Points ${currentPoints}');
//   print('Current price Points ${PtsTotalPrice}');
//   print('RewardPoints : ${rewardPoints}');
//
// }
// DecrementPoinstFromCart( int pointQuantity)async{
//  // CartItemsHosary.removeAt(index);
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   int? getpoints=prefs.getInt('points');
//
//  //currentPoints=getpoints! -( 1 * obj) ;
//   rewardPoints=(1*pointQuantity);
//   PtsTotalPrice=(15*pointQuantity);
//   // prefs.setInt('points', currentPoints);
//
//
//   update();
//
//   print('Current Points ${currentPoints}');
//   print('Current price Points ${PtsTotalPrice}');
//   print('RewardPoints : ${rewardPoints}');
//
// }


// Future<int> Funcy()async{
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   int? getpoints=prefs.getInt('points');
//   var mypoints=getpoints! + 1;
//   print('my points${mypoints}');
//
//   return mypoints;
//
// }




// Cart Items Lists
// List<QueryDocumentSnapshot> cartItemsHosary = [];
// List<QueryDocumentSnapshot> cartItemsMohandseen = [];
//Map<String, dynamic> data = {};

// CartItems Lists






// Function to add a product to the cart based on branch ID







}



