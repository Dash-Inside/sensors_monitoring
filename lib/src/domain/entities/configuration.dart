import 'package:equatable/equatable.dart';

class Configuration extends Equatable {
  final String id;
  final String title;
  final List<String> sensorsId;
  final List<String> graphicsId;
  @override
  List<Object?> get props => [id];

  const Configuration({
    required this.id,
    required this.title,
    required this.sensorsId,
    required this.graphicsId,
  });
}
