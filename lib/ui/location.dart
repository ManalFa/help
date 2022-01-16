import 'package:projet1/app_localizations.dart';
import 'package:projet1/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoder/geocoder.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_sms/flutter_sms.dart';
import 'package:intl/intl.dart';

class Location extends StatefulWidget {
  const Location({Key key}) : super(key: key);

  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
  String latitude = " ";
  String longitude = " ";
  String pays;
  String ville;
  String avenue;
  // int i = 0;
  var now;
  var formatter = new DateFormat('yyyy-MM-dd');
  String date;
  var adresEnvoi;
  var nom;
  var prenom;
  Address address;
  var num;
  bool a = false;

  final User firebaseUser = FirebaseAuth.instance.currentUser;

  void launchCmd(command) async {
    if (await canLaunch(command)) {
      await launch(command);
    }
  }

  void _sendSms(String message, List<String> recepteur) async {
    String _result = await sendSMS(message: message, recipients: recepteur)
        .catchError((onError) {
      print("Erreur");
    });
    print(_result);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(86, 110, 111, 1),
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Flex(
            direction: Axis.vertical,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: FractionalOffset.topCenter,
                      end: FractionalOffset.bottomCenter,
                      colors: [
                        Color.fromRGBO(111, 224, 236, 1),
                        Color.fromRGBO(86, 110, 111, 1),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(240, 240, 240, 1),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                    ),
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        top: 110,
                      ),
                      child: Center(
                        child: Container(
                          height: 50,
                          width: 100,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(111, 224, 236, 1),
                            borderRadius:
                                BorderRadius.all(Radius.elliptical(100, 50)),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 50,
                      ),
                      child: Center(
                        child: Container(
                          height: 100,
                          child: Center(
                            child: Icon(
                              Icons.location_on,
                              size: 100,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 70,
                ),
                Container(
                  height: 60,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(111, 224, 236, 1),
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  child: MaterialButton(
                    onPressed: () {
                      getCurrentLocation();
                    },
                    minWidth: MediaQuery.of(context).size.width / 1.4,
                    child: Text(
                      AppLocalizations.of(context).translate('second_string'),
                      style: TextStyle(
                        color: Colors.black38,
                        fontSize: 20,
                        fontFamily: 'BellMTBold',
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 90,
                ),
                Container(
                  height: 60,
                  width: MediaQuery.of(context).size.width * 0.7,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(111, 224, 236, 1),
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  child: Container(
                    padding: EdgeInsets.only(
                      top: 15,
                    ),
                    child: Text(
                      AppLocalizations.of(context).translate('dix_string'),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black38,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'BellMTBold',
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: 60,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(158, 206, 207, 1),
                        offset: Offset(-2, -2),
                        blurRadius: 4,
                        spreadRadius: 6,
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  child: MaterialButton(
                    onPressed: () {
                      if (pays == null) {
                        Fluttertoast.showToast(
                            msg:
                                "${AppLocalizations.of(context).translate('78_string')}");
                      } else if (reference != null) {
                        reference
                            .child(pays)
                            .child("police")
                            .once()
                            .then((DataSnapshot snap) async {
                          if (snap != null) {
                            setState(() {
                              num = snap.value;
                              launchCmd('tel:$num');
                              if (a == false) {
                                saveLocation(context);
                                a = true;
                              }
                            });
                          }
                        });
                      }
                    },
                    minWidth: MediaQuery.of(context).size.width / 1.4,
                    child: Text(
                      "Police",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'BellMTBold',
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: 60,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(158, 206, 207, 1),
                        offset: Offset(-2, -2),
                        blurRadius: 4,
                        spreadRadius: 6,
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  child: MaterialButton(
                    onPressed: () {
                      print(pays);
                      if (pays == null) {
                        Fluttertoast.showToast(
                            msg:
                                "${AppLocalizations.of(context).translate('78_string')}");
                      } else if (reference != null) {
                        reference
                            .child(pays)
                            .child("ambulance")
                            .once()
                            .then((DataSnapshot snap) async {
                          if (snap != null) {
                            num = snap.value;
                            print(num);
                            launchCmd('tel:$num');
                            if (a == false) {
                              saveLocation(context);
                              a = true;
                            }
                          }
                        });
                      }
                    },
                    minWidth: MediaQuery.of(context).size.width / 1.4,
                    child: Text(
                      AppLocalizations.of(context).translate('douze_string'),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'BellMTBold',
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 60,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromRGBO(158, 206, 207, 1),
                        offset: Offset(-2, -2),
                        blurRadius: 4,
                        spreadRadius: 6,
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  child: MaterialButton(
                    onPressed: () {
                      if (pays == null) {
                        Fluttertoast.showToast(
                            msg:
                                "${AppLocalizations.of(context).translate('78_string')}");
                      } else {
                        return showDialog<void>(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text(AppLocalizations.of(context)
                                  .translate('seize_string')),
                              actions: <Widget>[
                                TextButton(
                                    child: Text(AppLocalizations.of(context)
                                        .translate('17_string')),
                                    onPressed: () {
                                      if (firebaseUser != null) {
                                        usersRef
                                            .reference()
                                            .child(firebaseUser.uid)
                                            .child("téléphone")
                                            .once()
                                            .then((DataSnapshot snap) async {
                                          if (snap != null) {
                                            num = snap.value;
                                            launchCmd('tel:$num');
                                            if (a == false) {
                                              saveLocation(context);
                                              a = true;
                                            }
                                          }
                                        });
                                      }
                                    }),
                                TextButton(
                                  child: Text(AppLocalizations.of(context)
                                      .translate('quinze_string')),
                                  onPressed: () {
                                    if (firebaseUser != null) {
                                      usersRef
                                          .reference()
                                          .child(firebaseUser.uid)
                                          .once()
                                          .then((DataSnapshot snap) async {
                                        if (snap != null) {
                                          var data = snap.value;
                                          print(data);
                                          prenom = data["prénom"];
                                          num = data["téléphone"];
                                          nom = data["nomDeFamille"];
                                          _sendSms(
                                              " $prenom $nom ${AppLocalizations.of(context).translate('quatorze_string')} $adresEnvoi",
                                              [num]);
                                          if (a == false) {
                                            saveLocation(context);
                                            a = true;
                                          }
                                        }
                                      });
                                    }
                                  },
                                )
                              ],
                            );
                          },
                        );
                      }
                    },
                    minWidth: MediaQuery.of(context).size.width / 1.4,
                    child: Text(
                      AppLocalizations.of(context).translate('treize_string'),
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'BellMTBold',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  getCurrentLocation() async {
    final position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    setState(() {
      latitude = '${position.latitude}';
      longitude = '${position.longitude}';
      final coordinates =
          new Coordinates(position.latitude, position.longitude);
      convertToAdress(coordinates).then((value) => address = value);
      now = new DateTime.now();
      date = formatter.format(now);
    });
  }

  Future<Address> convertToAdress(coordinates) async {
    var adres = await Geocoder.local.findAddressesFromCoordinates(coordinates);

    if (adres.first != null) {
      await Fluttertoast.showToast(
          msg: "${AppLocalizations.of(context).translate('77_string')}");
    }
    adresEnvoi = adres.first.addressLine;
    pays = adres.first.countryName;
    ville = adres.first.locality;
    avenue = adres.first.featureName;
    return adres.first;
  }

  Map userData;
  String utilisateur;
  String dateBase;
  var data;
  List<String> verify = [];
  List<String> keyList = [];
  void saveLocation(BuildContext context) async {
    userData = {
      "pays": pays.trim(),
      "ville": ville.trim(),
      "adresse": adresEnvoi.trim(),
      "avenue": avenue.trim(),
      "date": date,
    };
    newkey = localAdres.push().key;
    localAdres.child(newkey).set(userData);
  }
}
