import 'package:flutter/material.dart';
import 'package:flutter_beauty_salon_booking/components/mybutton.dart';
import 'package:flutter_beauty_salon_booking/models/services_model.dart';
import 'package:flutter_beauty_salon_booking/models/time_slot_model.dart';
import 'package:flutter_beauty_salon_booking/pages/time_slot_page.dart';
import 'package:flutter_beauty_salon_booking/providers/selected_provider.dart';
import 'package:flutter_beauty_salon_booking/services/time_slot_services.dart';
import 'package:provider/provider.dart';
 class ServiceTile extends StatelessWidget {
  final Service service;


 ServiceTile({super.key, required this.service});

  TimeSlotServices timeSlotServices = TimeSlotServices();

  List<TimeSlot> timeSlots = [];

  @override
  Widget build(BuildContext context) {
 
   return Expanded(
     child: Card(
      color: Theme.of(context).colorScheme.secondary,
       shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
         child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 3,
             child: 
           
                Image.network(
                    service.photo, 
                     height: 300,
                     width: 600,
                     fit: BoxFit.cover,
                   ),
              ),
              //),
                
                
                    Expanded(
                      flex: 2,
                      child: Padding(
                                  padding: const EdgeInsets.all(3),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                      service.name,
                      style:  Theme.of(context).textTheme.bodyLarge,
                                      ),
                                     
                                      Text(
                      service.description,
                      style:  Theme.of(context).textTheme.bodyMedium,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                                      ),
                                 
                                      Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'price \$${service.price.toStringAsFixed(2)}',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                       
           MyButton(text: "book", 
                         onTap:
                            () {
                              showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime.now().add(Duration(days: 60)),
                      ).then((DateTime? selectedDate) async {
                        Provider.of<SelectedProvider>(context,listen: false).setSelectedService(service);
                        if (selectedDate != null) {
                           Provider.of<SelectedProvider>(context, listen: false)
                              .setSelectedDate(selectedDate);
                           showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return TimeSlotPage(selectedDate: selectedDate);
                            },
                          );
                                      }
                                      }
                                      );
                          })]),])),
                    )
          ]
     )),
   );
  }}




















