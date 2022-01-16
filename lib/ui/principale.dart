import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projet1/app_localizations.dart';
import 'package:projet1/main.dart';
import 'package:projet1/ui/authentification.dart';
import 'package:projet1/ui/location.dart';

import 'package:projet1/ui/profil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Color.fromRGBO(86, 110, 111, 1),
      resizeToAvoidBottomInset: false,
      drawer: Drawer(
        child: Scaffold(
          backgroundColor: Color.fromRGBO(86, 110, 111, 1),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.85,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: FractionalOffset.topCenter,
                          end: FractionalOffset.bottomCenter,
                          colors: [
                            Color.fromRGBO(111, 224, 236, 1),
                            Color.fromRGBO(86, 110, 111, 1),
                          ]),
                    ),
                    child: Center(
                      child: Text(
                          AppLocalizations.of(context)
                              .translate('third_string'),
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontFamily: 'BellMTBold',
                              fontSize: 35.0)),
                    ),
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
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      ListTile(
                        leading: Icon(Icons.edit),
                        title: Text(
                            AppLocalizations.of(context)
                                .translate('sept_string'),
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'BellMTBold',
                            )),
                        onTap: () {
                          Route route =
                              MaterialPageRoute(builder: (context) => Profil());
                          Navigator.push(context, route);
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(
                        height: 1,
                        thickness: 0.5,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ListTile(
                        leading: Icon(Icons.logout),
                        title: Text(
                            AppLocalizations.of(context)
                                .translate('huit_string'),
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'BellMTBold',
                            )),
                        onTap: () async {
                          SharedPreferences preferences =
                              await SharedPreferences.getInstance();
                          preferences.remove("email");
                          _signOut(context);
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Divider(
                        height: 1,
                        thickness: 0.5,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ListTile(
                        leading: Icon(Icons.account_box),
                        title: Text(
                            AppLocalizations.of(context)
                                .translate('neuf_string'),
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: 'BellMTBold',
                            )),
                        onTap: () async {
                          User user = await _firebaseAuth.currentUser;
                          user.delete();
                          usersRef.child(user.uid).remove();
                          _signOut(context);
                        },
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
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
                  child: Column(
                    children: [
                      Container(
                        width: 60,
                        margin: EdgeInsets.only(top: 5, right: 350),
                        child: IconButton(
                            icon: Icon(
                              Icons.menu_rounded,
                              color: Colors.white,
                              size: 50,
                            ),
                            onPressed: () {
                              _scaffoldKey.currentState.openDrawer();
                            }),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          padding:
                              EdgeInsets.only(top: 110, right: 30, left: 30),
                          child: Text(
                            AppLocalizations.of(context)
                                .translate('first_string'),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.normal,
                              fontFamily: 'BellMTBold',
                            ),
                          ),
                        ),
                      ),
                    ],
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
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(50, 100, 50, 100),
            child: Container(
              height: 200,
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height / 4.15),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(158, 206, 207, 1),
                    offset: Offset(-1, -4),
                    blurRadius: 9,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: MaterialButton(
                highlightColor: Colors.red,
                shape: CircleBorder(),
                color: Color.fromRGBO(172, 187, 182, 1),
                height: 200,
                minWidth: 300,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                child: Container(
                  child: Text(
                    AppLocalizations.of(context).translate('third_string'),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 44,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'BellMTBold',
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Location()),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _signOut(BuildContext context) async {
    await _firebaseAuth.signOut().then((value) {
      Route route = MaterialPageRoute(builder: (context) => Authentification());
      Navigator.pushReplacement(context, route);
    });
  }
}
