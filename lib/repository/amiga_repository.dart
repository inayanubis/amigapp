import 'dart:async';
import 'dart:math';

import 'package:amigapp/entity/motor_mode_enum.dart';
import 'package:amigapp/entity/speed_record.dart';

class AmigaRepository {
  bool _isPowerOn = false;
  MotorMode _motorMode = MotorMode.stopped;

  Stream<bool> getPowerStatus() async* {
    while (true) {
      yield _isPowerOn; //yield es com el return però per a streams, retorna el valor i continua amb el codi
      await Future.delayed(const Duration(seconds: 2));
    }
  }

  Future switchPower() async {
    _isPowerOn = !_isPowerOn;
  }

  Stream<MotorMode> getMotorMode() async* {
    while (true) {
      if (_isPowerOn) {
        yield _motorMode;
      }
      await Future.delayed(const Duration(seconds: 2));
    }
  }

  Future setMotorMode(MotorMode mode) async {
    _motorMode = mode;
  }

  Stream<double> getBattery() async* {
    double battery = 1;
    while (battery > 0) {
      if (_isPowerOn) {
        battery = battery - 0.001;
        yield battery;
      }
      await Future.delayed(const Duration(seconds: 2));
    }
  }

  Stream<List<SpeedRecord>> getSpeedTrack() async* {
    final List<SpeedRecord> records = [];
    final DateTime startMoment = DateTime.now();
    while (true) {
      if (_isPowerOn) {
        yield records
          ..add(
              SpeedRecord(speed: Random().nextInt(30) + 10, timeFromBegining: DateTime.now().difference(startMoment)));
      }
      await Future.delayed(const Duration(seconds: 5));
    }
  }

  Stream<double> getGpsSignalStatus() async* {
    while (true) {
      if (_isPowerOn) {
        yield Random().nextDouble();
      }
      await Future.delayed(const Duration(seconds: 5));
    }
  }

  Future<String> getCameraVideo(int cameraNumber) async {
    await Future.delayed(const Duration(seconds: 5));
    switch (cameraNumber) {
      case 0:
        return 'SUVDeoa6ZOE';
      case 1:
        return 'Sd1Eof0o0FI';
      default:
        return 'Sd1Eof0o0FI';
    }
  }
}
