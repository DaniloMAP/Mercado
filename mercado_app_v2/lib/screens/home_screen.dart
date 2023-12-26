// screens/home_screen.dart
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // Adicionado para o rootBundle
import '../models/produto.dart';
import '../widgets/lista_produtos_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String queryDeBusca = '';
  TextEditingController _searchController = TextEditingController();
  late List<Produto> _produtos;
  late List<Produto> _produtosFiltrados;

  @override
  void initState() {
    super.initState();
    _carregarProdutos();
    _searchController.addListener(_filtrarProdutos);
  }

  Future<void> _carregarProdutos() async {
    String data = await rootBundle.loadString('assets/produtos.json');
    List<dynamic> produtosJson = json.decode(data);
    _produtos = produtosJson.map((json) => Produto.fromJson(json)).toList();
    _filtrarProdutos();
  }

  void _filtrarProdutos() {
    setState(() {
      queryDeBusca = _searchController.text.toLowerCase();
      _produtosFiltrados = _produtos
          .where((produto) => produto.nome.toLowerCase().contains(queryDeBusca))
          .toList();
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
          TextField(
            controller: _searchController,
            decoration: InputDecoration(
              hintText: 'Digite o nome do produto',
            ),
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
