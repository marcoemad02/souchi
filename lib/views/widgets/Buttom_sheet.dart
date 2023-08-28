import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souchi/core/view_model/product_Controller.dart';
import 'package:souchi/views/pages/BranchPage/branch_view.dart';
import '../../const.dart';

class BottomSheetContent extends StatefulWidget {
  const BottomSheetContent({Key? key, required this.branchId}) : super(key: key);

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
  String building_No  = '';
  String floor_No = '';
  String specialSign = '';

  bool areAllFieldsFilled() {
    return name.isNotEmpty && phone1.isNotEmpty &&phone2.isNotEmpty&& fullAddress.isNotEmpty && apartment_No.isNotEmpty && building_No.isNotEmpty && floor_No.isNotEmpty && specialSign.isNotEmpty    ;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: double.infinity,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        // borderRadius: const BorderRadius.vertical(top: Radius.circular(50.0)),
        // border: Border.all(
        //   color: Colors.grey, // Border color
        //   width: 1.0, // Border width
        // ),
      ),
      child: ListView(
        children: [
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
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: kPrimaryColor), // Orange border color
              ),
              labelStyle: const TextStyle(color: kPrimaryColor), // Orange label text color
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
            onChanged: (inputValue) {
              setState(() {
                phone1 = inputValue;
                isPhone1Valid = inputValue.length == 11 && int.tryParse(inputValue) != null;
              });
              print('Phone: $phone1');
            },
            maxLength: 11,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: kPrimaryColor), // Orange border color
              ),
              labelStyle: const TextStyle(color: kPrimaryColor), // Orange label text color
              errorText: isPhone1Valid ? null : "Please enter your phone number",
              errorStyle: const TextStyle(color: kPrimaryColor),
              focusedErrorBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: kPrimaryColor),
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
            onChanged: (inputValue) {
              setState(() {
                phone2 = inputValue;
                isPhone2Valid = inputValue.length == 11 && int.tryParse(inputValue) != null;
              });
              print('Phone: $phone2');
            },
            maxLength: 11,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: kPrimaryColor), // Orange border color
              ),
              labelStyle: const TextStyle(color: kPrimaryColor), // Orange label text color
              errorText: isPhone2Valid ? null : "Please enter your Second phone number",
              errorStyle: const TextStyle(color: kPrimaryColor),
              focusedErrorBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: kPrimaryColor),
              ),
              errorBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: kPrimaryColor),
              ),
              labelText: 'PHONE 2',
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
              print('FullAddress: $fullAddress');
            },
            decoration: InputDecoration(
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: kPrimaryColor), // Orange border color
              ),
              labelStyle: const TextStyle(color: kPrimaryColor), // Orange label text color
              errorText: isFullAddressValid ? null : "Please enter your address",
              errorStyle: const TextStyle(color: kPrimaryColor),
              focusedErrorBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: kPrimaryColor),
              ),
              errorBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: kPrimaryColor),
              ),
              labelText: 'FULL ADDRESS',
            ),
          ),
          const SizedBox(height: 10),
          TextField(
            keyboardType: TextInputType.number,
            maxLength: 3,
            controller: _textField5Controller,
            onChanged: (inputValue) {
              setState(() {
                building_No = inputValue;
                isBuilding_No_Valid = inputValue.trim().isNotEmpty;
              });
              print('building_No: $building_No');
            },
            decoration: InputDecoration(
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: kPrimaryColor), // Orange border color
              ),
              labelStyle: const TextStyle(color: kPrimaryColor), // Orange label text color
              errorText: isBuilding_No_Valid ? null : "Please enter your Building Number",
              errorStyle: const TextStyle(color: kPrimaryColor),
              focusedErrorBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: kPrimaryColor),
              ),
              errorBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: kPrimaryColor),
              ),
              labelText: 'Building No.',
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
              print('floor_No: $floor_No');
            },
            decoration: InputDecoration(
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: kPrimaryColor), // Orange border color
              ),
              labelStyle: const TextStyle(color: kPrimaryColor), // Orange label text color
              errorText: isFloor_No_Valid ? null : "Please enter your Floor Number",
              errorStyle: const TextStyle(color: kPrimaryColor),
              focusedErrorBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: kPrimaryColor),
              ),
              errorBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: kPrimaryColor),
              ),
              labelText: 'Floor No.',
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
              print('apartment_No: $apartment_No');
            },
            decoration: InputDecoration(
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: kPrimaryColor), // Orange border color
              ),
              labelStyle: const TextStyle(color: kPrimaryColor), // Orange label text color
              errorText: isApartment_No_Valid ? null : "Please enter your Apartment Number",
              errorStyle: const TextStyle(color: kPrimaryColor),
              focusedErrorBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: kPrimaryColor),
              ),
              errorBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: kPrimaryColor),
              ),
              labelText: 'Apartment No.',
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
              print('specialSign: $specialSign');
            },
            decoration: InputDecoration(
              focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: kPrimaryColor), // Orange border color
              ),
              labelStyle: const TextStyle(color: kPrimaryColor), // Orange label text color
              errorText: isSpecialSign_valid ? null : "Please enter your Special Sign  ",
              errorStyle: const TextStyle(color: kPrimaryColor),
              focusedErrorBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: kPrimaryColor),
              ),
              errorBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: kPrimaryColor),
              ),
              labelText: 'Special Sign',
            ),
          ),
          const SizedBox(height: 50),



          /// Buttons
          OutlinedButton(
            style: OutlinedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.0),
              ),
              side: const BorderSide(color: kPrimaryColor, width: 1.5),
            ),
            onPressed: () async {
              setState(() {
                isNameValid =       _textField1Controller.text.trim().isNotEmpty;
                isPhone1Valid =     _textField2Controller.text.trim().isNotEmpty;
                isPhone2Valid =      _textField3Controller.text.trim().isNotEmpty;
                isFullAddressValid = _textField4Controller.text.trim().isNotEmpty;
                isBuilding_No_Valid = _textField5Controller.text.trim().isNotEmpty;
                isFloor_No_Valid = _textField6Controller.text.trim().isNotEmpty;
                isApartment_No_Valid = _textField7Controller.text.trim().isNotEmpty;
                isSpecialSign_valid = _textField8Controller.text.trim().isNotEmpty;
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
                Get.snackbar('Item Added', 'Sent to bike', backgroundColor: Colors.green);
                Get.offAll(() => const BranchScreen());
              } else {
                Get.snackbar('Error', 'Add your Name, Phone and Address');
              }
            },
            child: const Text(
              "Send Order To Bike",
              style: TextStyle(
                fontFamily: 'Popins',
                fontSize: 20,
                color: kPrimaryColor,
              ),
            ),
          ),
          const SizedBox(height: 20),
          // checkpoints by points
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
                isPhone1Valid = _textField2Controller.text.trim().isNotEmpty;
                isPhone2Valid = _textField3Controller.text.trim().isNotEmpty;
                isFullAddressValid = _textField4Controller.text.trim().isNotEmpty;
                isBuilding_No_Valid = _textField5Controller.text.trim().isNotEmpty;
                isFloor_No_Valid = _textField6Controller.text.trim().isNotEmpty;
                isApartment_No_Valid = _textField7Controller.text.trim().isNotEmpty;
                isSpecialSign_valid = _textField8Controller.text.trim().isNotEmpty;
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
                Get.snackbar('Item Added', 'Sent to bike', backgroundColor: Colors.green);
                Get.offAll(() => const BranchScreen());
              } else {
                Get.snackbar('Error', 'Add your Name, Phone and Address');
              }
            },
            child: const Text(
              "Send Order To Bike  ByPoints",
              style: TextStyle(
                fontFamily: 'Popins',
                fontSize: 20,
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
        ],
      )

      // Column(
      //
      //   mainAxisSize: MainAxisSize.max,
      //   children: [
      //     TextField(
      //       controller: _textField1Controller,
      //       onChanged: (inputValue) {
      //         setState(() {
      //           name = inputValue;
      //           isNameValid = inputValue.trim().isNotEmpty;
      //         });
      //         print('Name: $name');
      //       },
      //       decoration: InputDecoration(
      //         focusedBorder: const UnderlineInputBorder(
      //           borderSide: BorderSide(color: kPrimaryColor), // Orange border color
      //         ),
      //         labelStyle: const TextStyle(color: kPrimaryColor), // Orange label text color
      //         errorText: isNameValid ? null : "Please enter your name",
      //         errorStyle: const TextStyle(color: kPrimaryColor),
      //         focusedErrorBorder: const UnderlineInputBorder(
      //           borderSide: BorderSide(color: kPrimaryColor),
      //         ),
      //         errorBorder: const UnderlineInputBorder(
      //           borderSide: BorderSide(color: kPrimaryColor),
      //         ),
      //         labelText: 'NAME',
      //       ),
      //     ),
      //     const SizedBox(height: 15),
      //     TextField(
      //       controller: _textField2Controller,
      //       onChanged: (inputValue) {
      //         setState(() {
      //           phone1 = inputValue;
      //           isPhone1Valid = inputValue.length == 11 && int.tryParse(inputValue) != null;
      //         });
      //         print('Phone: $phone1');
      //       },
      //       maxLength: 11,
      //       keyboardType: TextInputType.number,
      //       decoration: InputDecoration(
      //         focusedBorder: const UnderlineInputBorder(
      //           borderSide: BorderSide(color: kPrimaryColor), // Orange border color
      //         ),
      //         labelStyle: const TextStyle(color: kPrimaryColor), // Orange label text color
      //         errorText: isPhone1Valid ? null : "Please enter your phone number",
      //         errorStyle: const TextStyle(color: kPrimaryColor),
      //         focusedErrorBorder: const UnderlineInputBorder(
      //           borderSide: BorderSide(color: kPrimaryColor),
      //         ),
      //         errorBorder: const UnderlineInputBorder(
      //           borderSide: BorderSide(color: kPrimaryColor),
      //         ),
      //         labelText: 'PHONE',
      //       ),
      //     ),
      //     const SizedBox(height: 10),
      //     TextField(
      //       controller: _textField3Controller,
      //       onChanged: (inputValue) {
      //         setState(() {
      //           fullAddress = inputValue;
      //           isFullAddressValid = inputValue.trim().isNotEmpty;
      //         });
      //         print('Address: $fullAddress');
      //       },
      //       decoration: InputDecoration(
      //         focusedBorder: const UnderlineInputBorder(
      //           borderSide: BorderSide(color: kPrimaryColor), // Orange border color
      //         ),
      //         labelStyle: const TextStyle(color: kPrimaryColor), // Orange label text color
      //         errorText: isFullAddressValid ? null : "Please enter your address",
      //         errorStyle: const TextStyle(color: kPrimaryColor),
      //         focusedErrorBorder: const UnderlineInputBorder(
      //           borderSide: BorderSide(color: kPrimaryColor),
      //         ),
      //         errorBorder: const UnderlineInputBorder(
      //           borderSide: BorderSide(color: kPrimaryColor),
      //         ),
      //         labelText: 'ADDRESS',
      //       ),
      //     ),
      //     const SizedBox(height: 10),
      //     TextField(
      //       keyboardType: TextInputType.number,
      //       maxLength: 3,
      //       controller: _textField4Controller,
      //       onChanged: (inputValue) {
      //         setState(() {
      //           building_No = inputValue;
      //           isBuilding_No_Valid = inputValue.trim().isNotEmpty;
      //         });
      //         print('Address: $building_No');
      //       },
      //       decoration: InputDecoration(
      //         focusedBorder: const UnderlineInputBorder(
      //           borderSide: BorderSide(color: kPrimaryColor), // Orange border color
      //         ),
      //         labelStyle: const TextStyle(color: kPrimaryColor), // Orange label text color
      //         errorText: isBuilding_No_Valid ? null : "Please enter your Building Number",
      //         errorStyle: const TextStyle(color: kPrimaryColor),
      //         focusedErrorBorder: const UnderlineInputBorder(
      //           borderSide: BorderSide(color: kPrimaryColor),
      //         ),
      //         errorBorder: const UnderlineInputBorder(
      //           borderSide: BorderSide(color: kPrimaryColor),
      //         ),
      //         labelText: 'Building No.',
      //       ),
      //     ),
      //     const SizedBox(height: 10),
      //     TextField(
      //       keyboardType: TextInputType.number,
      //       maxLength: 2,
      //       controller: _textField5Controller,
      //       onChanged: (inputValue) {
      //         setState(() {
      //           floor_No = inputValue;
      //           isFloor_No_Valid = inputValue.trim().isNotEmpty;
      //         });
      //         print('Address: $floor_No');
      //       },
      //       decoration: InputDecoration(
      //         focusedBorder: const UnderlineInputBorder(
      //           borderSide: BorderSide(color: kPrimaryColor), // Orange border color
      //         ),
      //         labelStyle: const TextStyle(color: kPrimaryColor), // Orange label text color
      //         errorText: isFloor_No_Valid ? null : "Please enter your Floor Number",
      //         errorStyle: const TextStyle(color: kPrimaryColor),
      //         focusedErrorBorder: const UnderlineInputBorder(
      //           borderSide: BorderSide(color: kPrimaryColor),
      //         ),
      //         errorBorder: const UnderlineInputBorder(
      //           borderSide: BorderSide(color: kPrimaryColor),
      //         ),
      //         labelText: 'Floor No.',
      //       ),
      //     ),
      //     const SizedBox(height: 50),
      //
      //
      //
      //     /// Buttons
      //     OutlinedButton(
      //       style: OutlinedButton.styleFrom(
      //         shape: RoundedRectangleBorder(
      //           borderRadius: BorderRadius.circular(16.0),
      //         ),
      //         side: const BorderSide(color: kPrimaryColor, width: 1.5),
      //       ),
      //       onPressed: () async {
      //         setState(() {
      //           isNameValid = _textField1Controller.text.trim().isNotEmpty;
      //           isPhone1Valid = _textField2Controller.text.trim().isNotEmpty;
      //           isFullAddressValid = _textField3Controller.text.trim().isNotEmpty;
      //         });
      //
      //         if (areAllFieldsFilled()) {
      //           await controller.validatorCart_Cash(
      //             id: widget.branchId,
      //             name: name,
      //             address: fullAddress,
      //             phone: phone1,
      //             paymentStatue: 'Cash',
      //           );
      //           Get.snackbar('Item Added', 'Sent to bike', backgroundColor: Colors.green);
      //           Get.offAll(() => const BranchScreen());
      //         } else {
      //           Get.snackbar('Error', 'Add your Name, Phone and Address');
      //         }
      //       },
      //       child: const Text(
      //         "Send Order To Bike",
      //         style: TextStyle(
      //           fontFamily: 'Popins',
      //           fontSize: 20,
      //           color: kPrimaryColor,
      //         ),
      //       ),
      //     ),
      //     const SizedBox(height: 20),
      //     // checkpoints by points
      //     OutlinedButton(
      //       style: OutlinedButton.styleFrom(
      //         shape: RoundedRectangleBorder(
      //           borderRadius: BorderRadius.circular(16.0),
      //         ),
      //         side: const BorderSide(color: kPrimaryColor, width: 1.5),
      //       ),
      //       onPressed: () async {
      //         setState(() {
      //           isNameValid = _textField1Controller.text.trim().isNotEmpty;
      //           isPhone1Valid = _textField2Controller.text.trim().isNotEmpty;
      //           isFullAddressValid = _textField3Controller.text.trim().isNotEmpty;
      //         });
      //
      //         if (areAllFieldsFilled()) {
      //           await controller.validatorCart_Cash(
      //             id: widget.branchId,
      //             name: name,
      //             address: fullAddress,
      //             phone: phone1,
      //             paymentStatue: 'Points',
      //           );
      //           Get.snackbar('Item Added', 'Sent to bike', backgroundColor: Colors.green);
      //           Get.offAll(() => const BranchScreen());
      //         } else {
      //           Get.snackbar('Error', 'Add your Name, Phone and Address');
      //         }
      //       },
      //       child: const Text(
      //         "Send Order To Bike  ByPoints",
      //         style: TextStyle(
      //           fontFamily: 'Popins',
      //           fontSize: 20,
      //           color: kPrimaryColor,
      //         ),
      //       ),
      //     ),
      //     const SizedBox(height: 20),
      //     const Text(
      //       'Delivery fees depend on your Location, It usually starts from 20 LE',
      //       style: TextStyle(
      //         fontFamily: 'Poppins',
      //         color: Colors.black45,
      //         fontSize: 18,
      //       ),
      //       textAlign: TextAlign.center,
      //     ),
      //   ],
      // ),
    );
  }
}
