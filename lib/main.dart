//per far funzionare i package della nostra libreria vanno prima importati
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audio_cache.dart';

//i package devono essere aggiunti allo yaml file
//posso controllare il contenuto nella sezione external library
void main() => runApp(XylophoneApp());

class XylophoneApp extends StatelessWidget {
  //per evitare la ripetizione del codice occore sviluppare una function.
  //questa particolare funzione richiedera un un argomento di input.
  void playSound(int note) {
    final player = AudioCache();
    //il segno del dollaro verra determinato quando l'utente premerà il bottone
    //corrispondente al suono
    player.play('note$note.wav');
  }

  //questa è una function di widget a cui posso passare due parametri
  //uno e il colore e l'altro e il soundnumber che determina quale
  //suono verrà riprodotto.
  //devo anche costuire la struttura del widget
  Expanded widgetPerNote({Color color, int soundnumber}) {
    return Expanded(
        child: FlatButton(
      color: color,
      onPressed: () {
        //iserisci il numero da passare alla function
        playSound(soundnumber);
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Center(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              //creo sette chiamate alla funzione creata per i widget
              widgetPerNote(color: Colors.red, soundnumber: 1),
              widgetPerNote(color: Colors.orange, soundnumber: 2,),
              widgetPerNote(color: Colors.yellow, soundnumber: 3,),
              widgetPerNote(color: Colors.green, soundnumber: 4),
              widgetPerNote(color: Colors.teal, soundnumber: 5),
              widgetPerNote(color: Colors.blue, soundnumber: 6),
              widgetPerNote(color: Colors.purple, soundnumber: 7),
            ],
          )),
        ),
      ),
    );
  }
}
