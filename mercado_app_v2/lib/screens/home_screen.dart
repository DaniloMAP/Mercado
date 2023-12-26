// screens/home_screen.dart
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/produto.dart';
import '../widgets/lista_produtos_widget.dart';
import '../widgets/filtro_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String queryDeBusca = '';
  String selectedCategory = '';
  TextEditingController _searchController = TextEditingController();
  late List<Produto> _produtos;
  late List<Produto> _produtosFiltrados;

  @override
  void initState() {
    super.initState();
    _carregarProdutos();
    _searchController
        .addListener(() => _filtrarProdutos(_searchController.text));
  }

  Future<void> _carregarProdutos() async {
    String data = await rootBundle.loadString('assets/produtos.json');
    List<dynamic> produtosJson = json.decode(data);
    _produtos = produtosJson.map((json) => Produto.fromJson(json)).toList();
    _filtrarProdutos('');
  }

  void _filtrarProdutos(String? query) {
    setState(() {
      queryDeBusca = query?.toLowerCase() ?? '';
      _produtosFiltrados = _produtos
          .where((produto) =>
              produto.nome.toLowerCase().contains(queryDeBusca) &&
              (selectedCategory.isEmpty ||
                  selectedCategory == 'todos' ||
                  produto.categoria.toLowerCase() == selectedCategory))
          .toList();
    });
  }

  void _atualizarCategoria(String? novaCategoria) {
    setState(() {
      selectedCategory = novaCategoria?.toLowerCase() ?? '';
      _filtrarProdutos(_searchController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mini Mercado Apepê'),
      ),
      body: Column(
        children: [
          FiltroWidget(
            onSearchQueryChanged: _filtrarProdutos,
            onCategoryFilterChanged: _atualizarCategoria,
          ),
          ListaProdutosWidget(produtos: _produtosFiltrados),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
