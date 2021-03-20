import 'package:app_flutter_varias_telas/main.dart';
import 'package:flutter/material.dart';

class TerceiraTela extends StatefulWidget {
  static const String ROTA_TELA_TRES = "/telaTres";

  @override
  _TerceiraTelaState createState() => _TerceiraTelaState();
}

class _TerceiraTelaState extends State<TerceiraTela> {
  var controlador = TextEditingController();
  String _textoRecebido;
  @override
  Widget build(BuildContext context) {
    _textoRecebido =
        ModalRoute.of(context).settings.arguments ?? "Nada enviado";
    return Scaffold(
      appBar: AppBar(
        title: Text("Terceira Tela da Aplicação"),
      ),
      body: Center(
        child: Column(
          children: [
            MeuTexto("Texto para voltar para a tela principal", controlador),
            MeuBotao("Voltar para tela principal com o texto acima", () {
              Navigator.pop(context, controlador.text);
            }),
            MeuBotao("Apenas voltar para tela principal", () {
              Navigator.pop(context);
            }),
            Text("Texto recebido: ${_textoRecebido}"),
          ],
        ),
      ),
    );
  }
}
