import 'package:amigapp/repository/amiga_repository.dart';
import 'package:amigapp/ui/pages/home/widgets/battery_status_widget.dart';
import 'package:amigapp/ui/pages/home/widgets/camera_widget.dart';
import 'package:amigapp/ui/pages/home/widgets/control_widget.dart';
import 'package:amigapp/ui/pages/home/widgets/gps_signal_widget.dart';
import 'package:amigapp/ui/pages/home/widgets/motor_mode_widget.dart';
import 'package:amigapp/ui/pages/home/widgets/speed_chart_widget.dart';
import 'package:flutter/material.dart';
import 'package:injector/injector.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final amigaRepository = Injector.appInstance.get<AmigaRepository>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Amiga Dashboard'), //es poden ficar iconos, widgets, el que vulguis (Icon(Icons."el nom del widget"))
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: StreamBuilder<bool>(
              stream: amigaRepository.getPowerStatus(),
              builder: (context, value) => IconButton.filled(  //IconButton te una propietat que es isSelected, que es un boolean, i si es true, el boto es queda apretat
                iconSize: 32,
                onPressed: () => amigaRepository.switchPower(),
                icon: const Icon(Icons.power_settings_new),
                isSelected: value.data,
              ),
            ),
          ),
        ],
      ),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CameraWidget(cameraNumber: 0),
              CameraWidget(cameraNumber: 1),
            ],
          ),
          SizedBox(
            height: 250,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SpeedChartWidget(height: 200),
                BatteryStatusWidget(),
                GpsSignalWidget(),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MotorModeWidget(),
              SizedBox(width: 100),
              ControlWidget(),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.help_outline),
      ),
    );
  }
}
