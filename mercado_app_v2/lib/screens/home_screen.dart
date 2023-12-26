import 'dart:convert';

import 'package:flutter/material.dart';
import '../models/produto.dart';
import '../widgets/filtro_widget.dart';
import '../widgets/lista_produtos_widget.dart';

class HomeScreen extends StatelessWidget {
  Future<List<Produto>> _carregarProdutos(BuildContext context) async {
    String data = await DefaultAssetBundle.of(context).loadString('assets/produtos.json');
    List<dynamic> produtosJson = json.decode(data);
    List<Produto> produtos = produtosJson.map((json) => Produto.fromJson(json)).toList();
    return produtos;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Produto>>(
      future: _carregarProdutos(context),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Erro ao carregar os produtos'),
            );
          }
          List<Produto> produtos = snapshot.data ?? [];
          return Scaffold(
            appBar: AppBar(
              title: Text('Mini Mercado Apepê'),
            ),
            body: Column(
              children: [
                FiltroWidget(),
                ListaProdutosWidget(produtos: produtos),
              ],
            ),
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              title: Text('Carregando...'),
            ),
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}