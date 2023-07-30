import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:souchi/core/view_model/product_Controller.dart';
import 'package:souchi/views/pages/BranchPage/branch_view.dart';
import '../../const.dart';



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../const.dart';

class BottomSheetContent extends StatefulWidget {
  const BottomSheetContent({super.key, required this.branchId});

  @override
  _BottomSheetContentState createState() => _BottomSheetContentState();
  final branchId;
}

class _BottomSheetContentState extends State<BottomSheetContent> {
  TextEditingController _textField1Controller = TextEditingController();
  TextEditingController _textField2Controller = TextEditingController();
  TextEditingController _textField3Controller = TextEditingController();

  bool isNameValid = true;
  bool isPhoneValid = true;
  bool isAddressValid = true;
   var controller =Get.put(ProductController());

  String name='';
  String phone='';
  String address='';

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 800,
      padding:const  EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(50.0)),
        border: Border.all(
          color: Colors.grey, // Border color
          width: 1.0, // Border width
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _textField1Controller,
            onSubmitted: (inputValue) {
              setState(() {
                 name=inputValue;
                // Check if the name is not empty
                isNameValid = inputValue.trim().isNotEmpty;
              });
              print('Name : ${name}');
            },
            decoration: InputDecoration(
              focusedBorder:const  UnderlineInputBorder(
                borderSide: BorderSide(color: kPrimaryColor), // Orange border color
              ),
              labelStyle:const  TextStyle(color: kPrimaryColor), // Orange label text color
              errorText: isNameValid ? null : "Please enter your name",
              errorStyle: const TextStyle(color: kPrimaryColor),
              focusedErrorBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: kPrimaryColor),
              ),
              errorBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: kPrimaryColor),
              ),
              labelText: 'NAME',
            ),
          ),
          const SizedBox(height: 15),
          TextField(
            controller: _textField2Controller,
            onSubmitted: (inputValue) {
              setState(() {
                 phone=inputValue;
                // Check if the phone number is valid
                isPhoneValid = inputValue.length == 11 && int.tryParse(inputValue) != null;
              });
            print('Phone : ${phone}');
            },
            maxLength: 11,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: kPrimaryColor), // Orange border color
              ),
              labelStyle: const TextStyle(color: kPrimaryColor), // Orange label text color
              errorText: isPhoneValid ? null : "Please enter your phone number",
              errorStyle:const  TextStyle(color: kPrimaryColor),
              focusedErrorBorder: const UnderlineInputBorder(
                borderSide:  BorderSide(color: kPrimaryColor),
              ),
              errorBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: kPrimaryColor),
              ),
              labelText: 'PHONE',
            ),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: _textField3Controller,
            onSubmitted: (inputValue) {
              setState(() {
                address=inputValue;

                // Check if the address is not empty
                isAddressValid = inputValue.trim().isNotEmpty;
              });
              print('address : ${address}');
            },
            decoration: InputDecoration(
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: kPrimaryColor), // Orange border color
              ),
              labelStyle: const TextStyle(color: kPrimaryColor), // Orange label text color
              errorText: isAddressValid ? null : "Please enter your address",
              errorStyle: const TextStyle(color: kPrimaryColor),
              focusedErrorBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: kPrimaryColor),
              ),
              errorBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: kPrimaryColor),
              ),
              labelText: 'ADDRESS',
            ),
          ),
          const SizedBox(height: 50),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              side: const BorderSide(color: kPrimaryColor, width: 1.5),
            ),
            onPressed: () async {
              setState(() {
                isNameValid = _textField1Controller.text.trim().isNotEmpty;
                isPhoneValid = _textField2Controller.text.trim().isNotEmpty;
                isAddressValid = _textField3Controller.text.trim().isNotEmpty;
              });
             await controller.validatorCart(id: widget.branchId,name: name,address: address,phone: phone);
             Get.snackbar('Item Added', 'Sent to bike',backgroundColor: Colors.green);
             Get.offAll(()=>const BranchScreen());
            },

            child: const Text(
              "CHECKOUT",
              style: TextStyle(
                fontFamily: 'Popins',
                fontSize: 20,
                color: kPrimaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
