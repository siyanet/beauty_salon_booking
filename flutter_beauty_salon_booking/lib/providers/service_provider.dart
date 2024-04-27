import 'package:flutter/material.dart';
import 'package:flutter_beauty_salon_booking/models/services_model.dart';
import 'package:flutter_beauty_salon_booking/services/services_firestore_service.dart';

class ServiceProvider extends ChangeNotifier {
  final ServiceFirestore serviceFirestore = ServiceFirestore();

  List<Service> _allServices = [];
  Service ? _serviceById ;
  List<Service> _servicesByListIds = [];

  List<Service> get allServices => _allServices;
Service ? get serviceById => _serviceById;
  List<Service> get servicesByListIds => _servicesByListIds;

  ServiceProvider() {
    _initializeServices();
  }

  Future<void> _initializeServices() async {
    await setAllServices();
    notifyListeners();
  }

  Future<void> setAllServices() async {
    serviceFirestore.getAllServicesStream().listen((services) {
      _allServices = services;
      notifyListeners();
    });
  }

  Future<void> setServiceById(String serviceId) async {
    serviceFirestore.getServiceByIdStream(serviceId).listen((services) {
      _serviceById = services;
      notifyListeners();
    });
  }

  Future<void> setServicesByListIds(List<String> serviceIds) async {
    serviceFirestore.getServicesByListIdsStream(serviceIds).listen((services) {
      _servicesByListIds = services;
      notifyListeners();
    });
  }
}
