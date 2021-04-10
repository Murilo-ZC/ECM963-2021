import 'package:flutter/material.dart';
import 'package:viacep_webrequest/helpers/network_helper.dart';
import 'package:viacep_webrequest/models/viacep.dart';

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
          var cep = ViaCEP.fromJson(resultados);
          print("${resultados}");
          print("Dados do Objeto:");
          print("CEP:${cep.cep}");
          print("Logradouro:${cep.logradouro}");
        },
        child: Text("Pegar Dados do CEP!"),
      ),
    );
  }
}
