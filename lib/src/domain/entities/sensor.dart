import 'package:equatable/equatable.dart';
import 'package:sensors_monitoring/src/domain/entities/enums/sensor_type.dart';

class Sensor extends Equatable {
  final String id;
  final String name;
  final SensorType type;
  final SensorApi api;
  @override
  List<Object?> get props => [id];

  const Sensor({
    required this.id,
    required this.name,
    required this.type,
    required this.api,
  });
}
