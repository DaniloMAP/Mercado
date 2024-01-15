import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/produto.dart';

class ProdutoBloc {
  late List<Produto> _produtos;
  late List<Produto> _produtosFiltrados;

  final _produtosFiltradosController =
      StreamController<List<Produto>>.broadcast();

  ProdutoBloc() {
    _produtos = [];
    _produtosFiltrados = [];
    _carregarProdutos();
  }

  Stream<List<Produto>> get produtosFiltradosStream =>
      _produtosFiltradosController.stream;

  Future<void> _carregarProdutos() async {
    try {
      String data = await rootBundle.loadString('assets/produtos.json');
      List<dynamic> produtosJson = json.decode(data);
      _produtos = produtosJson.map((json) => Produto.fromJson(json)).toList();
      filtrarPorNome(
          ''); // chamando diretamente o método do filtro
    } catch (error) {
      print('Erro ao carregar produtos: $error');
    }
  }

  List<Produto> get produtosFiltrados => _produtosFiltrados;

  void filtrarPorNome(String query) {
    _produtosFiltrados = _produtos
        .where((produto) => produto.nome.toLowerCase().contains(query))
        .toList();

    _produtosFiltradosController.sink.add(_produtosFiltrados);
  }

  void filtrarPorCategoria(String? selectedCategory) {
    _produtosFiltrados = _produtos
        .where((produto) =>
            selectedCategory == null ||
            selectedCategory.isEmpty ||
            selectedCategory.toLowerCase() == 'todos' ||
            produto.categoria.toLowerCase() == selectedCategory.toLowerCase())
        .toList();

    _produtosFiltradosController.sink.add(_produtosFiltrados);
  }

  void dispose() {
    _produtosFiltradosController.close();
  }
}
