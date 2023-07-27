import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../const.dart';



import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../const.dart';

class BottomSheetContent extends StatefulWidget {
  @override
  _BottomSheetContentState createState() => _BottomSheetContentState();
}

class _BottomSheetContentState extends State<BottomSheetContent> {
  TextEditingController _textField1Controller = TextEditingController();
  TextEditingController _textField2Controller = TextEditingController();
  TextEditingController _textField3Controller = TextEditingController();

  bool isNameValid = true;
  bool isPhoneValid = true;
  bool isAddressValid = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 800,
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(50.0)),
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
            onChanged: (inputValue) {
              setState(() {
                // Check if the name is not empty
                isNameValid = inputValue.trim().isNotEmpty;
              });
            },
            decoration: InputDecoration(
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: kPrimaryColor), // Orange border color
              ),
              labelStyle: TextStyle(color: kPrimaryColor), // Orange label text color
              errorText: isNameValid ? null : "Please enter your name",
              errorStyle: TextStyle(color: kPrimaryColor),
              focusedErrorBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: kPrimaryColor),
              ),
              errorBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: kPrimaryColor),
              ),
              labelText: 'NAME',
            ),
          ),
          SizedBox(height: 15),
          TextField(
            controller: _textField2Controller,
            onChanged: (inputValue) {
              setState(() {
                // Check if the phone number is valid
                isPhoneValid = inputValue.length == 11 && int.tryParse(inputValue) != null;
              });
            },
            maxLength: 11,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: kPrimaryColor), // Orange border color
              ),
              labelStyle: TextStyle(color: kPrimaryColor), // Orange label text color
              errorText: isPhoneValid ? null : "Please enter your phone number",
              errorStyle: TextStyle(color: kPrimaryColor),
              focusedErrorBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: kPrimaryColor),
              ),
              errorBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: kPrimaryColor),
              ),
              labelText: 'PHONE',
            ),
          ),
          SizedBox(height: 10),
          TextField(
            controller: _textField3Controller,
            onChanged: (inputValue) {
              setState(() {
                // Check if the address is not empty
                isAddressValid = inputValue.trim().isNotEmpty;
              });
            },
            decoration: InputDecoration(
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: kPrimaryColor), // Orange border color
              ),
              labelStyle: TextStyle(color: kPrimaryColor), // Orange label text color
              errorText: isAddressValid ? null : "Please enter your address",
              errorStyle: TextStyle(color: kPrimaryColor),
              focusedErrorBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: kPrimaryColor),
              ),
              errorBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: kPrimaryColor),
              ),
              labelText: 'ADDRESS',
            ),
          ),
          SizedBox(height: 50),
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              side: BorderSide(color: kPrimaryColor, width: 1.5),
            ),
            onPressed: () {
              setState(() {
                isNameValid = _textField1Controller.text.trim().isNotEmpty;
                isPhoneValid = _textField2Controller.text.trim().isNotEmpty;
                isAddressValid = _textField3Controller.text.trim().isNotEmpty;
              });
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
