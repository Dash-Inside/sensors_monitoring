import 'package:equatable/equatable.dart';
import 'package:sensors_monitoring/core/enums/notification_type.dart';
import 'package:sensors_monitoring/src/domain/entities/sensor.dart';

class Notification extends Equatable {
  final int id;
  final String title;
  final NotificationType type;
  //appears when a message appears
  final String message;
  //what to do if this happens
  final String action;
  final Sensor sensor;
  final double? minValue;
  final double? maxValue;
  final double? concreteValue;
  final DateTime? notifyTime;

  @override
  List<Object?> get props => [id];

  const Notification({
    required this.id,
    required this.title,
    required this.type,
    required this.message,
    required this.action,
    required this.sensor,
    required this.minValue,
    required this.maxValue,
    required this.concreteValue,
    required this.notifyTime,
  });
}
