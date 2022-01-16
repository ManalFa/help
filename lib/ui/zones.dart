import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:projet1/app_localizations.dart';
import 'package:projet1/main.dart';
import 'package:projet1/models/model.dart';

class Zone extends StatefulWidget {
  const Zone({Key key}) : super(key: key);

  @override
  _ZoneState createState() => _ZoneState();
}

class _ZoneState extends State<Zone> {
  List<Model> list = new List();
  List<String> listAdresse = [];
  List<Model> listInitiale = [];
  List<String> adresInitiale = [];
  List<String> dates = [];
  String paysChoix = paysField.text;
  String villeChoix = villeField.text;
  int iter = 1;
  var avenue;
  var ville;
  var pays;
  var adresse;
  var date;
  Model model;
  Model modell;
  int reclam = 0;
  String derniereDate = "";
  void nbreReclamation(String adresse) async {
    for (int j = 0; j <= adresInitiale.length; j++) {
      if (adresInitiale[j] == adresse) {
        reclam = reclam + 1;
      }
    }
  }

  void lastDate(String adresse) async {
    for (int j = 0; j <= listInitiale.length; j++) {
      if (listInitiale[j].adresse.trim().toString() ==
          adresse.trim().toString()) {
        derniereDate = listInitiale[j].date;
      }
    }
  }

  void initState() {
    super.initState();
    localAdres.once().then((DataSnapshot snap) async {
      list.clear();
      var keys = snap.value.keys;
      var values = snap.value;

      for (var key in keys) {
        // print(key);
        avenue = values[key]['avenue'];
        ville = values[key]['ville'];
        pays = values[key]['pays'];
        adresse = values[key]['adresse'];
        date = values[key]['date'];
        adresInitiale.add(adresse);
        modell = new Model.withDate(adresse, date);
        listInitiale.add(modell);
        if (!adresse.toString().contains("Unnamed Road")) {
          if (!listAdresse.contains(adresse)) {
            model = new Model(avenue, ville, pays, adresse, date);
            listAdresse.add(adresse);

            list.add(model);
          }
        }
      }

      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromRGBO(86, 110, 111, 1),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  IconButton(
                      iconSize: 50,
                      icon: Icon(Icons.arrow_back),
                      color: Colors.white,
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    child: Center(
                      child: Text(
                        AppLocalizations.of(context).translate('61_string'),
                        style: TextStyle(
                          fontFamily: 'BellMTBold',
                          color: Colors.white,
                          fontSize: 35,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
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
              child: Padding(
                padding: EdgeInsets.all(0),
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: list.length,
                    itemBuilder: (_, index) {
                      if (list[index].pays == paysChoix &&
                          list[index].ville == villeChoix) {
                        int k = reclam;
                        nbreReclamation(list[index].adresse);
                        k = reclam - k;

                        lastDate(list[index].adresse);

                        return (UI(
                            context, list[index].adresse, derniereDate, k));
                      } else
                        (Fluttertoast.showToast(
                            msg: AppLocalizations.of(context)
                                .translate('28_string')));
                    }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget UI(BuildContext context, String avenue, String date, int nbre) {
  return Container(
    margin: EdgeInsets.all(10),
    padding: EdgeInsets.only(
      top: 20,
      bottom: 20,
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(
        Radius.circular(20.0),
      ),
      color: Color.fromRGBO(111, 224, 236, 1),
      boxShadow: [
        BoxShadow(
          color: Colors.grey[400],
          offset: Offset(0, 0),
          blurRadius: 7,
          spreadRadius: 5,
        ),
      ],
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  '${AppLocalizations.of(context).translate('62_string')} :',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'BellMTBold',
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                    fontSize: 20,
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                '$avenue',
                overflow: TextOverflow.visible,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                  fontFamily: 'BellMTBold',
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                '${AppLocalizations.of(context).translate('26_string')} :',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'BellMTBold',
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                ' $date',
                overflow: TextOverflow.visible,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                  fontFamily: 'BellMTBold',
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
          child: Column(
            children: [
              Text(
                '${AppLocalizations.of(context).translate('27_string')} :',
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'BellMTBold',
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                '$nbre',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                  fontFamily: 'BellMTBold',
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
