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
        Expanded(
          child: Text(
            message,
            style: const TextStyle(color: Colors.white),
            overflow: TextOverflow.ellipsis,
            maxLines: 2, // Adjust this value as needed
          ),
        ),
      ],
    ),
    backgroundColor: backgroundColor,
    duration: duration,
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
