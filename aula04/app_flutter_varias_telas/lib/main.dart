import 'package:flutter/material.dart';

import 'segunda_tela.dart';
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
      home: PrimeiraPagina(),
    );
  }
}

class PrimeiraPagina extends StatelessWidget {
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SegundaTela()));
              }),
              MeuTexto("Colocar Texto Aqui", controlador),
              MeuBotao(
                "Mudar Para Terceira Tela com o Texto Acima!",
                () async {
                  var retorno = await Navigator.push(context,
                      MaterialPageRoute(builder: (context) {
                    return TerceiraTela(controlador.text);
                  }));
                  ScaffoldMessenger.of(context)
                      .showSnackBar(SnackBar(content: Text("$retorno")));
                },
              ),
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
