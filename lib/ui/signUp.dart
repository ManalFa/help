import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projet1/app_localizations.dart';
import 'package:projet1/main.dart';
import 'package:projet1/ui/authentification.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController _emailField = TextEditingController();

  TextEditingController _passwordField = TextEditingController();

  TextEditingController _firstname = TextEditingController();

  TextEditingController _familyname = TextEditingController();

  TextEditingController _phonenumber = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final isKeyboardopen = MediaQuery.of(context).viewInsets.bottom != 0;

    return Scaffold(
      backgroundColor: Color.fromRGBO(106, 177, 185, 1),
      resizeToAvoidBottomInset: false,
      body: Column(children: [
        if (!isKeyboardopen) Logo(),
        Expanded(
          flex: 3,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Color.fromRGBO(240, 240, 240, 1),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30,
                ),
                Container(
                  margin: EdgeInsets.only(left: 50.0),
                  child: Text(
                    AppLocalizations.of(context).translate('29_string'),
                    style: TextStyle(
                        color: Colors.black45,
                        fontSize: 30.0,
                        fontFamily: 'BellMTBold'),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: 50,
                  margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.075,
                      right: MediaQuery.of(context).size.width * 0.075),
                  width: MediaQuery.of(context).size.width * 0.85,
                  child: TextFormField(
                    textAlignVertical: TextAlignVertical.bottom,
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                    controller: _firstname,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText:
                          AppLocalizations.of(context).translate('34_string'),
                      contentPadding: EdgeInsets.only(top: 16.0, bottom: 13.0),
                      labelStyle: TextStyle(
                        color: Colors.black,
                        fontFamily: 'BellMTBold',
                      ),
                      hintStyle: TextStyle(
                        color: Colors.black26,
                        fontFamily: 'BellMTBold',
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.0))),
                      prefixIcon: Icon(Icons.person),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 50,
                  margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.075,
                      right: MediaQuery.of(context).size.width * 0.075),
                  width: MediaQuery.of(context).size.width * 0.85,
                  child: TextFormField(
                    textAlignVertical: TextAlignVertical.bottom,
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                    controller: _familyname,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText:
                          AppLocalizations.of(context).translate('35_string'),
                      contentPadding: EdgeInsets.only(top: 16.0, bottom: 13.0),
                      labelStyle: TextStyle(
                        color: Colors.black,
                        fontFamily: 'BellMTBold',
                      ),
                      hintStyle: TextStyle(
                        color: Colors.black26,
                        fontFamily: 'BellMTBold',
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.0))),
                      prefixIcon: Icon(Icons.person),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 50,
                  margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.075,
                      right: MediaQuery.of(context).size.width * 0.075),
                  width: MediaQuery.of(context).size.width * 0.85,
                  child: TextFormField(
                    textAlignVertical: TextAlignVertical.bottom,
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                    controller: _emailField,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText:
                          AppLocalizations.of(context).translate('30_string'),
                      contentPadding: EdgeInsets.only(top: 16.0, bottom: 13.0),
                      labelStyle: TextStyle(
                        color: Colors.black,
                        fontFamily: 'BellMTBold',
                      ),
                      hintStyle: TextStyle(
                        color: Colors.black26,
                        fontFamily: 'BellMTBold',
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.0))),
                      prefixIcon: Icon(Icons.email_outlined),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 50,
                  margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.075,
                      right: MediaQuery.of(context).size.width * 0.075),
                  width: MediaQuery.of(context).size.width * 0.85,
                  child: TextFormField(
                    textAlignVertical: TextAlignVertical.bottom,
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                    controller: _passwordField,
                    obscureText: true,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText:
                          AppLocalizations.of(context).translate('31_string'),
                      contentPadding: EdgeInsets.only(top: 16.0, bottom: 13.0),
                      labelStyle: TextStyle(
                        color: Colors.black,
                        fontFamily: 'BellMTBold',
                      ),
                      hintStyle: TextStyle(
                        color: Colors.black26,
                        fontFamily: 'BellMTBold',
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.0))),
                      prefixIcon: Icon(Icons.lock),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 50,
                  margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.075,
                      right: MediaQuery.of(context).size.width * 0.075),
                  width: MediaQuery.of(context).size.width * 0.85,
                  child: TextFormField(
                    textAlignVertical: TextAlignVertical.bottom,
                    style: TextStyle(
                      fontSize: 18.0,
                    ),
                    keyboardType: TextInputType.number,
                    controller: _phonenumber,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      hintText:
                          AppLocalizations.of(context).translate('36_string'),
                      contentPadding: EdgeInsets.only(top: 16.0, bottom: 13.0),
                      labelStyle: TextStyle(
                        color: Colors.black,
                        fontFamily: 'BellMTBold',
                      ),
                      hintStyle: TextStyle(
                        color: Colors.black26,
                        fontFamily: 'BellMTBold',
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius:
                              BorderRadius.all(Radius.circular(20.0))),
                      prefixIcon: Icon(Icons.smartphone),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  height: 60,
                  margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.25,
                      right: MediaQuery.of(context).size.width * 0.25),
                  width: MediaQuery.of(context).size.width * 0.5,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey[400],
                        offset: Offset(10, 10),
                        blurRadius: 7,
                        spreadRadius: 0,
                      ),
                    ],
                    color: Color.fromRGBO(170, 220, 222, 1),
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                  child: MaterialButton(
                      onPressed: () {
                        if (_emailField.text.isEmpty) {
                          Fluttertoast.showToast(
                              msg:
                                  '${AppLocalizations.of(context).translate('67_string')}');
                        } else if (_passwordField.text.length < 6) {
                          Fluttertoast.showToast(
                              msg:
                                  '${AppLocalizations.of(context).translate('76_string')}');
                        } else {
                          registerNewUser(context);
                        }
                      },
                      child: Text(
                        AppLocalizations.of(context).translate('37_string'),
                        style: TextStyle(
                          color: Colors.black38,
                          fontSize: 20,
                          fontFamily: 'BellMTBold',
                        ),
                      )),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  void registerNewUser(BuildContext context) async {
    final User firebaseUser = (await _firebaseAuth
            .createUserWithEmailAndPassword(
                email: _emailField.text, password: _passwordField.text)
            .catchError((errMsg) {
      Fluttertoast.showToast(
          msg: '${AppLocalizations.of(context).translate('73_string')}: ' +
              errMsg.toString());
    }))
        .user;
    if (firebaseUser != null) {
      //enregistrer les données des utilisateurs
      Map userData = {
        "prénom": _firstname.text.trim(),
        "nomDeFamille": _familyname.text.trim(),
        "email": _emailField.text.trim(),
        "téléphone": _phonenumber.text.trim(),
      };
      usersRef.child(firebaseUser.uid).set(userData);
      Fluttertoast.showToast(
          msg: '${AppLocalizations.of(context).translate('74_string')}');
      Route route = MaterialPageRoute(builder: (context) => Authentification());
      Navigator.pushReplacement(context, route);
    } else {
      Fluttertoast.showToast(
          msg: '${AppLocalizations.of(context).translate('75_string')}');
    }
  }
}

class Logo extends StatelessWidget {
  const Logo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: FractionalOffset.topCenter,
            end: FractionalOffset.bottomCenter,
            colors: [
              Color.fromRGBO(111, 224, 236, 1),
              Color.fromRGBO(106, 177, 185, 1),
            ],
          ),
        ),
        child: Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 40.0),
            child: Icon(
              Icons.person_add_alt_1_outlined,
              size: 100.0,
              color: Colors.white,
            )),
      ),
    );
  }
}
