import 'package:flutter/material.dart';
import 'custom_text.dart';

class CustomButton extends StatelessWidget {
   CustomButton({Key? key, required this.onPressed,required this.buttonLabel}) : super(key: key);

  final VoidCallback onPressed;
  String? buttonLabel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          height: 60,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.orange.withOpacity(0.5),
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 0), // changes position of shadow
              ),
            ],
          ),
          child: Center(
            child: Text(
              buttonLabel!,
              style: CustomTextStyle.button,
            ),
          ),
        ),
      ),
    );
  }
}

// class ActualButton extends StatelessWidget {
//   const ActualButton({Key? key, required this.onPressed}) : super(key: key);
//
//   final VoidCallback onPressed;
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.fromLTRB(10, 15, 10, 15),
//       child: Container(
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(10),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.grey.withOpacity(0.2),
//               spreadRadius: 0,
//               blurRadius: 0,
//               offset: const Offset(0, 0),
//             ),
//           ],
//         ),
//         child: MaterialButton(
//           // color: Colors.white,
//
//           // Set color to the desired background color
//           color: Colors.orange.withOpacity(0.5),
//           // disabledColor: Colors.orange.withOpacity(0.7),
//           height: 60,
//           minWidth: double.infinity,
//           elevation: 0.1,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(30),
//             side: BorderSide.none,
//           ),
//           onPressed: onPressed,
//           child: Text(
//             'Login',
//             style: CustomTextStyle.button,
//           ),
//         ),
//       ),
//     );
//   }
// }
