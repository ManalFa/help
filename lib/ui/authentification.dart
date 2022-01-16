import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:projet1/app_localizations.dart';
import 'package:projet1/main.dart';
import 'package:projet1/ui/homeScreen.dart';
import 'package:projet1/ui/principale.dart';
import 'package:projet1/ui/signUp.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Authentification extends StatefulWidget {
  Authentification({Key key}) : super(key: key);
  @override
  _AuthentificationState createState() => _AuthentificationState();
}

SharedPreferences userDataStorage;

class _AuthentificationState extends State<Authentification> {
  bool loading = false;
  String error = '';
  final _formkey = GlobalKey<FormState>();
  TextEditingController _emailField = TextEditingController();
  TextEditingController _passwordField = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final isKeyboardopen = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(
      backgroundColor: Color.fromRGBO(106, 177, 185, 1),
      resizeToAvoidBottomInset: false,
      body: Column(children: [
        if (!isKeyboardopen) Logo_1(),
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
            child: Form(
              key: _formkey,
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
                      controller: _emailField,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText:
                            AppLocalizations.of(context).translate('30_string'),
                        contentPadding:
                            EdgeInsets.only(top: 16.0, bottom: 13.0),
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
                        prefixIcon: Icon(Icons.email),
                      ),
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
                      controller: _passwordField,
                      obscureText: true,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        hintText:
                            AppLocalizations.of(context).translate('31_string'),
                        contentPadding:
                            EdgeInsets.only(top: 16.0, bottom: 13.0),
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
                    height: 50,
                  ),
                  loading
                      ? Container(
                          child: Center(child: CircularProgressIndicator()),
                        )
                      : Container(
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
                            borderRadius:
                                BorderRadius.all(Radius.circular(20.0)),
                          ),
                          child: MaterialButton(
                            onPressed: () async {
                              if (_emailField.text.isEmpty) {
                                Fluttertoast.showToast(
                                  msg: AppLocalizations.of(context)
                                      .translate('67_string'),
                                );
                              } else if (_passwordField.text.isEmpty) {
                                Fluttertoast.showToast(
                                  msg: AppLocalizations.of(context)
                                      .translate('68_string'),
                                );
                              } else {
                                setState(() {
                                  loading = true;
                                });
                                signIn(context);
                              }
                            },
                            child: Text(
                              AppLocalizations.of(context)
                                  .translate('32_string'),
                              style: TextStyle(
                                color: Colors.black38,
                                fontSize: 20,
                                fontFamily: 'BellMTBold',
                              ),
                            ),
                          ),
                        ),
                  SizedBox(
                    height: 40,
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
                      color: Colors.black38,
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    ),
                    child: MaterialButton(
                      onPressed: () {
                        Route route =
                            MaterialPageRoute(builder: (context) => SignUp());
                        Navigator.push(context, route);
                      },
                      child: Text(
                        AppLocalizations.of(context).translate('33_string'),
                        style: TextStyle(
                          color: Color.fromRGBO(170, 220, 222, 1),
                          fontSize: 20,
                          fontFamily: 'BellMTBold',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  void signIn(BuildContext context) async {
    final User firebaseUser = (await _firebaseAuth
            .signInWithEmailAndPassword(
                email: _emailField.text, password: _passwordField.text)
            .catchError((errMsg) {
      setState(() {
        loading = false;
      });
      if (errMsg.code.toString() == 'user-not-found') {
        Fluttertoast.showToast(
          msg: '${AppLocalizations.of(context).translate('69_string')}',
        );
      }
      if (errMsg.code.toString() == 'invalid-email') {
        Fluttertoast.showToast(
            msg: '${AppLocalizations.of(context).translate('70_string')}');
      }
      if (errMsg.code.toString() == 'wrong-password') {
        Fluttertoast.showToast(
            msg: "${AppLocalizations.of(context).translate('71_string')}");
      }
    }))
        .user;
    if (firebaseUser != null) {
      usersRef
          .reference()
          .child(firebaseUser.uid)
          .once()
          .then((DataSnapshot snap) async {
        if (snap != null) {
          SharedPreferences preferences = await SharedPreferences.getInstance();
          preferences.setString("email", _emailField.text.toString());
          preferences.setString("password", _passwordField.text.toString());
          Route route = MaterialPageRoute(builder: (context) => HomeScreen());
          Navigator.pushReplacement(context, route);
        } else {
          _firebaseAuth.signOut();
          Fluttertoast.showToast(
              msg: '${AppLocalizations.of(context).translate('72_string')}');
        }
      });
    } else {
      Fluttertoast.showToast(
          msg: '${AppLocalizations.of(context).translate('73_string')}:');
    }
  }
}

class Logo_1 extends StatelessWidget {
  const Logo_1({Key key}) : super(key: key);

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
              Icons.account_circle_outlined,
              size: 100.0,
              color: Colors.white,
            )),
      ),
    );
  }
}
