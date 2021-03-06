import 'dart:math';

import 'package:flutter/material.dart';
import 'package:projeto_aula_2/model/dice.dart';

class TelaDados extends StatefulWidget {
  @override
  _TelaDadosState createState() => _TelaDadosState();
}

class _TelaDadosState extends State<TelaDados> {
  var dado1 = Dice();
  var dado2 = Dice();
  var _diceData = ["images/dice1.png", "images/dice2.png", "images/dice3.png",
    "images/dice4.png", "images/dice5.png", "images/dice6.png"];

  @override
  Widget build(BuildContext context) {
    return _montarTela();
  }

  Widget _montarTela() {
    return Scaffold(
      appBar: _montaAppBar(),
      body: _montaBody(),
      floatingActionButton: _montaFAB(),
    );
  }

  _montaAppBar() {
    return AppBar(
      title: Text("Lançador de Dados D6"),
    );
  }

  _montaBody() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(child: Center(child: Image.asset(_diceData[dado1.getNumero()]))),
          SizedBox(height: 8.0,),
          Expanded(child: Image.asset(_diceData[dado2.getNumero()])),
        ],
      ),
    );
  }

  _montaFAB() {
    return FloatingActionButton(
        child: Icon(Icons.threesixty),
        tooltip: "Botão que sorteia dados!",
        onPressed: _sortearDados
    );
  }

  void _sortearDados() {
    dado1.sortearValor();
    dado2.sortearValor();
    print("Dado1 - ${dado1.getNumero()} - Dado2 - ${dado2.getNumero()}");
    setState(() { });
  }
}
