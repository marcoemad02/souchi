import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souchi/const.dart';
import 'package:souchi/core/view_model/product_Controller.dart';

import 'cart_item_widget.dart';

class Body extends StatelessWidget {
  final int branchID;

  const Body({Key? key, required this.branchID}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: buildPadding(branchID));
  }

  Widget buildPadding(branchId) {
    if (branchId == 1) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          child: GetBuilder<ProductController>(
            init: ProductController(),
            builder: (controller) => ListView.builder(
              itemCount: controller.CartItemsFaisal.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: UniqueKey(),
                  //Key(controller.CartItemsHosary[index][0].id),
                  onDismissed: (direction) {
                    controller.removeItemAtIndex_Faisal(
                        index, controller.CartItemsFaisal[index]);
                  },
                  background: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFE6E6),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        const Spacer(),
                        const Icon(Icons.delete),
                      ],
                    ),
                  ),
                  child: CartItemWidget(
                    Quantity: controller.CartItemsFaisal[index][1],
                    cartObj: controller.CartItemsFaisal[index][0],
                    branchID: branchID,
                  ),
                );
              },
            ),
          ),
        ),
      );
    }
    if (branchId == 2) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          child: GetBuilder<ProductController>(
            init: ProductController(),
            builder: (controller) => ListView.builder(
              itemCount: controller.CartItemsHaram.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: Key(controller.CartItemsHaram[index][0].id),
                  onDismissed: (direction) {
                    controller.removeItemAtIndex_Haram(
                        index, controller.CartItemsHaram[index]);
                  },
                  background: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFE6E6),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Row(
                      children: [
                        Spacer(),
                        Icon(Icons.delete),
                      ],
                    ),
                  ),
                  child: CartItemWidget(
                    Quantity: controller.CartItemsHaram[index][1],
                    cartObj: controller.CartItemsHaram[index][0],
                    branchID: branchID,
                  ),
                );
              },
            ),
          ),
        ),
      );
    }
    if (branchId == 3) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          child: GetBuilder<ProductController>(
            init: ProductController(),
            builder: (controller) => ListView.builder(
              itemCount: controller.CartItemsOctober.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: Key(controller.CartItemsOctober[index][0].id),
                  onDismissed: (direction) {
                    controller.removeItemAtIndex_October(
                        index, controller.CartItemsOctober[index]);
                  },
                  background: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFE6E6),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Row(
                      children: [
                        Spacer(),
                        Icon(Icons.delete),
                      ],
                    ),
                  ),
                  child: CartItemWidget(
                    Quantity: controller.CartItemsOctober[index][1],
                    cartObj: controller.CartItemsOctober[index][0],
                    branchID: branchID,
                  ),
                );
              },
            ),
          ),
        ),
      );
    }
    if (branchId == 4) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          child: GetBuilder<ProductController>(
            init: ProductController(),
            builder: (controller) => ListView.builder(
              itemCount: controller.CartItemsNasrCity.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: Key(controller.CartItemsNasrCity[index][0].id),
                  onDismissed: (direction) {
                    controller.removeItemAtIndex_NasrCity(
                        index, controller.CartItemsNasrCity[index]);
                  },
                  background: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFE6E6),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Row(
                      children: [
                        Spacer(),
                        Icon(Icons.delete),
                      ],
                    ),
                  ),
                  child: CartItemWidget(
                    Quantity: controller.CartItemsNasrCity[index][1],
                    cartObj: controller.CartItemsNasrCity[index][0],
                    branchID: branchID,
                  ),
                );
              },
            ),
          ),
        ),
      );
    }
    if (branchId == 5) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          child: GetBuilder<ProductController>(
            init: ProductController(),
            builder: (controller) => ListView.builder(
              itemCount: controller.CartItemsZayedCity.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: Key(controller.CartItemsZayedCity[index][0].id),
                  onDismissed: (direction) {
                    controller.removeItemAtIndex_ZayedCity(
                        index, controller.CartItemsZayedCity[index]);
                  },
                  background: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFE6E6),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Row(
                      children: [
                        Spacer(),
                        Icon(Icons.delete),
                      ],
                    ),
                  ),
                  child: CartItemWidget(
                    Quantity: controller.CartItemsZayedCity[index][1],
                    cartObj: controller.CartItemsZayedCity[index][0],
                    branchID: branchID,
                  ),
                );
              },
            ),
          ),
        ),
      );
    }
    if (branchId == 6) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          child: GetBuilder<ProductController>(
            init: ProductController(),
            builder: (controller) => ListView.builder(
              itemCount: controller.CartItemsGiza.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: Key(controller.CartItemsGiza[index][0].id),
                  onDismissed: (direction) {
                    controller.removeItemAtIndex_Giza(
                        index, controller.CartItemsGiza[index]);
                  },
                  background: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFE6E6),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Row(
                      children: [
                        Spacer(),
                        Icon(Icons.delete),
                      ],
                    ),
                  ),
                  child: CartItemWidget(
                    Quantity: controller.CartItemsGiza[index][1],
                    cartObj: controller.CartItemsGiza[index][0],
                    branchID: branchID,
                  ),
                );
              },
            ),
          ),
        ),
      );
    }
    if (branchId == 7) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Container(
          child: GetBuilder<ProductController>(
            init: ProductController(),
            builder: (controller) => ListView.builder(
              itemCount: controller.CartItemsShoubra.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: Key(controller.CartItemsShoubra[index][0].id),
                  onDismissed: (direction) {
                    controller.removeItemAtIndex_Shoubra(
                        index, controller.CartItemsShoubra[index]

                    );
                  },
                  background: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFE6E6),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Row(
                      children: [
                        Spacer(),
                        Icon(Icons.delete),
                      ],
                    ),
                  ),
                  child: CartItemWidget(
                    Quantity: controller.CartItemsShoubra[index][1],
                    cartObj: controller.CartItemsShoubra[index][0],
                    branchID: branchID,
                  ),
                );
              },
            ),
          ),
        ),
      );
    }

    /// we want to modify It
    return const Center(child: Text('Erorr'));
  }
}

