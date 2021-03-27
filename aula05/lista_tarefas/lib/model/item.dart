class Item {
  bool _estado;
  String _descricao;

  Item(this._estado, this._descricao);

  String get pegarDescricao => _descricao;

  bool get pegarEstado => _estado;
  set setEstado(bool estado) {
    _estado = estado;
  }

  @override
  String toString() =>
      "Estado: ${this._estado} - Descrição: ${this._descricao}";
}
