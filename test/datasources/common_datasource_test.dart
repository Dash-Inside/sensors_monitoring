// ignore_for_file: prefer_function_declarations_over_variables, unnecessary_non_null_assertion

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:postgres/postgres.dart';
import 'package:sensors_monitoring/core/services/services.dart';
import 'package:sensors_monitoring/src/data/datasources/common_datasource.dart';
import 'package:sensors_monitoring/src/data/models/configs_model.dart';
import 'package:sensors_monitoring/src/data/models/enum/sensor_type.dart';
import 'package:sensors_monitoring/src/data/models/sensors_model.dart';
import 'package:sensors_monitoring/src/data/models/tabs_model.dart';

void main() async {
  await servicesInit();

  Future<PostgreSQLResult> clearTables() async => await PostgresModule.postgreSQLConnection.query('DELETE FROM configs;');

  final CommonDatasource commonDatasource = services<CommonDatasource>();

  group('Common datasource', () {
    group('configs:', () {
      test('insert config correct call test', () async {
        // Act
        await clearTables();
        final Future<Unit?> Function() insertConfigs = () async {
          try {
            return await commonDatasource.insertConfigs(title: 'test_call');
          } catch (_) {
            return null;
          }
        };
        // Arrange
        final Unit? resultOrNull = await insertConfigs();
        // Assert
        expect(resultOrNull, unit);
      });
      group('select all configs', () {
        test('correct call test with empty request', () async {
          // Act
          await clearTables();
          // Arrange
          final List<ConfigModel>? resultOrNull = await commonDatasource.selectAllConfigs();
          // Assert
          expect(resultOrNull, null);
        });
        test('correct call test', () async {
          // Act
          await clearTables();
          final List<String> correctResultTitles = [
            'test call 1',
            'test call 2',
          ];
          // Arrange
          await commonDatasource.insertConfigs(title: correctResultTitles.first);
          await commonDatasource.insertConfigs(title: correctResultTitles.last);
          final List<String>? resultTitlesOrNull = (await commonDatasource.selectAllConfigs())?.map((e) => e.title).toList();
          // Assert
          expect(resultTitlesOrNull, correctResultTitles);
        });
      });
      group('select one config by id', () {
        test('correct call test with empty request', () async {
          // Act
          await clearTables();
          // Arrange
          final ConfigModel? resultOrNull = await commonDatasource.selectOneConfigsById(id: 'eeeeeeee-eeee-eeee-eeee-eeeeeeeeeeee');
          // Assert
          expect(resultOrNull, null);
        });
        test('correct call test', () async {
          // Act
          await clearTables();

          final String correctTitle = 'test call';
          await commonDatasource.insertConfigs(title: correctTitle);
          // Arrange
          final String? configId = (await commonDatasource.selectAllConfigs())?.first.id;
          final ConfigModel? resultOrNull = await commonDatasource.selectOneConfigsById(id: configId!);
          // Assert
          expect(resultOrNull?.title, correctTitle);
        });
        test('incorrect call test', () async {
          // Act
          await clearTables();
          Future<Either<Unit, ConfigModel?>> Function() selectOneConfigById = () async {
            try {
              return Right(await commonDatasource.selectOneConfigsById(id: 'e'));
            } catch (_) {
              return Left(unit);
            }
          };
          // Arrange
          final Either<Unit, ConfigModel?> resultOrLeft = await selectOneConfigById();
          // Assert
          expect(resultOrLeft.isLeft(), true);
        });
      });

      group('update config', () {
        test('correct call test', () async {
          // Act
          await clearTables();
          final String correctTitle = 'test call';
          await commonDatasource.insertConfigs(title: 'test');
          final Future<Unit?> Function() updateConfigs = () async {
            try {
              final String? id = (await commonDatasource.selectAllConfigs())?.first.id;
              return await commonDatasource.updateConfigs(
                id: id!,
                title: correctTitle,
              );
            } catch (_) {
              return null;
            }
          };
          // Arrange
          final Unit? resultOrNull = await updateConfigs();
          final String? resultTitleOrNull = (await commonDatasource.selectAllConfigs())?.first.title;
          // Assert
          expect(resultOrNull, unit);
          expect(resultTitleOrNull, correctTitle);
        });
        test('incorrect call test', () async {
          // Act
          await clearTables();
          Future<Either<Unit, Unit?>> Function() updateConfig = () async {
            try {
              return Right(await commonDatasource.updateConfigs(
                id: 'e',
                title: 'test',
              ));
            } catch (_) {
              return Left(unit);
            }
          };
          // Arrange
          final Either<Unit, Unit?> resultOrLeft = await updateConfig();
          // Assert
          expect(resultOrLeft.isLeft(), true);
        });
      });
      group('delete config', () {
        test('correct call test', () async {
          // Act
          await clearTables();
          await commonDatasource.insertConfigs(title: 'test');
          final Future<Unit?> Function() deleteConfigs = () async {
            try {
              final String? configId = (await commonDatasource.selectAllConfigs())?.first.id;
              return await commonDatasource.deleteConfigs(id: configId!);
            } catch (_) {
              return null;
            }
          };
          // Arrange
          final Unit? resultOrNull = await deleteConfigs();
          // Assert
          expect(resultOrNull, unit);
        });
        test('incorrect call test', () async {
          // Act
          await clearTables();
          Future<Either<Unit, Unit?>> Function() deleteConfigs = () async {
            try {
              return Right(await commonDatasource.deleteConfigs(id: 'e'));
            } catch (_) {
              return Left(unit);
            }
          };
          // Arrange
          final Either<Unit, Unit?> resultOrLeft = await deleteConfigs();
          // Assert
          expect(resultOrLeft.isLeft(), true);
        });
      });
    });
    group('tabs:', () {
      group('insert tab', () {
        test('correct call test', () async {
          // Act
          await clearTables();
          final Future<Unit?> Function() insertTab = () async {
            try {
              await commonDatasource.insertConfigs(title: 'config');
              final String? configId = (await commonDatasource.selectAllConfigs())?.first.id;
              return await commonDatasource.insertTabs(
                configId: configId!,
                title: 'test_tab',
              );
            } catch (_) {
              return null;
            }
          };
          // Arrange
          final Unit? resultOrNull = await insertTab();
          // Assert
          expect(resultOrNull, unit);
        });
        test('incorrect call test', () async {
          // Act
          await clearTables();
          final Future<Either<Unit, Unit?>> Function() insertTab = () async {
            try {
              return Right(
                await commonDatasource.insertTabs(
                  configId: 'e',
                  title: 'test_tab',
                ),
              );
            } catch (_) {
              return Left(unit);
            }
          };
          // Arrange
          final Either<Unit, Unit?> resultOrNull = await insertTab();
          // Assert
          expect(resultOrNull.isLeft(), true);
        });
      });
      group('select all tabs', () {
        test('correct call test with empty request', () async {
          // Act
          await clearTables();
          // Arrange
          final List<TabsModel>? resultOrNull = await commonDatasource.selectAllTabs();
          // Assert
          expect(resultOrNull, null);
        });
        test('correct call test', () async {
          // Act
          await clearTables();
          await commonDatasource.insertConfigs(title: 'config1');
          await commonDatasource.insertConfigs(title: 'config2');

          final List<String>? configsId = (await commonDatasource.selectAllConfigs())?.map((e) => e.id).toList();
          final List<String> correctResultTitles = [
            'tab1',
            'tab2',
          ];

          await commonDatasource.insertTabs(
            configId: configsId!.first,
            title: correctResultTitles.first,
          );
          await commonDatasource.insertTabs(
            configId: configsId!.last,
            title: correctResultTitles.last,
          );
          // Arrange
          final List<String>? resultTitlesOrNull = (await commonDatasource.selectAllTabs())?.map((e) => e.title).toList();
          // Assert
          expect(resultTitlesOrNull, correctResultTitles);
        });
      });
      group('select all tabs by config id', () {
        test('correct call test with empty request', () async {
          // Act
          await clearTables();
          await commonDatasource.insertConfigs(title: 'config1');
          final String? configId = (await commonDatasource.selectAllConfigs())?.first.id;
          // Arrange
          final List<TabsModel>? resultOrNull = await commonDatasource.selectAllTabsByConfigId(configId: configId!);
          // Assert
          expect(resultOrNull, null);
        });
        test('correct call test', () async {
          // Act
          await clearTables();
          await commonDatasource.insertConfigs(title: 'config1');
          await commonDatasource.insertConfigs(title: 'config2');

          final List<String>? configsId = (await commonDatasource.selectAllConfigs())?.map((e) => e.id).toList();
          final List<String> correctResultTitles = [
            'tab1',
            'tab2',
            'tab3',
          ];

          await commonDatasource.insertTabs(
            configId: configsId!.first,
            title: correctResultTitles[0],
          );
          await commonDatasource.insertTabs(
            configId: configsId!.first,
            title: correctResultTitles[1],
          );
          await commonDatasource.insertTabs(
            configId: configsId!.last,
            title: correctResultTitles[2],
          );
          // Arrange
          final List<String>? resultTitlesOrNullByFisrtConfigId = (await commonDatasource.selectAllTabsByConfigId(configId: configsId!.first))?.map((e) => e.title).toList();
          final List<String>? resultTitlesOrNullByLastConfigId = (await commonDatasource.selectAllTabsByConfigId(configId: configsId!.last))?.map((e) => e.title).toList();
          // Assert
          expect(resultTitlesOrNullByFisrtConfigId, correctResultTitles.sublist(0, 2));
          expect(resultTitlesOrNullByLastConfigId, correctResultTitles.sublist(2));
        });
        test('incorrect call test', () async {
          // Act
          await clearTables();
          Future<Either<Unit, List<TabsModel>?>> Function() selectAllTabsByConfigId = () async {
            try {
              return Right(await commonDatasource.selectAllTabsByConfigId(configId: 'e'));
            } catch (_) {
              return Left(unit);
            }
          };
          // Arrange
          final Either<Unit, List<TabsModel>?> resultOrLeft = await selectAllTabsByConfigId();
          // Assert
          expect(resultOrLeft.isLeft(), true);
        });
      });
      group('select one tab by id', () {
        test('correct call test with empty request', () async {
          // Act
          await clearTables();
          // Arrange
          final TabsModel? resultOrNull = await commonDatasource.selectOneTabsById(id: 'eeeeeeee-eeee-eeee-eeee-eeeeeeeeeeee');
          // Assert
          expect(resultOrNull, null);
        });
        test('correct call test', () async {
          // Act
          await clearTables();
          final String correctTitle = 'tab_test';
          await commonDatasource.insertConfigs(title: 'config');
          final String? configId = (await commonDatasource.selectAllConfigs())?.first.id;
          await commonDatasource.insertTabs(
            configId: configId!,
            title: correctTitle,
          );
          final String? tabId = (await commonDatasource.selectAllTabs())?.first.id;

          // Arrange
          final TabsModel? resultOrNull = await commonDatasource.selectOneTabsById(id: tabId!);
          // Assert
          expect(resultOrNull?.title, correctTitle);
        });
        test('incorrect call test', () async {
          // Act
          await clearTables();
          Future<Either<Unit, TabsModel?>> Function() selectOneTabsById = () async {
            try {
              return Right(await commonDatasource.selectOneTabsById(id: 'e'));
            } catch (_) {
              return Left(unit);
            }
          };
          // Arrange
          final Either<Unit, TabsModel?> resultOrLeft = await selectOneTabsById();
          // Assert
          expect(resultOrLeft.isLeft(), true);
        });
      });
      group('update tab', () {
        test('correct call test', () async {
          // Act
          await clearTables();
          final String correctTitle = 'tab_updated';

          final Future<Unit?> Function() updateTabs = () async {
            try {
              await commonDatasource.insertConfigs(title: 'config');
              final String? configId = (await commonDatasource.selectAllConfigs())?.first.id;
              await commonDatasource.insertTabs(
                configId: configId!,
                title: 'tab',
              );
              final String? tabId = (await commonDatasource.selectAllTabs())?.first.id;

              return await commonDatasource.updateTabs(
                id: tabId!,
                title: correctTitle,
              );
            } catch (_) {
              return null;
            }
          };
          // Arrange
          final Unit? resultOrNull = await updateTabs();
          final String? resultTitleOrNull = (await commonDatasource.selectAllTabs())?.first.title;
          // Assert
          expect(resultOrNull, unit);
          expect(resultTitleOrNull, correctTitle);
        });
        test('incorrect call test', () async {
          // Act
          await clearTables();
          Future<Either<Unit, Unit?>> Function() updateTabs = () async {
            try {
              return Right(await commonDatasource.updateTabs(
                id: 'e',
                title: 'test',
              ));
            } catch (_) {
              return Left(unit);
            }
          };
          // Arrange
          final Either<Unit, Unit?> resultOrLeft = await updateTabs();
          // Assert
          expect(resultOrLeft.isLeft(), true);
        });
      });
      group('delete tab', () {
        test('correct call test', () async {
          // Act
          await clearTables();
          final Future<Unit?> Function() deleteTabs = () async {
            try {
              await commonDatasource.insertConfigs(title: 'config');
              final String? configId = (await commonDatasource.selectAllConfigs())?.first.id;
              await commonDatasource.insertTabs(
                configId: configId!,
                title: 'tab',
              );
              final String? tabId = (await commonDatasource.selectAllTabs())?.first.id;

              return await commonDatasource.deleteTabs(id: tabId!);
            } catch (_) {
              return null;
            }
          };
          // Arrange
          final Unit? resultOrNull = await deleteTabs();
          final List<TabsModel>? listTabs = await commonDatasource.selectAllTabs();
          // Assert
          expect(resultOrNull, unit);
          expect(listTabs, null);
        });
        test('incorrect call test', () async {
          // Act
          await clearTables();
          Future<Either<Unit, Unit?>> Function() deleteTabs = () async {
            try {
              return Right(await commonDatasource.deleteTabs(id: 'e'));
            } catch (_) {
              return Left(unit);
            }
          };
          // Arrange
          final Either<Unit, Unit?> resultOrLeft = await deleteTabs();
          // Assert
          expect(resultOrLeft.isLeft(), true);
        });
      });
    });
    group('sensors:', () {
      group('insert sensor', () {
        test('correct call test', () async {
          // Act
          await clearTables();
          final Future<Unit?> Function() insertSensors = () async {
            try {
              await commonDatasource.insertConfigs(title: 'config');
              final String? configId = (await commonDatasource.selectAllConfigs())?.first.id;
              return await commonDatasource.insertSensors(
                configId: configId!,
                title: 'test',
                sensorType: SensorType.humidity,
                details: 'test_details',
              );
            } catch (_) {
              return null;
            }
          };
          // Arrange
          final Unit? resultOrNull = await insertSensors();
          // Assert
          expect(resultOrNull, unit);
        });
        test('incorrect call test', () async {
          // Act
          await clearTables();
          final Future<Either<Unit, Unit?>> Function() insertSensors = () async {
            try {
              return Right(
                await commonDatasource.insertSensors(
                  configId: 'e',
                  title: 'test',
                  sensorType: SensorType.humidity,
                  details: 'test_details',
                ),
              );
            } catch (_) {
              return Left(unit);
            }
          };
          // Arrange
          final Either<Unit, Unit?> resultOrNull = await insertSensors();
          // Assert
          expect(resultOrNull.isLeft(), true);
        });
      });
      group('select all sensors', () {
        test('correct call test with empty request', () async {
          // Act
          await clearTables();
          // Arrange
          final List<SensorsModel>? resultOrNull = await commonDatasource.selectAllSensors();
          // Assert
          expect(resultOrNull, null);
        });
        test('correct call test', () async {
          // Act
          await clearTables();
          await commonDatasource.insertConfigs(title: 'config1');
          await commonDatasource.insertConfigs(title: 'config2');

          final List<String>? configsId = (await commonDatasource.selectAllConfigs())?.map((e) => e.id).toList();
          final List<String> correctResultTitles = [
            'sensor1',
            'sensor2',
          ];
          await commonDatasource.insertSensors(
            configId: configsId!.first,
            title: correctResultTitles.first,
            sensorType: SensorType.humidity,
            details: 'test_details',
          );
          await commonDatasource.insertSensors(
            configId: configsId!.last,
            title: correctResultTitles.last,
            sensorType: SensorType.temperature,
            details: 'test_details',
          );
          // Arrange
          final List<String>? resultTitlesOrNull = (await commonDatasource.selectAllSensors())?.map((e) => e.title).toList();
          // Assert
          expect(resultTitlesOrNull, correctResultTitles);
        });
      });
      group('select all sensors by config id', () {
        test('correct call test with empty request', () async {
          // Act
          await clearTables();
          await commonDatasource.insertConfigs(title: 'config1');
          final String? configId = (await commonDatasource.selectAllConfigs())?.first.id;
          // Arrange
          final List<SensorsModel>? resultOrNull = await commonDatasource.selectAllSensorsByConfigId(configId: configId!);
          // Assert
          expect(resultOrNull, null);
        });
        test('correct call test', () async {
          // Act
          await clearTables();
          await commonDatasource.insertConfigs(title: 'config1');
          await commonDatasource.insertConfigs(title: 'config2');

          final List<String>? configsId = (await commonDatasource.selectAllConfigs())?.map((e) => e.id).toList();
          final List<String> correctResultTitles = [
            'sensor1',
            'sensor2',
            'sensor3',
          ];
          await commonDatasource.insertSensors(
            configId: configsId!.first,
            title: correctResultTitles[0],
            sensorType: SensorType.humidity,
            details: 'test_details',
          );
          await commonDatasource.insertSensors(
            configId: configsId!.first,
            title: correctResultTitles[1],
            sensorType: SensorType.temperature,
            details: 'test_details',
          );
          await commonDatasource.insertSensors(
            configId: configsId!.last,
            title: correctResultTitles[2],
            sensorType: SensorType.temperature,
            details: 'test_details',
          );
          // Arrange
          final List<String>? resultTitlesOrNullByFisrtConfigId = (await commonDatasource.selectAllSensorsByConfigId(configId: configsId!.first))?.map((e) => e.title).toList();
          final List<String>? resultTitlesOrNullByLastConfigId = (await commonDatasource.selectAllSensorsByConfigId(configId: configsId!.last))?.map((e) => e.title).toList();
          // Assert
          expect(resultTitlesOrNullByFisrtConfigId, correctResultTitles.sublist(0, 2));
          expect(resultTitlesOrNullByLastConfigId, correctResultTitles.sublist(2));
        });
        test('incorrect call test', () async {
          // Act
          await clearTables();
          Future<Either<Unit, List<SensorsModel>?>> Function() selectAllSensorsByConfigId = () async {
            try {
              return Right(await commonDatasource.selectAllSensorsByConfigId(configId: 'e'));
            } catch (_) {
              return Left(unit);
            }
          };
          // Arrange
          final Either<Unit, List<SensorsModel>?> resultOrLeft = await selectAllSensorsByConfigId();
          // Assert
          expect(resultOrLeft.isLeft(), true);
        });
      });
      group('select one sensor by id', () {
        test('correct call test with empty request', () async {
          // Act
          await clearTables();
          // Arrange
          final SensorsModel? resultOrNull = await commonDatasource.selectOneSensorsById(id: 'eeeeeeee-eeee-eeee-eeee-eeeeeeeeeeee');
          // Assert
          expect(resultOrNull, null);
        });
        test('correct call test', () async {
          // Act
          await clearTables();
          final String correctTitle = 'sensor_test';
          await commonDatasource.insertConfigs(title: 'config');
          final String? configId = (await commonDatasource.selectAllConfigs())?.first.id;
          await commonDatasource.insertSensors(
            configId: configId!,
            title: correctTitle,
            sensorType: SensorType.temperature,
            details: 'test_details',
          );
          final String? sensorId = (await commonDatasource.selectAllSensors())?.first.id;

          // Arrange
          final SensorsModel? resultOrNull = await commonDatasource.selectOneSensorsById(id: sensorId!);
          // Assert
          expect(resultOrNull?.title, correctTitle);
        });
        test('incorrect call test', () async {
          // Act
          await clearTables();
          Future<Either<Unit, SensorsModel?>> Function() selectOneSensorsById = () async {
            try {
              return Right(await commonDatasource.selectOneSensorsById(id: 'e'));
            } catch (_) {
              return Left(unit);
            }
          };
          // Arrange
          final Either<Unit, SensorsModel?> resultOrLeft = await selectOneSensorsById();
          // Assert
          expect(resultOrLeft.isLeft(), true);
        });
      });
      group('update sensor', () {
        test('correct call test', () async {
          // Act
          await clearTables();
          final String correctTitle = 'sensor_updated';

          final Future<Unit?> Function() updateSensors = () async {
            try {
              await commonDatasource.insertConfigs(title: 'config');
              final String? configId = (await commonDatasource.selectAllConfigs())?.first.id;
              await commonDatasource.insertSensors(
                configId: configId!,
                title: 'sensor_test',
                sensorType: SensorType.humidity,
                details: 'test_details',
              );
              final String? sensorId = (await commonDatasource.selectAllSensors())?.first.id;

              return await commonDatasource.updateSensors(
                id: sensorId!,
                title: correctTitle,
              );
            } catch (_) {
              return null;
            }
          };
          // Arrange
          final Unit? resultOrNull = await updateSensors();
          final String? resultTitleOrNull = (await commonDatasource.selectAllSensors())?.first.title;
          // Assert
          expect(resultOrNull, unit);
          expect(resultTitleOrNull, correctTitle);
        });
        test('incorrect call test', () async {
          // Act
          await clearTables();
          Future<Either<Unit, Unit?>> Function() updateSensors = () async {
            try {
              return Right(await commonDatasource.updateSensors(
                id: 'e',
                title: 'test',
              ));
            } catch (_) {
              return Left(unit);
            }
          };
          // Arrange
          final Either<Unit, Unit?> resultOrLeft = await updateSensors();
          // Assert
          expect(resultOrLeft.isLeft(), true);
        });
      });
      group('delete sensor', () {
        test('correct call test', () async {
          // Act
          await clearTables();
          final Future<Unit?> Function() deleteSensors = () async {
            try {
              await commonDatasource.insertConfigs(title: 'config');
              final String? configId = (await commonDatasource.selectAllConfigs())?.first.id;
              await commonDatasource.insertSensors(
                configId: configId!,
                title: 'sensor_test',
                sensorType: SensorType.humidity,
                details: 'test_details',
              );
              final String? sensorId = (await commonDatasource.selectAllSensors())?.first.id;

              return await commonDatasource.deleteSensors(id: sensorId!);
            } catch (_) {
              return null;
            }
          };
          // Arrange
          final Unit? resultOrNull = await deleteSensors();
          final List<TabsModel>? listTabs = await commonDatasource.selectAllTabs();
          // Assert
          expect(resultOrNull, unit);
          expect(listTabs, null);
        });
        test('incorrect call test', () async {
          // Act
          await clearTables();
          Future<Either<Unit, Unit?>> Function() deleteSensors = () async {
            try {
              return Right(await commonDatasource.deleteSensors(id: 'e'));
            } catch (_) {
              return Left(unit);
            }
          };
          // Arrange
          final Either<Unit, Unit?> resultOrLeft = await deleteSensors();
          // Assert
          expect(resultOrLeft.isLeft(), true);
        });
      });
    });
  });
}