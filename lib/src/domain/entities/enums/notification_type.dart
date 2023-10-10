/*
Info: all expected events that are scheduled to be taken into account.

Warning: warning notification requiring user observation and control after 
which it is still possible to continue the operation of the object.

Error: Sensor failure.

Fatal: An event that requires truly immediate intervention.
*/

enum NotificationType {
  info,
  warning,
  error,
  fatal,
}
