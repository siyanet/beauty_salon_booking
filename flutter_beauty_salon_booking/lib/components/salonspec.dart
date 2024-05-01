
import 'package:flutter/material.dart';

class SalonSpec extends StatelessWidget {
  const SalonSpec({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: [
        Text("Betty Salon",
        style:Theme.of(context).textTheme.bodyLarge),
     Text("unvile your beauty with us",style: Theme.of(context).textTheme.bodyMedium,
     ),
      Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         Icon( Icons.location_on,color: Theme.of(context).colorScheme.background),
         Text("Bahirdar",style: Theme.of(context).textTheme.bodyMedium)
       ],),
     
     
     
      ],)
    );
  }
}