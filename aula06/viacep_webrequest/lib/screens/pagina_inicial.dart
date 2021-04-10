import 'package:flutter/material.dart';
import 'package:viacep_webrequest/helpers/network_helper.dart';

class PaginaInicial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Consulta CEP"),
      ),
      body: TextButton(
        onPressed: () async {
          var networkHelper =
              NetworkHelper(url: "https://viacep.com.br/ws/01001000/json/");
          var resultados = await networkHelper.getData();
          print("${resultados}");
        },
        child: Text("Pegar Dados do CEP!"),
      ),
    );
  }
}
