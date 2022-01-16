import 'package:flutter/material.dart';
import 'package:projet1/app_localizations.dart';
import 'package:projet1/ui/childWidget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  Widget childWidget = ChildWidget(
    number: AvailableNumber.First,
  );
  @override
  void initState() {
    super.initState();
    setState(() {
      HomeScreen();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: new BottomNavigationBar(
        selectedItemColor: Colors.red,
        backgroundColor: Color.fromRGBO(130, 224, 236, 1),
        currentIndex: currentIndex,
        onTap: (value) {
          currentIndex = value;

          switch (value) {
            case 0:
              childWidget = ChildWidget(number: AvailableNumber.First);
              break;
            case 1:
              childWidget = ChildWidget(number: AvailableNumber.Second);
              break;
            case 2:
              childWidget = ChildWidget(number: AvailableNumber.Third);
              break;
          }

          setState(() {});
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: AppLocalizations.of(context).translate('quatre_string')),
          BottomNavigationBarItem(
              icon: Icon(Icons.error),
              label: AppLocalizations.of(context).translate('cinq_string')),
          BottomNavigationBarItem(
              icon: Icon(Icons.integration_instructions_sharp),
              label: AppLocalizations.of(context).translate('six_string'))
        ],
      ),
      body: SafeArea(
        child: childWidget,
      ),
    );
  }
}
