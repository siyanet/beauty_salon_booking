 import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_beauty_salon_booking/models/booking_model.dart';
import 'package:flutter_beauty_salon_booking/models/services_model.dart';
import 'package:flutter_beauty_salon_booking/models/time_slot_model.dart';
import 'package:flutter_beauty_salon_booking/models/users_model.dart';
import 'package:flutter_beauty_salon_booking/providers/selected_provider.dart';
import 'package:flutter_beauty_salon_booking/providers/time_slot_provider.dart';
import 'package:flutter_beauty_salon_booking/providers/user_provider.dart';
import 'package:flutter_beauty_salon_booking/services/auth_services.dart';
import 'package:flutter_beauty_salon_booking/services/booking_services.dart';
import 'package:flutter_beauty_salon_booking/services/time_slot_services.dart';
import 'package:flutter_beauty_salon_booking/services/user_service.dart';
import 'package:provider/provider.dart';

class TimeSlotPage extends StatelessWidget {
   final user = FirebaseAuth.instance.currentUser;
  BookingServices bookingServices = BookingServices();
  final DateTime selectedDate;
  TimeSlotPage({super.key,required this.selectedDate});
  AuthService auth = AuthService();
  UserService userService = UserService();

  final TimeSlotServices timeSlotServices = TimeSlotServices();
 // final DateTime selectedDate = DateTime(2024, 5, 1);

  @override
  Widget build(BuildContext context) {
  //    final timeSlotProvider = Provider.of<TimeSlotProvider>(context, listen: true);
 //   final List<TimeSlot> timeSlotsFetched = timeSlotProvider.timeSlot;
 Provider.of<TimeSlotProvider>(context).setTimeSlotBySelectedDate(selectedDate);
 final List<TimeSlot> timeSlotsFetched = Provider.of<TimeSlotProvider>(context).timeSlotBySelectedDate;
    return timeSlotsFetched.isEmpty
        ? Center(child: CircularProgressIndicator())
        : Dialog(
     
       child:Container(
              padding: EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "Available Time Slots",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Expanded(
                    child: ListView.builder(
                      itemCount:timeSlotsFetched.length,
                      itemBuilder: (context, index) {
                        TimeSlot timeSlot = timeSlotsFetched[index];
                        
                           String start = '${timeSlot.startTime.hour}:${timeSlot.startTime.minute}';
      String end = '${timeSlot.endTime.hour}: ${timeSlot.endTime.minute}';
                        return ListTile(
                          title: Text("Start Time: $start -- end Time: $end"),
                         // subtitle: Text("End Time: ${timeSlot.endTime}\nNumber of Times: ${timeSlot.numberOfTimes}"),
                         onTap: (){
                          Navigator.pop(context);
                           Provider.of<SelectedProvider>(context,listen: false).setSelectedTimeSlot(timeSlot);
                           String uid = user!.uid;
                           Stream<UserModel> usercurrent = userService.getUser(uid);
                             Provider.of<SelectedProvider>(context,listen: false).setCurrentUser(usercurrent);
                           
                          showDialog(
              context: context,
              builder: (BuildContext context) {
                DateTime dateSelected = Provider.of<SelectedProvider>(context).selectedDate;
                Service serviceSelected = Provider.of<SelectedProvider>(context).selectedService;
                TimeSlot ? timeSlotSelected = Provider.of<SelectedProvider>(context).selectedTimeSlot;
                 UserModel  ? currentUser= Provider.of<SelectedProvider>(context).currentUser;
    // final userProvider = Provider.of<UserProvider>(context,listen:true);
    // final UserModel  ? currentUser = userProvider.currentUser;
    // if(currentUser == null){
    //   print("timeslotselected is null");
    // }
                return AlertDialog(
                  title: Text('do you want to book ${serviceSelected.name} ?'), // Title with variable values
                  content: Text('for ${dateSelected.day.toString()} in ${timeSlotSelected!.startTime.toString()} to ${timeSlotSelected.endTime.toString()}'),
                  actions: <Widget>[
                    TextButton(onPressed: (){
                      String serviceId = serviceSelected.id;
                      String timeSlotId = timeSlotSelected.id!;
                      String  userId = currentUser!.id;
                      Booking booking = Booking(
                        customerId: userId,
                        serviceId: serviceId,
                        timeSlotId: timeSlotId,
                        status: 'pending'

                      );
                      bookingServices.addBooking(booking);
                     // snackbar();
                      Navigator.of(context).pop();


                      
                    }, child: Text("book")
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text('Close'),),],);
                         },);}
                        );
                      },
                    ),
                  ),
                 ],
              ),
           )
      //     }
      //   },
      // ),
    );
  }
}
