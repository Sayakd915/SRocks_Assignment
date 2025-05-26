// viewmodels/service_viewmodel.dart
import 'package:flutter/material.dart';
import '../models/service.dart';
import '../services/firestore_service.dart';
import '../locator.dart';

class ServiceViewModel extends ChangeNotifier {
  final FirestoreService _firestoreService = locator<FirestoreService>();
  List<Service> _services = [];
  bool _isLoading = false;
  String? _errorMessage;

  List<Service> get services => _services;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> fetchServices() async {
    _isLoading = true;
    notifyListeners();

    try {
      final data = await _firestoreService.getServices();
      _services = data.map((map) => Service.fromMap(map)).toList();

      _services.sort((a, b) {
        const order = [
          'Music Production',
          'Mixing and Mastering',
          'Lyrics Writing',
          'Vocals',
        ];
        return order.indexOf(a.title).compareTo(order.indexOf(b.title));
      });

      _errorMessage = null;
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}