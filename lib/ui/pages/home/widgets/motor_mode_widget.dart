import 'package:amigapp/entity/motor_mode_enum.dart';
import 'package:amigapp/repository/amiga_repository.dart';
import 'package:flutter/material.dart';
import 'package:injector/injector.dart';

class MotorModeWidget extends StatelessWidget {
  const MotorModeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final amigaRepository = Injector.appInstance.get<AmigaRepository>();
    return Column(
      children: [
        const Text('Motor mode'),
        const SizedBox(height: 8),
        StreamBuilder<MotorMode>(
          stream: amigaRepository.getMotorMode(),
          builder: (context, snapshot) => SegmentedButton<MotorMode>(
            segments: const [
              ButtonSegment(value: MotorMode.stopped, label: Text('Stop')),
              ButtonSegment(value: MotorMode.light, label: Text('Light')),
              ButtonSegment(value: MotorMode.medium, label: Text('Medium')),
              ButtonSegment(value: MotorMode.max, label: Text('Max')),
            ],
            selected: {snapshot.data ?? MotorMode.stopped},
            onSelectionChanged: (selected) => amigaRepository.setMotorMode(selected.first),
            emptySelectionAllowed: false,
            multiSelectionEnabled: false,
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.resolveWith((states) => Theme.of(context).colorScheme.inversePrimary),
            ),
          ),
        )
      ],
    );
  }
}
