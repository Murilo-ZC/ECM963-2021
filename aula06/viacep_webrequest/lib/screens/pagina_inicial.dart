import 'package:flutter/material.dart';
import 'package:viacep_webrequest/helpers/network_helper.dart';
import 'package:viacep_webrequest/models/viacep.dart';
import 'package:viacep_webrequest/widgets/card_cep.dart';

class PaginaInicial extends StatefulWidget {
  @override
  _PaginaInicialState createState() => _PaginaInicialState();
}

class _PaginaInicialState extends State<PaginaInicial> {
  ViaCEP cep = null;
  final textCepController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Consulta CEP"),
      ),
      body: Column(
        children: [
          TextField(
            controller: textCepController,
          ),
          TextButton(
            onPressed: () async {
              try {
                final networkHelper = NetworkHelper(
                    url:
                        "https://viacep.com.br/ws/${textCepController.text}/json/");
                final resultados = await networkHelper.getData();
                cep = ViaCEP.fromJson(resultados);
                print("${resultados}");
                print("Dados do Objeto:");
                print("CEP:${cep.cep}");
                print("Logradouro:${cep.logradouro}");
                setState(() {});
              } catch (exception) {
                print("Algo deu errado!");
              }
            },
            child: Text("Pegar Dados do CEP!"),
          ),
          CardCEP(cep),
        ],
      ),
    );
  }
}
