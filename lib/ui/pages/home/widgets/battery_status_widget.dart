import 'package:amigapp/repository/amiga_repository.dart';
import 'package:flutter/material.dart';
import 'package:injector/injector.dart';

class BatteryStatusWidget extends StatelessWidget {
  const BatteryStatusWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final amigaRepository = Injector.appInstance.get<AmigaRepository>();
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: 150,
          width: 150,
          child: StreamBuilder<double>(
            stream: amigaRepository.getBattery(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) return const Center(child: Text('...'));

              return CircularProgressIndicator(
                value: snapshot.data,
                strokeWidth: 10,
                strokeCap: StrokeCap.round,
              );
            },
          ),
        ),
        StreamBuilder<double>(
          stream: amigaRepository.getBattery(),
          builder: (context, snapshot) => Text(
            'Battery ${snapshot.data != null ? '${(snapshot.data! * 100).truncate()}%' : ''}',
            style: Theme.of(context).textTheme.displaySmall,
          ),
        ),
      ],
    );
  }
}
