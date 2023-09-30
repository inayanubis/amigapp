import 'package:amigapp/ui/pages/home/home_page.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {  //return de la pagina de benvinguda
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [  //child si només hi ha un widget, children si hi ha més d'un
          Text(
            'Welcome to Amiga Dashboard',
            style: Theme.of(context).textTheme.displayLarge,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset('assets/img/logo_lleida.png', scale: 8), //configurar els assets al pubspec.yaml a l'apartat flutter/assets
              Image.asset('assets/img/logo_spain.png', scale: 8),
              Image.asset('assets/img/logo_amiga.png', scale: 10)
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(  //limitar la mida del widget
                height: 80,
                width: 150,
                child: FilledButton(
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const HomePage())),
                  child: Text('Start', style: Theme.of(context).textTheme.displayMedium?.copyWith(color: Colors.white, fontSize: 20), ),
                ),
              ),
              SizedBox(
                height: 80,
                width: 150,
                child: FilledButton(
                  onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const HomePage())),
                  child: Text('Stop', style: Theme.of(context).textTheme.displayMedium?.copyWith(color: Colors.white, fontSize: 20),),
                ),
              )
            ],
          ),
          SizedBox(
            height: 80,
            width: 150,
            child: FilledButton(
              onPressed: () => Navigator.of(context).pushNamed('/home'), //metode de navegacio per apps més grans
              child: Text('Cancel', style: Theme.of(context).textTheme.displayMedium?.copyWith(color: Colors.white, fontSize: 20),),
            ),
          )
          
        ],
      ),
    );
  }
}
