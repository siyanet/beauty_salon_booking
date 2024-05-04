import 'dart:io';
import 'package:flutter/material.dart';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_beauty_salon_booking/models/services_model.dart';
import 'package:flutter_beauty_salon_booking/services/services_firestore_service.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as Path;

class AddService extends StatefulWidget {
   AddService({Key? key});


  @override
  State<AddService> createState() => _AddServiceState();
}

class _AddServiceState extends State<AddService> {
  final TextEditingController _serviceNameController = TextEditingController();
  final TextEditingController _serviceDescriptionController = TextEditingController();
  File? _servicePhoto;
  final TextEditingController _serviceDurationController = TextEditingController();
  final TextEditingController _servicePriceController = TextEditingController();
  final picker = ImagePicker();

  // Method to pick an image from gallery
  Future<void> _pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _servicePhoto = File(pickedFile.path);
      } else {
        print('No image selected');
      }
    });
  }

  // Method to upload image to Firebase Storage and add service to Firestore
  Future<void> _addService() async {
      ServiceFirestore serviceFirestore = ServiceFirestore();
    try {
      if (_servicePhoto != null) {
        String fileName = Path.basename(_servicePhoto!.path);
        Reference ref = FirebaseStorage.instance.ref().child('service_photos/$fileName');
        UploadTask uploadTask = ref.putFile(_servicePhoto!);
        await uploadTask.whenComplete(() async {
          String photoURL = await ref.getDownloadURL();
          String serviceName = _serviceNameController.text.trim();
          String serviceDescription = _serviceDescriptionController.text.trim();
          int serviceDuration = int.tryParse(_serviceDurationController.text.trim()) ?? 0;
          double servicePrice = double.tryParse(_servicePriceController.text.trim()) ?? 0.0;
        
          Service service = Service(id: "",name: serviceName,description: serviceDescription,photo: photoURL,duration: serviceDuration,price: servicePrice);
          await serviceFirestore.addService(service);
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Service added successfully'),
          ));
          // Clear the text fields and reset the image after adding the service
          _clearTextFields();
          Navigator.pushNamed(context, "/manager_service_page");
        });
      } 
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Error adding service: $error'),
      ));
    }
  }

  // Method to clear all text fields and reset the image
  void _clearTextFields() {
    _serviceNameController.clear();
    _serviceDescriptionController.clear();
    _servicePhoto = null;
    _serviceDurationController.clear();
    _servicePriceController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Service'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _serviceNameController,
              decoration: InputDecoration(labelText: 'Service Name'),
            ),
            TextField(
              controller: _serviceDescriptionController,
              decoration: InputDecoration(labelText: 'Service Description'),
            ),
            
            
             
            
            TextField(
              controller: _serviceDurationController,
              decoration: InputDecoration(labelText: 'Service Duration'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _servicePriceController,
              decoration: InputDecoration(labelText: 'Service Price'),
              keyboardType: TextInputType.number,
            ),
              _servicePhoto != null
                  ? Image.file(
                      _servicePhoto!,
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    )
                  :
               
                  
              TextButton(
                onPressed: _pickImage,
                child: Text('Select Image'),
                
              ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _addService,
              child: Text('Add Service'),
            ),
          ],
        ),
      ),
    );
  }
}
