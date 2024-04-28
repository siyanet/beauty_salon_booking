import 'package:flutter/material.dart';

class HomeUpper extends StatelessWidget {
 HomeUpper({super.key});

  @override
  Widget build(BuildContext context) {
    return  Stack(
        children: [
          Container(
            child: Image.asset(
              'assets/salonHomeImage.jpg',
              width: 400,
              height: 300,
              fit: BoxFit.cover,
            ),
          ),
          // Positioned(
          //   bottom: 0,
          //   left: 4,
          //   child: Container(
          //     padding: EdgeInsets.all(16.0),
          //     //color: Colors.black.withOpacity(0.5), // Add opacity to make text readable
          //     child: Text(
          //       "Embrace Your Elegance, Unveil Your Beauty.",
          //       style: TextStyle(
          //         color: Colors.white,
          //         fontSize: 18.0,
          //         fontWeight: FontWeight.bold,
          //       ),
          //     ),
          //   ),
          // ),
        ],
      
    );
  }
}
