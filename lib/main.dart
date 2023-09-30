import 'package:amigapp/repository/amiga_repository.dart';
import 'package:amigapp/ui/pages/home/home_page.dart';
import 'package:amigapp/ui/pages/landing/landing_page.dart';
import 'package:amigapp/ui/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:injector/injector.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized(); //comprovació per a renderitzar
  Injector.appInstance.registerSingleton<AmigaRepository>(() => AmigaRepository());
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft, //forçar l'orientació horitzontal de la pagina
  ]).then((value) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.lightColorScheme, //tema personalitzat de la app
      darkTheme: AppTheme.darkColorScheme,
      home: const LandingPage(), //primera pagina que es renderitza
      onGenerateRoute: (settings) { //metode de navegacio per apps més grans
        switch (settings.name) {
          case '/home':
            return MaterialPageRoute(builder: (_) => const HomePage());
          default:
            return null;
        }
      },
    );
  }
}
