import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  // Branch IDs
  int branchIdHosary = 1;
  int branchIdMohandseen = 2;
  double totalHosary=0;
  double totalMohandseen=0;

  // Firestore Collections
  CollectionReference datacolHosary =
  FirebaseFirestore.instance.collection('HosaryOrders');
  CollectionReference datacolMohandseen =
  FirebaseFirestore.instance.collection('MohandseenOrders');

  // Cart Items Lists
  List<QueryDocumentSnapshot> cartItemsHosary = [];
  List<QueryDocumentSnapshot> cartItemsMohandseen = [];
  Map<String, dynamic> data = {};
  List<dynamic> data55 = [];

  // Function to send data to Firestore for Hosary branch
  Future<void> sendDatatoFireHosary(idb) async {
    datacolHosary.add({
      'order': {
         'totalprice': totalHosary.toString(),
        'orderlist': loopOnCartHosary(),
      }
    });
  }

  // Function to send data to Firestore for Mohandseen branch
  Future<void> sendDatatoFireMohandseen(idb) async {
    datacolMohandseen.add({
      'order': {
        'totalprice': totalMohandseen.toString(),
        'orderlist': loopOnCartMohandseen(),
      }
    });
  }

  // Hosary branch Function to add a product to the cart
  void addItemToCartHos(product, Quant) {
    bool productExists =
    cartItemsHosary.any((item) => item.id == product.id);

    if (!productExists) {
      data55.add([product, Quant]);
      // data.addAll({
      //   'product': product,
      //   'Quant': Quant,
      // });
      cartItemsHosary.add(product);
      update();
    } else {
      // Product already exists in the cart. You can update the quantity or show a message.
      // For example:
      // showErrorMessage('Product already in cart.');
    }
  }

  // Hosary branch Function to remove a product from the cart
  void removeItemFromCartHos(index) {
    cartItemsHosary.removeWhere((element) => element.get('docId') == index);
    update();
  }

  // Mohandseen branch Function to add a product to the cart
  void addItemToCartMohandseen(product, {Quant}) {
    bool productExists =
    cartItemsMohandseen.any((item) => item.id == product.id);

    if (!productExists) {

      data55.add([product, Quant]);
      cartItemsMohandseen.add(product);
      update();
    } else {
      // Product already exists in the cart. You can update the quantity or show a message.
      // For example:
      // showErrorMessage('Product already in cart.');
    }
  }

  // Mohandseen branch Function to remove a product from the cart
  void removeItemFromCartMohandseen(index) {
    cartItemsMohandseen
        .removeWhere((element) => element.get('docId') == index);
    update();
  }

  // Function to delete an item from the cart based on branch ID
  void validatorDeleteItem(index, idb) {
    if (branchIdHosary == idb) {
      removeItemFromCartHos(index);
      update();
    } else {
      removeItemFromCartMohandseen(index);
      update();
    }
  }

  // Function to add a product to the cart based on branch ID
  void validatorBranch(productObject, idbranch, Quant) {
    if (branchIdHosary == idbranch) {
      print('here Hosary');
      print('Here contrp${Quant}');
      addItemToCartHos(productObject, Quant);
      print('HosaryList${cartItemsHosary}');
      print('MohandList${cartItemsMohandseen}');
    } else {
      print('here Mohandseen');
      print('Here contrp${Quant}');

      addItemToCartMohandseen(productObject, Quant: Quant);
      print('HosaryList${cartItemsHosary}');
      print('MohandList${cartItemsMohandseen}');
    }
  }

  // Function to send cart data to Firestore based on branch ID
  Future<void> validatorCart(int id) async {
    if (branchIdHosary == id) {
      await sendDatatoFireHosary(id);
    } else {
      await sendDatatoFireMohandseen(id);
    }
  }

  // Function to clear cart data based on branch ID
  void validatorClear(idbranch) {
    if (branchIdHosary == idbranch) {
      cartItemsHosary.clear();
      data55.clear();
      update();
      print('cartItemshosaryCleared');
      print('HosaryList${cartItemsHosary}');
      print('MohandList${cartItemsMohandseen}');
    }
    if (branchIdMohandseen == idbranch) {
      cartItemsMohandseen.clear();
      update();
      print('cartItemsMohandseenCleared');
      print('HosaryList${cartItemsHosary}');
      print('MohandList${cartItemsMohandseen}');
    }
  }

  // Function to calculate total price based on branch ID
  void calculationTotalValidator(idb) {
    String totalprice;
    if (branchIdHosary == idb) {
      totalHosary = calculateTotalHosaryBranch();
    } else {
      totalprice = calculateTotalMohandseenBranch();
    }
    // return totalprice;
  }

  // Function to calculate total price for Hosary branch
 double calculateTotalHosaryBranch() {
    double totalPrice = 0;
    for (int i = 0; i < data55.length; i++) {
      totalPrice += (double.parse(data55[i][0]['price']) * data55[i][1]);
    }
    return totalPrice;
  }

  // Function to calculate total price for Mohandseen branch
  String calculateTotalMohandseenBranch() {
    double totalPrice = 0;
    for (int i = 0; i < cartItemsMohandseen.length; i++) {
      totalPrice += double.parse(cartItemsMohandseen[i].get('price'));
    }
    return totalPrice.toStringAsFixed(2);
  }

  // Function to loop through the cart items and get product names for Hosary branch
  List<dynamic> loopOnCartHosary() {
    List<dynamic> datalist = [];
    for (int i = 0; i < data55.length; i++) {
      datalist.add({
        'ProductName':data55[i][0]['productname'],
        'Quantity':data55[i][1],
      });
    }
    return datalist;
  }

  // Function to loop through the cart items and get product names for Mohandseen branch
  List<dynamic> loopOnCartMohandseen() {
    List<dynamic> datalist = [];
    for (int i = 0; i < cartItemsMohandseen.length; i++) {
      datalist.add(cartItemsMohandseen[i]['productname']);
    }
    return datalist;
  }

  int getItemQuantity(String itemId, int branchId) {
    int quantity = 0;
    if (branchIdHosary == branchId) {
      // If the item is in the Hosary branch cart, get its quantity
      quantity = cartItemsHosary.where((item) => item.get('docId') == itemId).length;
    } else {
      // If the item is in the Mohandseen branch cart, get its quantity
      quantity = cartItemsMohandseen.where((item) => item.get('docId') == itemId).length;
    }
    return quantity;
  }

  void removeItemAtIndex55(int index,dynamic obj) {
    data55.removeAt(index);
    update();
    totalHosary-=(double.parse(obj[0]['price'])*obj[1]);

    update();
    print('mas7 : ${totalHosary}');
    print('remove : ${data55}');
  }

  void removeItemAtIndexMohandseen(int index) {}



  // void TestCalc(){
  //   for (int i = 0; i < data55.length; i++) {
  //     totalHosary += (double.parse(data55[i][0]['price']) * data55[i][1]);
  //     update();
  //     print(" Total Hosary ${totalHosary}");
  //   }
  //   update();
  //
  //
  // }
}
