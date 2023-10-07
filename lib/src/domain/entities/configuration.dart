import 'package:equatable/equatable.dart';
import 'package:sensors_monitoring/src/domain/entities/sensor.dart';

class Configuration extends Equatable {
  final int id;
  final String title;
  final List<Sensor> sensors;

  @override
  List<Object?> get props => [id];

  const Configuration({
    required this.id,
    required this.title,
    required this.sensors,
  });
}
