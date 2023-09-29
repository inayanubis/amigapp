import 'package:amigapp/repository/amiga_repository.dart';
import 'package:flutter/material.dart';
import 'package:injector/injector.dart';
import 'package:signal_strength_indicator/signal_strength_indicator.dart';

class GpsSignalWidget extends StatelessWidget {
  const GpsSignalWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final amigaRepository = Injector.appInstance.get<AmigaRepository>();
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        StreamBuilder<double>(
            stream: amigaRepository.getGpsSignalStatus(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) return const Center(child: Text('...'));
              if (snapshot.hasError) return const Text('Error connecting GPS');

              return SignalStrengthIndicator.sector(
                value: snapshot.data ?? 0,
                size: 150,
                barCount: 5,
                spacing: 0.5,
                activeColor: Theme.of(context).colorScheme.primary,
              );
            }),
        Text(
          'GPS Signal',
          style: Theme.of(context).textTheme.displaySmall,
        )
      ],
    );
  }
}
