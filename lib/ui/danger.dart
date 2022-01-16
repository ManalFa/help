import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:projet1/app_localizations.dart';

import 'package:projet1/ui/zones.dart';
import 'package:projet1/main.dart';

class Danger extends StatefulWidget {
  @override
  _DangerState createState() => _DangerState();
}

class _DangerState extends State<Danger> {
  String pays, ville;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 180,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: FractionalOffset.topCenter,
                      end: FractionalOffset.bottomCenter,
                      colors: [
                        Color.fromRGBO(111, 224, 236, 1),
                        Color.fromRGBO(86, 110, 111, 1),
                      ]),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50.0),
                    bottomRight: Radius.circular(50.0),
                  ),
                ),
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: 150),
                  height: 70,
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(172, 187, 182, 1),
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  ),
                  child: Center(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        AppLocalizations.of(context).translate('22_string'),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'BellMTBold',
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 60, right: 30, left: 30, bottom: 30),
            child: TextFormField(
              controller: paysField,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                border: new OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(20.0),
                ),
                hintText: AppLocalizations.of(context).translate('23_string'),
                labelText: AppLocalizations.of(context).translate('23_string'),
                contentPadding: EdgeInsets.all(20.0),
                labelStyle: TextStyle(
                  color: Colors.black,
                ),
                hintStyle: TextStyle(color: Colors.black26),
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 30.0, right: 30.0, bottom: 30.0),
            child: TextFormField(
              controller: villeField,
              decoration: InputDecoration(
                border: new OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(20.0),
                ),
                hintText: AppLocalizations.of(context).translate('24_string'),
                labelText: AppLocalizations.of(context).translate('24_string'),
                contentPadding: EdgeInsets.all(20.0),
                labelStyle: TextStyle(
                  color: Colors.black,
                ),
                hintStyle: TextStyle(color: Colors.black26),
              ),
            ),
          ),
          Container(
            height: 60,
            margin: EdgeInsets.only(
                left: MediaQuery.of(context).size.width * 0.5, right: 30),
            width: MediaQuery.of(context).size.width * 0.5,
            decoration: BoxDecoration(
              color: Color.fromRGBO(111, 224, 236, 1),
              borderRadius: BorderRadius.all(Radius.circular(50.0)),
            ),
            child: MaterialButton(
              onPressed: () {
                if (paysField.text.isEmpty) {
                  Fluttertoast.showToast(
                      msg:
                          "${AppLocalizations.of(context).translate('79_string')}");
                } else if (villeField.text.isEmpty) {
                  Fluttertoast.showToast(
                      msg:
                          "${AppLocalizations.of(context).translate('80_string')}");
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Zone()),
                  );
                }
              },
              child: Text(
                AppLocalizations.of(context).translate('25_string'),
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 20,
                  fontFamily: 'BellMTBold',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
