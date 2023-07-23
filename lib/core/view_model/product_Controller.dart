import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  // Branch IDs
  int branchIdHosary = 1;
  int branchIdMohandseen = 1;

  // Firestore Collections
  CollectionReference datacolHosary =
  FirebaseFirestore.instance.collection('HosaryBranchOrders');
  CollectionReference datacolMohandseen =
  FirebaseFirestore.instance.collection('MohandseenBranchOrders');

  // Cart Items Lists
  List<QueryDocumentSnapshot> cartItemsHosary = [];
  List<QueryDocumentSnapshot> cartItemsMohandseen = [];

  // Function to send data to Firestore for Hosary branch
  Future<void> sendDatatoFireHosary(idb) async {
    datacolHosary.add({
      'order': {
        'totalprice': calculationTotalValidator(idb),
        'orderlist': loopOnCartHosary(),
      }
    });
  }

  // Function to send data to Firestore for Mohandseen branch
  Future<void> sendDatatoFireMohandseen(idb) async {
    datacolMohandseen.add({
      'order': {
        'totalprice': calculationTotalValidator(idb),
        'orderlist': loopOnCartMohandseen(),
      }
    });
  }

  // Hosary branch Function to add a product to the cart
  void addItemToCartHos(product) {
    bool productExists = cartItemsHosary.any((item) => item.id == product.id);

    if (!productExists) {
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
  void addItemToCartMohandseen(product) {
    bool productExists = cartItemsMohandseen.any((item) => item.id == product.id);

    if (!productExists) {
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
    cartItemsMohandseen.removeWhere((element) => element.get('docId') == index);
    update();
  }

  // Function to delete an item from the cart based on branch ID
  ValidatorDeleteItem(index, idb) {
    if (branchIdHosary == idb) {
      removeItemFromCartHos(index);
      update();
    } else {
      removeItemFromCartMohandseen(index);
      update();
    }
  }

  // Function to add a product to the cart based on branch ID
  validatorBranch(productObject, idbranch) {
    if (branchIdHosary == idbranch) {
      print('here Hosary');
      addItemToCartHos(productObject);
      print('HosaryList${cartItemsHosary}');
      print('MohandList${cartItemsMohandseen}');
    } else {
      print('here Mohandseen');
      addItemToCartMohandseen(productObject);
      print('HosaryList${cartItemsHosary}');
      print('MohandList${cartItemsMohandseen}');
    }
  }

  // Function to send cart data to Firestore based on branch ID
  validatorCart(int id) {
    if (branchIdHosary == id) {
      sendDatatoFireHosary(id);
    } else {
      sendDatatoFireMohandseen(id);
    }
  }

  // Function to clear cart data based on branch ID
  validatorclear(idbranch) {
    if (branchIdHosary == idbranch) {
      cartItemsHosary.clear();
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
  String calculationTotalValidator(idb) {
    String totalprice;
    if (branchIdHosary == idb) {
      totalprice = calculateTotalHosaryBranch();
    } else {
      totalprice = calculateTotalMohandseenBranch();
    }
    return totalprice;
  }

  // Function to calculate total price for Hosary branch
  String calculateTotalHosaryBranch() {
    double totalPrice = 0;
    for (int i = 0; i < cartItemsHosary.length; i++) {
      totalPrice += double.parse(cartItemsHosary[i].get('price'));
    }
    return totalPrice.toStringAsFixed(2);
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
    for (int i = 0; i < cartItemsHosary.length; i++) {
      datalist.add(cartItemsHosary[i]['productname']);
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
      quantity = cartItemsHosary.where((item) => item.id == itemId).length;
    } else {
      // If the item is in the Mohandseen branch cart, get its quantity
      quantity = cartItemsMohandseen.where((item) => item.id == itemId).length;
    }
    return quantity;
  }


}





