import 'package:flutter/material.dart';
import 'package:projet1/app_localizations.dart';

class guideV extends StatefulWidget {
  const guideV({Key key}) : super(key: key);
  @override
  _guideVState createState() => _guideVState();
}

class _guideVState extends State<guideV> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter,
                colors: [
                  Color.fromRGBO(111, 224, 236, 1),
                  Color.fromRGBO(172, 187, 182, 1)
                ],
              ),
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 80,
                  ),
                  Center(
                    child: Text(
                      AppLocalizations.of(context).translate('47_string'),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          // decoration: TextDecoration.underline,
                          color: Colors.white,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'BellMTBold'),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: 10, right: 10, top: 0, bottom: 10),
                    child: Row(children: [
                      Icon(
                        Icons.self_improvement,
                        size: 40.0,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        AppLocalizations.of(context).translate('48_string'),
                        style: TextStyle(
                            fontSize: 21,
                            color: Colors.black54,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'BellMTBold'),
                      ),
                    ]),
                  ),
                  Divider(),
                  Container(
                    margin: EdgeInsets.only(
                        left: 10, right: 10, top: 0, bottom: 10),
                    child: Row(children: [
                      Icon(
                        Icons.pan_tool,
                        size: 40.0,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        AppLocalizations.of(context).translate('49_string'),
                        style: TextStyle(
                            fontSize: 21,
                            color: Colors.black54,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'BellMTBold'),
                      ),
                    ]),
                  ),
                  Divider(),
                  Container(
                    margin: EdgeInsets.only(
                        left: 10, right: 10, top: 0, bottom: 10),
                    child: Row(children: [
                      Icon(
                        Icons.security,
                        size: 40.0,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: Text(
                          AppLocalizations.of(context).translate('50_string'),
                          overflow: TextOverflow.visible,
                          style: TextStyle(
                              fontSize: 21,
                              color: Colors.black54,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'BellMTBold'),
                        ),
                      ),
                    ]),
                  ),
                  Divider(),
                  Container(
                    margin: EdgeInsets.only(
                        left: 10, right: 10, top: 0, bottom: 10),
                    child: Row(children: [
                      Icon(
                        Icons.pan_tool,
                        size: 40.0,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: Text(
                          AppLocalizations.of(context).translate('51_string'),
                          overflow: TextOverflow.visible,
                          style: TextStyle(
                              fontSize: 21,
                              color: Colors.black54,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'BellMTBold'),
                        ),
                      ),
                    ]),
                  ),
                  Divider(),
                  Container(
                    margin: EdgeInsets.only(
                        left: 10, right: 10, top: 0, bottom: 10),
                    child: Row(children: [
                      Icon(
                        Icons.call,
                        size: 40.0,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: Text(
                          AppLocalizations.of(context).translate('52_string'),
                          overflow: TextOverflow.visible,
                          style: TextStyle(
                              fontSize: 21,
                              color: Colors.black54,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'BellMTBold'),
                        ),
                      ),
                    ]),
                  ),
                  Divider(),
                  Container(
                    margin: EdgeInsets.only(
                        left: 10, right: 10, top: 0, bottom: 10),
                    child: Row(children: [
                      Icon(
                        Icons.psychology_sharp,
                        size: 40.0,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: Text(
                          AppLocalizations.of(context).translate('53_string'),
                          overflow: TextOverflow.visible,
                          style: TextStyle(
                              fontSize: 21,
                              color: Colors.black54,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'BellMTBold'),
                        ),
                      ),
                    ]),
                  ),
                  Divider(),
                  Container(
                    margin: EdgeInsets.only(
                        left: 10, right: 10, top: 0, bottom: 10),
                    child: Row(children: [
                      Icon(
                        Icons.post_add,
                        size: 40.0,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: Text(
                          AppLocalizations.of(context).translate('54_string'),
                          overflow: TextOverflow.visible,
                          style: TextStyle(
                              fontSize: 21,
                              color: Colors.black54,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'BellMTBold'),
                        ),
                      ),
                    ]),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
