import 'package:flutter/material.dart';

enum SnackBarType {
  Success,
  Error,
  Info,
}

void showCustomSnackBar(BuildContext context, String message, SnackBarType type,
    {Duration duration = const Duration(seconds: 2)}) {
  Color backgroundColor;
  Icon icon;

  switch (type) {
    case SnackBarType.Success:
      backgroundColor = Colors.green;
      icon = const Icon(Icons.check_circle, color: Colors.white);
      break;
    case SnackBarType.Error:
      backgroundColor = Colors.red;
      icon = const Icon(Icons.error, color: Colors.white);
      break;
    case SnackBarType.Info:
      backgroundColor = Colors.blue;
      icon = const Icon(Icons.info, color: Colors.white);
      break;
  }

  final snackBar = SnackBar(
    content: Row(
      children: [
        icon,
        const SizedBox(width: 10),
        Text(
          message,
          style: const TextStyle(color: Colors.white),
        ),
      ],
    ),
    backgroundColor: backgroundColor,
    duration: duration,
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

// example how to use :
///TODO import showCustomSnackBar(context, 'Success!', SnackBarType.Success);
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: CustomSnackBarDemo(),
//     );
//   }
// }
//
// class CustomSnackBarDemo extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Custom Snack Bar Demo'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             showCustomSnackBar(context, 'Success!', SnackBarType.Success);
//           },
//           child: Text('Show Success Snack Bar'),
//         ),
//       ),
//     );
//   }
// }
