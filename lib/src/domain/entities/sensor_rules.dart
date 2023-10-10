abstract class SensorRules {
  final String id;
  final String sensorId;
  final double value;

  SensorRules({
    required this.id,
    required this.sensorId,
    required this.value,
  });
}

class MoreThenRule extends SensorRules {
  MoreThenRule({
    required super.value,
    required super.sensorId,
    required super.id,
  });
}

class LessThenRule extends SensorRules {
  LessThenRule({
    required super.value,
    required super.sensorId,
    required super.id,
  });
}

class MoreOrEqualThenRule extends SensorRules {
  MoreOrEqualThenRule({
    required super.value,
    required super.sensorId,
    required super.id,
  });
}

class LessOrEqualThenRule extends SensorRules {
  LessOrEqualThenRule({
    required super.value,
    required super.sensorId,
    required super.id,
  });
}

class EqualRule extends SensorRules {
  EqualRule({
    required super.value,
    required super.sensorId,
    required super.id,
  });
}

class NotEqualRule extends SensorRules {
  NotEqualRule({
    required super.value,
    required super.sensorId,
    required super.id,
  });
}
