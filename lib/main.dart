import 'package:flutter/material.dart';
import 'package:no_dowry/project_helper/constants.dart';
import 'package:no_dowry/screens/onboarding/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Constants.appName,
      supportedLocales: [Locale('en', 'US')],
      localizationsDelegates: [
//        const AppLocalizationsDelegate(),
//        GlobalMaterialLocalizations.delegate,
//        GlobalWidgetsLocalizations.delegate,
      ],
      theme: ThemeData(
          accentColor: Colors.white,
          primaryColor: Colors.white,
          primaryColorDark: Colors.white),
      home: SplashScreen(),
    );
  }
}
