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
  Future<void> sendDatatoFireHosary(idb) async{

    datacolHosary.add({
      'order':{

        // 'price':cartItemsHosary[i]['price'],
        'totalprice' :calculationTotalValidator(idb),
        'orderlist':loopOnCartHosary(),

      }
    });

  }
  Future<void> sendDatatoFireMohandseen(idb) async{

    datacolMohandseen.add({
      'order':{

        // 'price':cartItemsHosary[i]['price'],
        'totalprice' :calculationTotalValidator(idb),
        'orderlist':loopOnCartMohandseen(),

      }

    });

  }



  // Hosary branch Functions (add and remove)
  void addItemToCartHos(product){
    cartItemsHosary.add(product);
    update();

  }
  void removeItemFromCartHos(  index){

    cartItemsHosary.removeWhere((element) => (element.get('docId')==index));
    //GetSnackBar(title: 'ITEM ${index.get('productname')} Removed',);


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



  ValidatorDeleteItem(index,idb){
    if(branchIdHosary==idb){
      removeItemFromCartHos(index);
      update();
    }
    else{
      removeItemFromCartMohandseen(index);
      update();
    }
  }


  // Validator Branch productObject
  validatorBranch(productObject, idbranch){
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

      sendDatatoFireHosary(id);
    }else {
      sendDatatoFireMohandseen(id);
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

  // calculateTotalPrice Function Validator
  String calculationTotalValidator(idb){
    String totalprice;
    if(branchIdHosary==idb){
      totalprice=calculateTotalHosaryBranch();


    } else{
      totalprice=calculateTotalMohandseenBranch();
    }
    return totalprice;

  }


  // // calculateTotalPrice Function Branches
  String calculateTotalHosaryBranch(){
    double totalPrice=0;
    for( int i=0;i<cartItemsHosary.length; i++){
      totalPrice+=double.parse(cartItemsHosary[i].get('price'));

    }
    return totalPrice.toStringAsFixed(2);
  }
  String calculateTotalMohandseenBranch(){
    double totalPrice=0;
    for( int i=0;i<cartItemsMohandseen.length; i++){
      totalPrice+=double.parse(cartItemsMohandseen[i].get('price'));
    }
    return totalPrice.toStringAsFixed(2);
  }
  // loopOnCart Function
  List<dynamic> loopOnCartHosary(){
       List<dynamic> datalist=[];
    for(int i=0;i<cartItemsHosary.length;i++)
      {
        datalist.add(cartItemsHosary[i]['productname']);
      }

    return datalist;
    }
  List<dynamic> loopOnCartMohandseen(){
       List<dynamic> datalist=[];
    for(int i=0;i<cartItemsMohandseen.length;i++)
      {
        datalist.add(cartItemsMohandseen[i]['productname']);
      }

    return datalist;
    }

}