part of './common_datasource.dart';

extension AlertsDatasource on CommonDatasource {
  Future<List<AlertsModel>?> selectAllAlerts() async {
    try {
      final String query = await File('sql/model/alerts/select_all_alerts.sql').readAsString();
      final List<Map<String, Map<String, dynamic>>> request = await PostgresModule.postgreSQLConnection.mappedResultsQuery(query);
      final List<AlertsModel> result = [];

      if (request.isEmpty) {
        return null;
      }
      for (var e in request) {
        result.add(AlertsModel.fromMap(e['alerts']!));
      }
      return result;
    } catch (_) {
      rethrow;
    }
  }

  Future<AlertsModel?> selectOneAlerts({required String id}) async {
    try {
      final String query = await File('sql/model/alerts/select_one_alert.sql').readAsString();
      final List<Map<String, Map<String, dynamic>>> request = await PostgresModule.postgreSQLConnection.mappedResultsQuery(
        query,
        substitutionValues: {
          'id': id,
        },
      );

      if (request.isEmpty) {
        return null;
      }

      return AlertsModel.fromMap(request.first['alerts']!);
    } catch (_) {
      rethrow;
    }
  }

  Future<AlertsModel?> selectAlertByRuleId({required String ruleId}) async {
    try {
      final String query = await File('sql/model/alerts/select_alert_by_rule_id.sql').readAsString();
      final List<Map<String, Map<String, dynamic>>> request = await PostgresModule.postgreSQLConnection.mappedResultsQuery(query, substitutionValues: {
        'rule_id': ruleId,
      });

      if (request.isEmpty) {
        return null;
      }

      return AlertsModel.fromMap(request.first['alerts']!);
    } catch (_) {
      rethrow;
    }
  }

  Future<AlertsModel?> selectAlertBySensorId({required String sensorId}) async {
    try {
      final String query = await File('sql/model/alerts/select_alert_by_sensor_id.sql').readAsString();
      final List<Map<String, Map<String, dynamic>>> request = await PostgresModule.postgreSQLConnection.mappedResultsQuery(query, substitutionValues: {
        'sensor_id': sensorId,
      });

      if (request.isEmpty) {
        return null;
      }

      return AlertsModel.fromMap(request.first['alerts']!);
    } catch (_) {
      rethrow;
    }
  }

  Future<Unit> insertAlerts({
    required String sensorId,
    required String ruleId,
    required String message,
    required AlertType type,
  }) async {
    try {
      final String query = await File('sql/model/alerts/insert_alerts.sql').readAsString();
      await PostgresModule.postgreSQLConnection.mappedResultsQuery(
        query,
        substitutionValues: {
          'sensor_id': sensorId,
          'rule_id': ruleId,
          'message': message,
          'type': type.name,
        },
      );

      return unit;
    } catch (_) {
      rethrow;
    }
  }

  Future<Unit> updateAlerts({
    required String id,
    String? sensorId,
    String? ruleId,
    String? message,
    AlertType? type,
  }) async {
    try {
      final String query = await File('sql/model/alerts/update_alerts.sql').readAsString();
      await PostgresModule.postgreSQLConnection.mappedResultsQuery(
        query,
        substitutionValues: {
          'id': id,
          'sensor_id': sensorId,
          'rule_id': ruleId,
          'message': message,
          'type': type?.name,
        },
      );

      return unit;
    } catch (_) {
      rethrow;
    }
  }

  Future<Unit> deleteAlerts({required String id}) async {
    try {
      final String query = await File('sql/model/alerts/delete_alerts.sql').readAsString();
      await PostgresModule.postgreSQLConnection.mappedResultsQuery(
        query,
        substitutionValues: {
          'id': id,
        },
      );

      return unit;
    } catch (_) {
      rethrow;
    }
  }
}