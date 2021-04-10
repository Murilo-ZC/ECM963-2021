import 'package:flutter/material.dart';
import 'package:viacep_webrequest/models/viacep.dart';

class CardCEP extends StatelessWidget {
  final ViaCEP cep;

  const CardCEP(this.cep);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: cep == null
          ? Center(
              child: Text("Sem dados para Exibir"),
            )
          : ListTile(
              leading: Text("${cep.cep}"),
              title: Text("${cep.logradouro} - ${cep.bairro}"),
              subtitle: Text("${cep.localidade} - ${cep.uf}"),
            ),
    );
  }
}
