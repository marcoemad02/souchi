import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souchi/core/view_model/product_Controller.dart';
import 'package:souchi/views/pages/BranchPage/branch_view.dart';
import '../../const.dart';

class BottomSheetContent extends StatefulWidget {
  const BottomSheetContent({Key? key, required this.branchId})
      : super(key: key);

  @override
  _BottomSheetContentState createState() => _BottomSheetContentState();

  final branchId;
}

class _BottomSheetContentState extends State<BottomSheetContent> {
  TextEditingController _textField1Controller = TextEditingController();
  TextEditingController _textField2Controller = TextEditingController();
  TextEditingController _textField3Controller = TextEditingController();
  TextEditingController _textField4Controller = TextEditingController();
  TextEditingController _textField5Controller = TextEditingController();
  TextEditingController _textField6Controller = TextEditingController();
  TextEditingController _textField7Controller = TextEditingController();
  TextEditingController _textField8Controller = TextEditingController();

  bool isNameValid = true;
  bool isPhone1Valid = true;
  bool isPhone2Valid = true;
  bool isFullAddressValid = true;
  bool isBuilding_No_Valid = true;
  bool isFloor_No_Valid = true;
  bool isApartment_No_Valid = true;
  bool isSpecialSign_valid = true;
  var controller = Get.put(ProductController());

  String name = '';
  String phone1 = '';
  String phone2 = '';
  String fullAddress = '';
  String apartment_No = '';
  String building_No = '';
  String floor_No = '';
  String specialSign = '';

  bool areAllFieldsFilled() {
    return name.isNotEmpty &&
        phone1.isNotEmpty &&
        phone2.isNotEmpty &&
        fullAddress.isNotEmpty &&
        apartment_No.isNotEmpty &&
        building_No.isNotEmpty &&
        floor_No.isNotEmpty &&
        specialSign.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
                left: 16.0,
                right: 16.0,
                top: 16.0,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: 35,),
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.grey), // Customize the border color
                      ),
                      child: IconButton(
                        icon: Icon(Icons.close, color: Colors.black), // Customize icon color
                        onPressed: () {
                          // Close the bottom sheet when the button is pressed
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: _textField1Controller,
                    onChanged: (inputValue) {
                      setState(() {
                        name = inputValue;
                        isNameValid = inputValue.trim().isNotEmpty;
                      });
                      print('Name: $name');
                    },
                    decoration: InputDecoration(
                      labelText: 'Name',
                      labelStyle: TextStyle(color: kPrimaryColor),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: kPrimaryColor),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      errorText: isNameValid ? null : "Please enter your name",
                      errorStyle: TextStyle(color: Colors.red),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: kPrimaryColor),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      prefixIcon: Icon(
                        Icons.person,
                        color: kPrimaryColor,
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),
                  TextField(
                    controller: _textField2Controller,
                    onChanged: (inputValue) {
                      setState(() {
                        phone1 = inputValue;
                        isPhone1Valid = inputValue.length == 11 &&
                            int.tryParse(inputValue) != null;
                      });
                      print('Phone: $phone1');
                    },
                    maxLength: 11,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Phone Number',
                      labelStyle: TextStyle(color: kPrimaryColor),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: kPrimaryColor),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      errorText: isPhone1Valid
                          ? null
                          : "Please enter a valid 11-digit phone number",
                      errorStyle: TextStyle(color: Colors.red),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: kPrimaryColor),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      prefixIcon: Icon(
                        Icons.phone,
                        color: kPrimaryColor,
                      ),
                      hintText: ' e.g. 01234567890',
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                  ),

                  const SizedBox(height: 10),
                  TextField(
                    controller: _textField3Controller,
                    onChanged: (inputValue) {
                      setState(() {
                        phone2 = inputValue;
                        isPhone2Valid = inputValue.length == 11 &&
                            int.tryParse(inputValue) != null;
                      });
                      print('Phone 2: $phone2');
                    },
                    maxLength: 11,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Second Phone Number',
                      labelStyle: TextStyle(color: kPrimaryColor),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: kPrimaryColor),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      errorText: isPhone2Valid
                          ? null
                          : "Please enter a valid 11-digit phone number",
                      errorStyle: TextStyle(color: Colors.red),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: kPrimaryColor),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      prefixIcon: Icon(
                        Icons.phone,
                        color: kPrimaryColor,
                      ),
                      hintText: ' e.g. 01234567890',
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                  ),

                  const SizedBox(height: 10),
                  TextField(
                    controller: _textField4Controller,
                    onChanged: (inputValue) {
                      setState(() {
                        fullAddress = inputValue;
                        isFullAddressValid = inputValue.trim().isNotEmpty;
                      });
                      print('Full Address: $fullAddress');
                    },
                    decoration: InputDecoration(
                      labelText: 'Full Address',
                      labelStyle: TextStyle(color: kPrimaryColor),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: kPrimaryColor),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      errorText:
                          isFullAddressValid ? null : "Please enter your address",
                      errorStyle: TextStyle(color: Colors.red),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: kPrimaryColor),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      prefixIcon: Icon(
                        Icons.location_on,
                        color: kPrimaryColor,
                      ),
                      hintText: ' Enter your full address',
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                  ),

                  const SizedBox(height: 30),
                  TextField(
                    keyboardType: TextInputType.number,
                    maxLength: 3,
                    controller: _textField5Controller,
                    onChanged: (inputValue) {
                      setState(() {
                        building_No = inputValue;
                        isBuilding_No_Valid = inputValue.trim().isNotEmpty;
                      });
                      print('Building No.: $building_No');
                    },
                    decoration: InputDecoration(
                      labelText: 'Building Number',
                      labelStyle: TextStyle(color: kPrimaryColor),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: kPrimaryColor),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      errorText: isBuilding_No_Valid
                          ? null
                          : "Please enter your Building Number",
                      errorStyle: TextStyle(color: Colors.red),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: kPrimaryColor),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      prefixIcon: Icon(
                        Icons.home,
                        color: kPrimaryColor,
                      ),
                      hintText: 'Enter building number',
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                  ),

                  const SizedBox(height: 10),
                  TextField(
                    keyboardType: TextInputType.number,
                    maxLength: 2,
                    controller: _textField6Controller,
                    onChanged: (inputValue) {
                      setState(() {
                        floor_No = inputValue;
                        isFloor_No_Valid = inputValue.trim().isNotEmpty;
                      });
                      print('Floor No.: $floor_No');
                    },
                    decoration: InputDecoration(
                      labelText: 'Floor Number',
                      labelStyle: TextStyle(color: kPrimaryColor),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: kPrimaryColor),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(405),
                      ),
                      errorText: isFloor_No_Valid
                          ? null
                          : "Please enter your Floor Number",
                      errorStyle: TextStyle(color: Colors.red),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: kPrimaryColor),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      prefixIcon: Icon(
                        Icons.layers,
                        color: kPrimaryColor,
                      ),
                      hintText: 'Enter floor number',
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                  ),

                  const SizedBox(height: 10),
                  TextField(
                    keyboardType: TextInputType.number,
                    maxLength: 3,
                    controller: _textField7Controller,
                    onChanged: (inputValue) {
                      setState(() {
                        apartment_No = inputValue;
                        isApartment_No_Valid = inputValue.trim().isNotEmpty;
                      });
                      print('Apartment No.: $apartment_No');
                    },
                    decoration: InputDecoration(
                      labelText: 'Apartment Number',
                      labelStyle: TextStyle(color: kPrimaryColor),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: kPrimaryColor),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      errorText: isApartment_No_Valid
                          ? null
                          : "Please enter your Apartment Number",
                      errorStyle: TextStyle(color: Colors.red),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: kPrimaryColor),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      prefixIcon: Icon(
                        Icons.apartment,
                        color: kPrimaryColor,
                      ),
                      hintText: 'Enter apartment number',
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                  ),

                  const SizedBox(height: 10),
                  TextField(
                    controller: _textField8Controller,
                    onChanged: (inputValue) {
                      setState(() {
                        specialSign = inputValue;
                        isSpecialSign_valid = inputValue.trim().isNotEmpty;
                      });
                      print('Special Sign: $specialSign');
                    },
                    decoration: InputDecoration(
                      labelText: 'Special Sign',
                      labelStyle: TextStyle(color: kPrimaryColor),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: kPrimaryColor),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      errorText: isSpecialSign_valid
                          ? null
                          : "Please enter your Special Sign",
                      errorStyle: TextStyle(color: Colors.red),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: kPrimaryColor),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.circular(40),
                      ),
                      prefixIcon: Icon(
                        Icons.info,
                        color: kPrimaryColor,
                      ),
                      hintText: 'Enter a special sign (if any)',
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                  ),

                  const SizedBox(height: 50),

                  /// Buttons
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                      side: BorderSide(
                        color: kPrimaryColor,
                        width: 2,
                      ),
                    ),
                    onPressed: () async {
                      setState(() {
                        isNameValid =
                            _textField1Controller.text.trim().isNotEmpty;
                        isPhone1Valid =
                            _textField2Controller.text.trim().isNotEmpty;
                        isPhone2Valid =
                            _textField3Controller.text.trim().isNotEmpty;
                        isFullAddressValid =
                            _textField4Controller.text.trim().isNotEmpty;
                        isBuilding_No_Valid =
                            _textField5Controller.text.trim().isNotEmpty;
                        isFloor_No_Valid =
                            _textField6Controller.text.trim().isNotEmpty;
                        isApartment_No_Valid =
                            _textField7Controller.text.trim().isNotEmpty;
                        isSpecialSign_valid =
                            _textField8Controller.text.trim().isNotEmpty;
                      });

                      if (areAllFieldsFilled()) {
                        await controller.validatorCart_Cash(
                          id: widget.branchId,
                          name: name,
                          fullAddress: fullAddress,
                          phone1: phone1,
                          phone2: phone2,
                          buildingNo: building_No,
                          floorNo: floor_No,
                          apartmentNo: apartment_No,
                          specialSign: specialSign,
                          paymentStatue: 'Cash',
                        );
                        Get.snackbar('Item Added', 'Sent to bike',
                            backgroundColor: Colors.green);
                        Get.offAll(() => const BranchScreen());
                      } else {
                        Get.snackbar('Error', 'Add your Name, Phone and Address');
                      }
                    },
                    child: const Text(
                      "Send Order To Bike",
                      style: TextStyle(
                        fontFamily: 'Popins',
                        fontSize: 26,
                        color: kPrimaryColor,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  // checkpoints by points
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                      side: const BorderSide(color: kPrimaryColor, width: 2),
                    ),
                    onPressed: () async {
                      setState(() {
                        isNameValid =
                            _textField1Controller.text.trim().isNotEmpty;
                        isPhone1Valid =
                            _textField2Controller.text.trim().isNotEmpty;
                        isPhone2Valid =
                            _textField3Controller.text.trim().isNotEmpty;
                        isFullAddressValid =
                            _textField4Controller.text.trim().isNotEmpty;
                        isBuilding_No_Valid =
                            _textField5Controller.text.trim().isNotEmpty;
                        isFloor_No_Valid =
                            _textField6Controller.text.trim().isNotEmpty;
                        isApartment_No_Valid =
                            _textField7Controller.text.trim().isNotEmpty;
                        isSpecialSign_valid =
                            _textField8Controller.text.trim().isNotEmpty;
                      });

                      if (areAllFieldsFilled()) {
                        await controller.validatorCart_Cash(
                          id: widget.branchId,
                          name: name,
                          fullAddress: fullAddress,
                          phone1: phone1,
                          phone2: phone2,
                          buildingNo: building_No,
                          floorNo: floor_No,
                          apartmentNo: apartment_No,
                          specialSign: specialSign,
                          paymentStatue: 'Points',
                        );
                        Get.snackbar('Item Added', 'Sent to bike',
                            backgroundColor: Colors.green);
                        Get.offAll(() => const BranchScreen());
                      } else {
                        Get.snackbar('Error', 'Add your Name, Phone and Address');
                      }
                    },
                    child: const Text(
                      "Send Order To Bike By Points",
                      style: TextStyle(
                        fontFamily: 'Popins',
                        fontSize: 22,
                        color: kPrimaryColor,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Delivery fees depend on your Location, It usually starts from 20 LE',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      color: Colors.black45,
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
                  ),
                SizedBox(height: 40,)
                ],
              )
          )
      ),
    );
  }
}
