import 'package:flutter/material.dart';
import 'package:projet1/app_localizations.dart';

class precaution extends StatefulWidget {
  @override
  _precautionState createState() => _precautionState();
}

class _precautionState extends State<precaution> {
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
                    height: 150,
                  ),
                  Center(
                    child: Text(
                      AppLocalizations.of(context).translate('43_string'),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'BellMTBold'),
                    ),
                  ),
                  SizedBox(
                    height: 70,
                  ),
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
                        AppLocalizations.of(context).translate('44_string'),
                        overflow: TextOverflow.visible,
                        style: TextStyle(
                            fontSize: 21,
                            color: Colors.black54,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'BellMTBold'),
                      ),
                    ]),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Divider(),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: 10, right: 10, top: 0, bottom: 10),
                    child: Row(children: [
                      Icon(
                        Icons.group,
                        size: 40.0,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: Text(
                          AppLocalizations.of(context).translate('45_string'),
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
                  SizedBox(
                    height: 10,
                  ),
                  Divider(),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: 10, right: 10, top: 0, bottom: 10),
                    child: Row(children: [
                      Icon(
                        Icons.search,
                        size: 40.0,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: Text(
                          AppLocalizations.of(context).translate('46_string'),
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
