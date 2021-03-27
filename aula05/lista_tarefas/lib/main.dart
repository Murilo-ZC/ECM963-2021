import 'package:flutter/material.dart';

import 'model/item.dart';

void main() {
  runApp(MinhaLista());
}

class MinhaLista extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Aplicativo de Lista",
      home: MinhaTela(),
    );
  }
}

class MinhaTela extends StatefulWidget {
  @override
  _MinhaTelaState createState() => _MinhaTelaState();
}

class _MinhaTelaState extends State<MinhaTela> {
  var _tarefaController = TextEditingController();
  var _listaDeItens = <Item>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Minha Lista de Tarefas"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _tarefaController,
                decoration: InputDecoration(hintText: "Informe a tarefa"),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                _listaDeItens.add(Item(false, _tarefaController.text));
                _tarefaController.clear();
                print(_listaDeItens);
                setState(() {});
              },
              child: Text("Adicionar tarefa"),
            ),
            Expanded(
              child: _listaDeItens.isEmpty
                  ? Center(child: Text("Sem Tarefas Hoje!"))
                  : ListView.builder(
                      itemCount: _listaDeItens.length,
                      itemBuilder: (context, index) {
                        return MeuItemListView(_listaDeItens[index]);
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class MeuItemListView extends StatefulWidget {
  final item;
  MeuItemListView(this.item);
  @override
  _MeuItemListViewState createState() => _MeuItemListViewState();
}

class _MeuItemListViewState extends State<MeuItemListView> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        value: widget.item.pegarEstado,
        onChanged: (value) {
          widget.item.setEstado = value;
          setState(() {});
        },
      ),
      title: Text(widget.item.pegarDescricao),
    );
  }
}
