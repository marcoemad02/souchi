import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class ProductController extends GetxController{
  // branchesId
  int branchIdHosary=1;
  int branchIdMohandseen=1;


  //branches Firebase Collerction
  CollectionReference datacolHosary=FirebaseFirestore.instance.collection('HosaryBranchOrders');
  CollectionReference datacolMohandseen=FirebaseFirestore.instance.collection('MohandseenBranchOrders');


  // branches CartItems List
  List<QueryDocumentSnapshot> cartItemsHosary=[];
  List<QueryDocumentSnapshot> cartItemsMohandseen=[];


  // branches Send data Functions
  Future<void> sendDatatoFireHosary() async{

    for(int i=0;i<cartItemsHosary.length;i++){
      datacolHosary.add({
        'datamap':{

          'price':cartItemsHosary[i]['price'],

          'productname':cartItemsHosary[i]['productname']}
      });
    }

  }
  Future<void> sendDatatoFireMohandseen() async{

    for(int i=0;i<cartItemsMohandseen.length;i++){
      datacolMohandseen.add({
        'datamap':{

          'price':cartItemsMohandseen[i]['price'],

          'productname':cartItemsMohandseen[i]['productname']}
      });
    }

  }


  // Hosary branch Functions (add and remove)
  void addItemToCartHos(product){
    cartItemsHosary.add(product);
    update();

  }
  void removeItemFromCartHos( index){
    cartItemsHosary.remove(index);
    update();
  }

// Mohandseen branch Functions (add and remove)
  void addItemToCartMohandseen(index){
    cartItemsMohandseen.add(index);
    update();

  }
  void removeItemFromCartMohandseen( index){
    cartItemsMohandseen.remove(index);
    update();
  }




  // Validator Branch productObject
  validatorBranch(productObject,idbranch){
    if(branchIdHosary==idbranch){
      print('here Hosary');
      addItemToCartHos(productObject);
      print('HosaryList${cartItemsHosary}');
      print('MohandList${cartItemsMohandseen}');

    }else{
      print('here Mohandseen');
      addItemToCartMohandseen(productObject);
      print('HosaryList${cartItemsHosary}');
      print('MohandList${cartItemsMohandseen}');
    }
  }



  // Validator branch to send data to FireBase
  validatorCart(int id){
    if(branchIdHosary==id){

      sendDatatoFireHosary();
    }else {
      sendDatatoFireMohandseen();
    }
  }
  //Validator To clear  DataList  Branch
  validatorclear(idbranch){
    if (branchIdHosary == idbranch) {
      cartItemsHosary.clear();
      update();

      print('cartItemshosaryCleared');
      print('HosaryList${cartItemsHosary}');
      print('MohandList${cartItemsMohandseen}');

    }
    if(branchIdMohandseen==idbranch){
      cartItemsMohandseen.clear();
      update();
      print('cartItemsMohandseenCleared');
      print('HosaryList${cartItemsHosary}');
      print('MohandList${cartItemsMohandseen}');

    }

  }

  // calculateTotalPrice Function

}