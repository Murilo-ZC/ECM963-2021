import 'package:flutter/material.dart';

class PaginaInicial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Consulta CEP"),
      ),
      body: TextButton(
        onPressed: () {},
        child: Text("Pegar Dados do CEP!"),
      ),
    );
  }
}
