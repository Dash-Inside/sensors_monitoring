import 'package:equatable/equatable.dart';
import 'package:sensors_monitoring/core/enums/sensor_type.dart';

class Sensor extends Equatable {
  final int id;
  final String name;
  final SensorType type;
  final String details;
  final List<double> values;

  @override
  List<Object?> get props => [id];

  const Sensor({
    required this.id,
    required this.name,
    required this.type,
    required this.details,
    required this.values,
  });
}
