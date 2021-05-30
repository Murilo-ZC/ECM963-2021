import 'package:app_analise_sentimento/components/emiji_widget.dart';
import 'package:app_analise_sentimento/tools/network_helper.dart';
import 'package:app_analise_sentimento/tools/source.dart';
import 'package:flutter/material.dart';
import 'package:flutter_emoji/flutter_emoji.dart';
import 'package:share_plus/share_plus.dart';

class TelaBase extends StatefulWidget {
  @override
  _TelaBaseState createState() => _TelaBaseState();
}

class _TelaBaseState extends State<TelaBase> {
  final textController = TextEditingController();
  var _status = EmojiWidget('thinking_face');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Analise de Sentimentos"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              child: TextField(
                controller: textController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Digite aqui sua mensagem',
                    hintText: "Informe aqui o texto para ser analisado."),
                maxLines: 10,
              ),
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 4.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                        icon: Icon(Icons.search),
                        iconSize: 48.0,
                        onPressed: () {
                          _processaTexto(context);
                        }),
                    IconButton(
                        icon: Icon(Icons.share),
                        iconSize: 48.0,
                        onPressed: () {
                          _shareIt(context);
                        }),
                  ],
                )),
            _status,
          ],
        ),
      ),
    );
  }

  void _shareIt(context) {
    if (textController.text.isEmpty) {
      _showErrorMessageSnakBar(context);
    } else {
      Share.share(textController.text);
    }
  }

  void _processaTexto(context) async {
    //Verifica se o texto não está vazio
    if (textController.text.isEmpty) {
      _showErrorMessageSnakBar(context);
    } else {
      var resposta = //Cria uma requisição de rede
          await NetworkHelper.postData(
              Source.getAzureUrl(), Source.getAzureHeader(), {
        "documents": [
          {"language": "pt-br", "id": "1", "text": textController.text}
        ]
      });
      setState(() {
        _status = Source.getEmojiWidgetForSentiment(
            resposta["documents"][0]["sentiment"]);
      });
    }
  }

  void _showErrorMessageSnakBar(context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text('Por favor preencha com algum texto'),
      duration: const Duration(seconds: 3),
      action: SnackBarAction(
        label: 'OK',
        onPressed: () {},
      ),
    ));
  }
}
