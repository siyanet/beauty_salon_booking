
import 'package:flutter/material.dart';
import 'package:flutter_beauty_salon_booking/controllers/home_upper_page.dart';
import 'package:flutter_beauty_salon_booking/models/services_model.dart';
import 'package:flutter_beauty_salon_booking/components/my_app_bar.dart';
import 'package:flutter_beauty_salon_booking/pages/service_tile.dart';
import 'package:flutter_beauty_salon_booking/providers/service_provider.dart';

import 'package:provider/provider.dart';


class CustomerHomePageReal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final serviceProvider = Provider.of<ServiceProvider>(context, listen: true);
    final List<Service> servicesFetched = serviceProvider.allServices;
 
    return servicesFetched.isEmpty
        ? Center(child: CircularProgressIndicator()) // Show a loading indicator when services are being fetched
         :
         // Scaffold(
        //   appBar: MyAppBar(),
        //   body:
        SingleChildScrollView(
           child:  Column(
      children: [

     SizedBox(child: HomeUpper()),
    const  Center(child: Text("Services"),),
        Positioned.fill(
          child: SizedBox(
            height: 500,
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Adjust the crossAxisCount as needed
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 0.7, // Adjust the aspect ratio as needed
              ),
              itemCount: servicesFetched.length,
              itemBuilder: (context, index) {
                var service = servicesFetched[index];
                return ServiceTile(service: service);
              },
            ),))])
       
// )
 ); }
}

      
      
      
      
      
      
 