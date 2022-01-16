import 'package:flutter/material.dart';
import 'package:projet1/app_localizations.dart';
import 'package:projet1/ui/guideTemoin.dart';
import 'package:projet1/ui/guideVictime.dart';
import 'package:projet1/ui/precaution.dart';

class Instructions extends StatefulWidget {
  const Instructions({Key key}) : super(key: key);
  @override
  _InstructionsState createState() => _InstructionsState();
}

class _InstructionsState extends State<Instructions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                padding: EdgeInsets.only(bottom: 5),
                margin: EdgeInsets.all(10),
                child: Text(
                  "${AppLocalizations.of(context).translate('38_string')}",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    fontFamily: 'BellMTBold',
                  ),
                ),
              ),
            ),
            Divider(),
            Text(
              "${AppLocalizations.of(context).translate('39_string')}",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: Colors.black54,
                fontFamily: 'BellMTBold',
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              margin: EdgeInsets.only(top: 20, bottom: 20),
              width: MediaQuery.of(context).size.width / 1.5,
              height: 80,
              decoration: BoxDecoration(
                color: Color.fromRGBO(172, 187, 182, 1),
                borderRadius: BorderRadius.circular(60),
              ),
              child: MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => precaution()),
                  );
                },
                child: Text(AppLocalizations.of(context).translate('40_string'),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontFamily: 'BellMTBold',
                    )),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20, bottom: 20),
              width: MediaQuery.of(context).size.width / 1.5,
              height: 80,
              decoration: BoxDecoration(
                color: Color.fromRGBO(172, 187, 182, 1),
                borderRadius: BorderRadius.circular(60),
                        ),
              child: MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => guideV()),
                  );
                },
                child: Text(AppLocalizations.of(context).translate('41_string'),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontFamily: 'BellMTBold',
                    )),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20, bottom: 20),
              width: MediaQuery.of(context).size.width / 1.5,
              height: 80,
              decoration: BoxDecoration(
                color: Color.fromRGBO(172, 187, 182, 1),
                borderRadius: BorderRadius.circular(60),
                
              ),
              child: MaterialButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => guideT()),
                  );
                },
                child: Text(AppLocalizations.of(context).translate('42_string'),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                      fontFamily: 'BellMTBold',
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
