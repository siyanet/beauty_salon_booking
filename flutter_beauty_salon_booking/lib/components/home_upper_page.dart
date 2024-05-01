import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeUpper extends StatelessWidget {
 HomeUpper({super.key});

  @override
  Widget build(BuildContext context) {
    return   Stack(
        children: [
          Container(
            child: Image.asset(
              'assets/salonHomeImage.jpg',
              width: 400,
              height: 300,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 20),
          Positioned(
            bottom: 0,
            left: 40,
            
              
              child: Image.asset("assets/logo.png",
              width: 300,
              height: 100,
              fit: BoxFit.contain
              ),
            
            
            
            
          ),
       
        ],
      
    );
  }
}
