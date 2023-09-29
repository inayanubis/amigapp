import 'package:flutter/material.dart';

class ControlWidget extends StatelessWidget {
  const ControlWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton.icon(onPressed: () {}, icon: const Icon(Icons.arrow_upward), label: const Text('Up')),
        Row(
          children: [
            ElevatedButton.icon(onPressed: () {}, icon: const Icon(Icons.arrow_left), label: const Text('Left')),
            const SizedBox(width: 16),
            ElevatedButton.icon(onPressed: () {}, icon: const Icon(Icons.arrow_right), label: const Text('Right')),
          ],
        ),
        ElevatedButton.icon(onPressed: () {}, icon: const Icon(Icons.arrow_downward), label: const Text('Down')),
      ],
    );
  }
}
