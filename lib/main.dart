import 'package:flutter/material.dart';
import 'package:sensors_monitoring/core/services/services.dart';
import 'package:sensors_monitoring/src/presentation/service_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  servicesInit();

  runApp(const ServiceApp());
}
