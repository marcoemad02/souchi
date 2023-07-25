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
  // List<QueryDocumentSnapshot> cartItemsHosary = [];
  // List<QueryDocumentSnapshot> cartItemsMohandseen = [];
  //Map<String, dynamic> data = {};
  List<dynamic> CartItemsHosary = [];
  List<dynamic> CartItemsMohandseen = [];

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
  void addItemToCartHos(QueryDocumentSnapshot product, int quantity) {
    bool productExists = false;
    for (var cartItem in CartItemsHosary) {
      if (cartItem[0].get('docId') == product.get('docId')) {
        // Product already exists in the cart, update the quantity
        cartItem[1] = quantity;
        productExists = true;
        break;
      }
    }

    if (!productExists) {
      CartItemsHosary.add([product, quantity]);
    }

    update();
  }

  // Hosary branch Function to remove a product from the cart
  void removeItemFromCartHos(index) {
    CartItemsHosary.removeWhere((element) => element.get('docId') == index);
    update();
  }

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

  // Mohandseen branch Function to remove a product from the cart
  void addItemToCartMohandseen(QueryDocumentSnapshot product, int quantity) {
    bool productExists = false;
    for (var cartItem in CartItemsMohandseen) {
      if (cartItem[0].get('docId') == product.get('docId')) {
        // Product already exists in the cart, update the quantity
        cartItem[1] = quantity;
        productExists = true;
        break;
      }
    }

    if (!productExists) {
      CartItemsMohandseen.add([product, quantity]);
    }

    update();
  }
  void removeItemFromCartMohandseen(index) {
    CartItemsMohandseen
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
      print('HosaryList${CartItemsHosary}');
      print('MohandList${CartItemsMohandseen}');
    } else {
      print('here Mohandseen');
      print('Here contrp${Quant}');

      addItemToCartMohandseen(productObject,  Quant);
      print('HosaryList${CartItemsHosary}');
      print('MohandList${CartItemsMohandseen}');
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
      CartItemsHosary.clear();
      //data55.clear();
      update();
      print('cartItemshosaryCleared');
      print('HosaryList${CartItemsHosary}');
      print('MohandList${CartItemsMohandseen}');
    }
    if (branchIdMohandseen == idbranch) {
      CartItemsMohandseen.clear();
      update();
      print('cartItemsMohandseenCleared');
      print('HosaryList${CartItemsHosary}');
      print('MohandList${CartItemsMohandseen}');
    }
  }

  // Function to calculate total price based on branch ID
  void calculationTotalValidator(idb) {
    String totalprice;
    if (branchIdHosary == idb) {
      totalHosary = calculateTotalHosaryBranch();
    } else {
      totalMohandseen = calculateTotalMohandseenBranch();
    }
    // return totalprice;
  }

  // Function to calculate total price for Hosary branch
 double calculateTotalHosaryBranch() {
    double totalPrice = 0;
    for (int i = 0; i < CartItemsHosary.length; i++) {
      totalPrice += (double.parse(CartItemsHosary[i][0]['price']) * CartItemsHosary[i][1]);
    }
    return totalPrice;
  }

  // Function to calculate total price for Mohandseen branch
  double calculateTotalMohandseenBranch() {
    double totalPrice = 0;
    for (int i = 0; i < CartItemsMohandseen.length; i++) {
      totalPrice += (double.parse(CartItemsMohandseen[i][0]['price']) * CartItemsMohandseen[i][1]);
    }
    return totalPrice;
  }

  // Function to loop through the cart items and get product names for Hosary branch
  List<dynamic> loopOnCartHosary() {
    List<dynamic> datalist = [];
    for (int i = 0; i < CartItemsHosary.length; i++) {
      datalist.add({
        'ProductName':CartItemsHosary[i][0]['productname'],
        'Quantity':CartItemsHosary[i][1],
      });
    }
    return datalist;
  }

  // Function to loop through the cart items and get product names for Mohandseen branch
  List<dynamic> loopOnCartMohandseen() {
    List<dynamic> datalist = [];
    for (int i = 0; i < CartItemsMohandseen.length; i++) {
      datalist.add({
        'ProductName':CartItemsMohandseen[i][0]['productname'],
        'Quantity':CartItemsMohandseen[i][1],
      });
    }
    return datalist;
  }

  int getItemQuantity(String itemId, int branchId) {
    int quantity = 0;
    if (branchIdHosary == branchId) {
      // If the item is in the Hosary branch cart, get its quantity
      quantity = CartItemsHosary.where((item) => item.get('docId') == itemId).length;
    } else {
      // If the item is in the Mohandseen branch cart, get its quantity
      quantity = CartItemsMohandseen.where((item) => item.get('docId') == itemId).length;
    }
    return quantity;
  }

  void removeItemAtIndexHosary(int index,dynamic obj) {
    CartItemsHosary.removeAt(index);
    update();
    totalHosary-=(double.parse(obj[0]['price'])*obj[1]);

    update();
    print('mas7 : ${totalHosary}');
    print('remove : ${CartItemsHosary}');
  }
  void removeItemAtIndexMohandseen(int index,dynamic obj) {
    CartItemsMohandseen.removeAt(index);
    update();
    totalMohandseen-=(double.parse(obj[0]['price'])*obj[1]);

    update();
    print('mas7 : ${totalMohandseen}');
    print('remove : ${CartItemsMohandseen}');
  }





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
