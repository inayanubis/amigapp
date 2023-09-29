import 'package:amigapp/repository/amiga_repository.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:injector/injector.dart';

class SpeedChartWidget extends StatelessWidget {
  final double height;

  const SpeedChartWidget({required this.height, super.key});

  @override
  Widget build(BuildContext context) {
    final amigaRepository = Injector.appInstance.get<AmigaRepository>();

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: height,
          child: AspectRatio(
            aspectRatio: 3,
            child: StreamBuilder(
                stream: amigaRepository.getSpeedTrack(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) return const Center(child: Text('...'));
                  if (snapshot.hasError) return const Text('Something went wrong');
                  return LineChart(
                    LineChartData(
                      borderData: FlBorderData(show: false),
                      titlesData: FlTitlesData(
                          bottomTitles: AxisTitles(
                            axisNameSize: 50,
                            axisNameWidget: const Text('Time'),
                            sideTitles: _timeTitles,
                          ),
                          topTitles: const AxisTitles(),
                          rightTitles: const AxisTitles(),
                          leftTitles: AxisTitles(
                            axisNameSize: 50,
                            axisNameWidget: const Text('Speed'),
                            sideTitles: _speedTitles,
                          )),
                      lineBarsData: [
                        LineChartBarData(
                          spots: snapshot.data!
                              .map((value) =>
                                  FlSpot(value.timeFromBegining.inSeconds.toDouble(), value.speed.toDouble()))
                              .toList(),
                          gradient: LinearGradient(
                            colors: [Theme.of(context).colorScheme.primary, Theme.of(context).colorScheme.tertiary],
                            stops: const [0.1, 1.0],
                          ),
                          barWidth: 2,
                          isCurved: false,
                          dotData: const FlDotData(
                            show: false,
                          ),
                        ),
                      ],
                    ),
                    duration: const Duration(milliseconds: 400),
                  );
                }),
          ),
        ),
        Text(
          'Speed metrics',
          style: Theme.of(context).textTheme.displaySmall,
        ),
      ],
    );
  }

  SideTitles get _timeTitles => SideTitles(
        showTitles: true,
        getTitlesWidget: (value, meta) {
          return Text('${meta.formattedValue} s.');
        },
      );

  SideTitles get _speedTitles => SideTitles(
        showTitles: true,
        reservedSize: 80,
        getTitlesWidget: (value, meta) {
          String text = '';
          switch (value.toInt()) {
            case 0:
              text = '0';
              break;
            case 5:
              text = '5 Km/h';
              break;
            case 10:
              text = '10 Km/h';
              break;
            case 15:
              text = '15 Km/h';
              break;
            case 20:
              text = '20 Km/h';
              break;
            case 25:
              text = '25 Km/h';
              break;
            case 30:
              text = '30 Km/h';
              break;
            case 35:
              text = '35 Km/h';
              break;
            case 40:
              text = '40 Km/h';
              break;
          }

          return Text(text);
        },
      );
}
