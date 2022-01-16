import 'package:flutter/material.dart';
import 'package:projet1/app_localizations.dart';

class guideT extends StatefulWidget {

  @override
  _guideTState createState() => _guideTState();
}

class _guideTState extends State<guideT> {
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
                    height: 100,
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                      child: Text(
                        AppLocalizations.of(context).translate('55_string'),
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 27,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'BellMTBold'),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 60,
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        left: 10, right: 10, top: 0, bottom: 10),
                    child: Row(children: [
                      Icon(
                        Icons.support_agent_outlined,
                        size: 40.0,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        AppLocalizations.of(context).translate('56_string'),
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
                        Icons.self_improvement,
                        size: 40.0,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Text(
                        AppLocalizations.of(context).translate('57_string'),
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
                        Icons.security,
                        size: 40.0,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: Text(
                          AppLocalizations.of(context).translate('58_string'),
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
                        Icons.pan_tool_rounded,
                        size: 40.0,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: Text(
                          AppLocalizations.of(context).translate('59_string'),
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
                        Icons.call,
                        size: 40.0,
                      ),
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: Text(
                          AppLocalizations.of(context).translate('60_string'),
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
