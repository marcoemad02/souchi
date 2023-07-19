import 'package:flutter/material.dart';



class CustomCheckoutButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: TextButton(
        onPressed: () {
          // Implement your checkout logic here
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Total Price :',
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Poppins',
                color: Colors.grey,

              ),
            ),
            SizedBox(width: 8),
            Text(
              '\$100',
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'Poppins',
                color: Colors.grey,
                //fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 22),
            Text(
              'CHECKOUT',
              style: TextStyle(
                fontSize:21,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
                color: Colors.orange,
              ),
            ),
          ],
        ),
      ),
    );
  }
}