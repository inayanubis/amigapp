import 'package:amigapp/repository/amiga_repository.dart';
import 'package:amigapp/ui/pages/landing/landing_page.dart';
import 'package:amigapp/ui/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:injector/injector.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Injector.appInstance.registerSingleton<AmigaRepository>(() => AmigaRepository());
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
  ]).then((value) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.lightColorScheme,
      darkTheme: AppTheme.darkColorScheme,
      home: const LandingPage(),
    );
  }
}
