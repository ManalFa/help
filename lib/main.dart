import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:projet1/app_localizations.dart';
import 'package:projet1/ui/authentification.dart';
import "package:firebase_core/firebase_core.dart";
import 'package:projet1/ui/homeScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

DatabaseReference reference =
    FirebaseDatabase.instance.reference().child("nums");
DatabaseReference usersRef =
    FirebaseDatabase.instance.reference().child("utilisateurs");
DatabaseReference localAdres =
    FirebaseDatabase.instance.reference().child("localisation");
TextEditingController paysField = TextEditingController();
TextEditingController villeField = TextEditingController();
String newkey;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  var email = preferences.getString("email");

  runApp(MaterialApp(
    theme: ThemeData(
      dividerTheme: DividerThemeData(space: 20, thickness: 1.5),
    ),
    supportedLocales: [
      Locale('fr', 'FR'),
      Locale('en', 'US'),
      Locale('es', 'ES'),
    ],
    localizationsDelegates: [
      AppLocalizations.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ],
    localeResolutionCallback: (locale, supportedLocales) {
      for (var supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode) {
          return supportedLocale;
        }
      }

      return supportedLocales.first;
    },
    home: email == null ? Authentification() : HomeScreen(),
  ));
}
