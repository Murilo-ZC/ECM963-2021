import 'package:flutter/material.dart';

class SegundaTela extends StatelessWidget {
  static const String ROTA_TELA_DOIS = "/telaDois";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Minha Segunda Tela"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("Retornar para primeira tela!"),
        ),
      ),
    );
  }
}
