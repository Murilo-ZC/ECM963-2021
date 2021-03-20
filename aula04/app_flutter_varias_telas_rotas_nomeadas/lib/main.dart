import 'package:flutter/material.dart';

import 'segunda_tela.dart';
import 'segunda_tela.dart';
import 'segunda_tela.dart';
import 'terceira_tela.dart';
import 'terceira_tela.dart';
import 'terceira_tela.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: PrimeiraPagina(),
      routes: {
        PrimeiraPagina.ROTA_TELA_PRINCIPAL: (context) => PrimeiraPagina(),
        SegundaTela.ROTA_TELA_DOIS: (context) => SegundaTela(),
        TerceiraTela.ROTA_TELA_TRES: (context) => TerceiraTela(),
      },
    );
  }
}

class PrimeiraPagina extends StatelessWidget {
  static const String ROTA_TELA_PRINCIPAL = "/";
  var controlador = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MeuBotao("Mudar Para Segundo Tela", () {
                Navigator.pushNamed(context, SegundaTela.ROTA_TELA_DOIS);
              }),
              MeuTexto("Colocar Texto Aqui", controlador),
              MeuBotao("Mudar Para Terceira Tela com o Texto Acima!", () async {
                var retorno = await Navigator.pushNamed(
                    context, TerceiraTela.ROTA_TELA_TRES,
                    arguments: controlador.text);
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(retorno ?? "Sem retorno")));
              }),
            ],
          ),
        ),
      ),
    );
  }
}

class MeuBotao extends StatelessWidget {
  final String texto;
  final Function minhaAcaoBotao;
  MeuBotao(this.texto, this.minhaAcaoBotao);
  @override
  Widget build(Object context) => ElevatedButton(
        onPressed: minhaAcaoBotao,
        child: Text(texto),
      );
}

class MeuTexto extends StatefulWidget {
  final String texto;
  final TextEditingController controller;
  MeuTexto(this.texto, this.controller);
  @override
  _MeuTextoState createState() => _MeuTextoState();
}

class _MeuTextoState extends State<MeuTexto> {
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
        child: TextField(
          controller: widget.controller,
          decoration: InputDecoration(
            hintText: widget.texto,
            //Retira as bordas da aplicação
            //border: InputBorder.none,
          ),
        ),
      );
}
