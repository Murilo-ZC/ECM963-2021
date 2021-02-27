import 'package:flutter/material.dart';

class MinhaTela extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: minhaBarra("Meu App Flutter"),
      body: meuCorpo(),
    );
  }

  minhaBarra(String s) => AppBar(
      title: Text(s),
    );

  meuCorpo() {
    return Column(
      children: [
        Text("Lalala"),
        Text("Lalala")
      ],
    );
  }

}
