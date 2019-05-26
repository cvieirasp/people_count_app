import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: "Contatodor de Pessoas",
      home: Home()
    )
  );
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _peopleCount = 0;
  String _infoText = "Pode Entrar!";

  void _changePeople(int value) {
    setState(() {

      if(_peopleCount == 0 && value < 0) {
        _infoText = "Número negativo!?";
      } else if(_peopleCount == 10 && value > 0) {
        _infoText = "Já não cabe mais!!!";
      } else {
        _peopleCount += value;

        if(_peopleCount < 5) {
          _infoText = "Pode Entrar!";
        } else {
          _infoText = "Já está ficando cheio!";
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          "images/rpd.jpg",
          fit: BoxFit.cover,
          height: 1000.0,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
                "Pessoas: $_peopleCount",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.all(10.0),
                    child: FlatButton(
                      child: Text(
                        "[<<]",
                        style: TextStyle(fontSize: 40.0, color: Colors.white),
                      ),
                      onPressed: () { _changePeople(-1); },
                    )
                ),
                Padding(
                    padding: EdgeInsets.all(10.0),
                    child: FlatButton(
                      child: Text(
                        "[>>]",
                        style: TextStyle(fontSize: 40.0, color: Colors.white),
                      ),
                      onPressed: () { _changePeople(1); },
                    )
                ),
              ],
            ),
            Text(
              _infoText,
              style: TextStyle(color: Colors.white, fontStyle: FontStyle.italic,
                  fontSize: 30.0),
            ),
          ],
        )
      ],
    );
  }
}
