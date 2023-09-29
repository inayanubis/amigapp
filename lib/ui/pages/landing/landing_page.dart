import 'package:amigapp/ui/pages/home/home_page.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'Welcome to Amiga Dashboard',
            style: Theme.of(context).textTheme.displayLarge,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset('assets/img/logo_lleida.png', scale: 8),
              Image.asset('assets/img/logo_spain.png', scale: 8),
              Image.asset('assets/img/logo_amiga.png', scale: 10),
            ],
          ),
          SizedBox(
            height: 100,
            width: 250,
            child: FilledButton(
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const HomePage())),
              child: Text('Start', style: Theme.of(context).textTheme.displayMedium?.copyWith(color: Colors.white),),
            ),
          ),
        ],
      ),
    );
  }
}
