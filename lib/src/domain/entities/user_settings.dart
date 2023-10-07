import 'package:equatable/equatable.dart';
import 'package:sensors_monitoring/src/domain/entities/notification.dart';

class UserSettings extends Equatable {
  final List<Notification> notifications;

  @override
  List<Object?> get props => [notifications];

  const UserSettings({
    required this.notifications,
  });
}
