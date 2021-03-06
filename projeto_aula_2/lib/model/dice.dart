import 'dart:math';

class Dice{
  int _numero;
  static const int _MAX_FACES = 6;

  getNumero() => _numero;

  sortearValor(){
    var sorteador = Random();
    _numero = sorteador.nextInt(_MAX_FACES);
  }

  Dice(){
    sortearValor();
  }
}