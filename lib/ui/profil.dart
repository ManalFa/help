import 'dart:collection';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projet1/app_localizations.dart';
import 'package:projet1/main.dart';

class Profil extends StatefulWidget {
  const Profil({Key key}) : super(key: key);

  @override
  _ProfilState createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  TextEditingController _firstname = TextEditingController();

  TextEditingController _familyname = TextEditingController();

  TextEditingController _phonenumber = TextEditingController();
  final User firebaseUser = FirebaseAuth.instance.currentUser;
  var prenom;
  var nom;
  var num;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Color.fromRGBO(86, 110, 111, 1),
      resizeToAvoidBottomInset: false,
      body: Column(
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
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 130, right: 30, left: 30),
                    child: Text(
                      AppLocalizations.of(context).translate('63_string'),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'BellMTBold',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color.fromRGBO(240, 240, 240, 1),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              child: ListView(
                padding: EdgeInsets.only(top: 60),
                children: [
                  ListTile(
                      leading: Icon(Icons.edit),
                      title: Text(
                          AppLocalizations.of(context).translate('19_string'),
                          style: TextStyle(
                            fontFamily: 'BellMTBold',
                            fontSize: 20,
                          )),
                      onTap: () {
                        return showDialog<void>(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                content: TextFormField(
                                  controller: _firstname,
                                  decoration: InputDecoration(
                                    labelText: AppLocalizations.of(context)
                                        .translate('64_string'),
                                    contentPadding: EdgeInsets.all(20.0),
                                    labelStyle: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'BellMTBold',
                                    ),
                                  ),
                                ),
                                actions: <Widget>[
                                  MaterialButton(
                                      onPressed: () {
                                        update(
                                            context, "prénom", _firstname.text);
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        AppLocalizations.of(context)
                                            .translate('37_string'),
                                      )),
                                ],
                              );
                            });
                      }),
                  Divider(
                    height: 1,
                    thickness: 0.5,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ListTile(
                      leading: Icon(Icons.edit),
                      title: Text(
                        AppLocalizations.of(context).translate('20_string'),
                        style: TextStyle(
                          fontFamily: 'BellMTBold',
                          fontSize: 20,
                        ),
                      ),
                      onTap: () {
                        return showDialog<void>(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                content: TextFormField(
                                  controller: _familyname,
                                  decoration: InputDecoration(
                                    labelText: AppLocalizations.of(context)
                                        .translate('65_string'),
                                    contentPadding: EdgeInsets.all(20.0),
                                    labelStyle: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'BellMTBold',
                                    ),
                                  ),
                                ),
                                actions: <Widget>[
                                  MaterialButton(
                                      onPressed: () {
                                        update(context, "nomDeFamille",
                                            _familyname.text);
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        AppLocalizations.of(context)
                                            .translate('37_string'),
                                      )),
                                ],
                              );
                            });
                      }),
                  Divider(
                    height: 1,
                    thickness: 0.5,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ListTile(
                      leading: Icon(Icons.edit),
                      title: Text(
                          AppLocalizations.of(context).translate('21_string'),
                          style: TextStyle(
                            fontFamily: 'BellMTBold',
                            fontSize: 20,
                          )),
                      onTap: () {
                        return showDialog<void>(
                            context: context,
                            barrierDismissible: false,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                content: TextFormField(
                                  controller: _phonenumber,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    labelText: AppLocalizations.of(context)
                                        .translate('66_string'),
                                    contentPadding: EdgeInsets.all(20.0),
                                    labelStyle: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'BellMTBold',
                                    ),
                                  ),
                                ),
                                actions: <Widget>[
                                  MaterialButton(
                                      onPressed: () {
                                        update(context, "téléphone",
                                            _phonenumber.text);
                                        Navigator.pop(context);
                                      },
                                      child: Text(
                                        AppLocalizations.of(context)
                                            .translate('37_string'),
                                      )),
                                ],
                              );
                            });
                      }),
                  Divider(
                    height: 1,
                    thickness: 0.5,
                    color: Colors.grey,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void update(BuildContext context, String value, String field) {
    if (firebaseUser != null) {
      Map<String, dynamic> data = new HashMap();
      {
        data[value] = field.trim();
      }
      usersRef.child(firebaseUser.uid).update(data);
    }
  }
}
