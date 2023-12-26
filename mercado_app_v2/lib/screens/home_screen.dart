// screens/home_screen.dart
import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import '../models/produto.dart';
import '../widgets/lista_produtos_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String queryDeBusca = '';
  Timer? _debounce;

  Future<List<Produto>> _carregarProdutos(BuildContext context) async {
    String data =
        await DefaultAssetBundle.of(context).loadString('assets/produtos.json');
    List<dynamic> produtosJson = json.decode(data);
    List<Produto> produtos =
        produtosJson.map((json) => Produto.fromJson(json)).toList();
    return produtos;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mini Mercado Apepê'),
      ),
      body: FutureBuilder<List<Produto>>(
        future: _carregarProdutos(context),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(
                child: Text('Erro ao carregar os produtos'),
              );
            }
            List<Produto> produtosFiltrados =
                (snapshot.data ?? []).where((produto) {
              bool buscaPassaFiltro = queryDeBusca.isEmpty ||
                  produto.nome
                      .toLowerCase()
                      .contains(queryDeBusca.toLowerCase());

              return buscaPassaFiltro;
            }).toList();

            return Column(
              children: [
                TextField(
                  onChanged: (String searchQuery) {
                    if (_debounce != null) {
                      _debounce!.cancel();
                    }

                    _debounce = Timer(const Duration(milliseconds: 2000), () {
                      setState(() {
                        queryDeBusca = searchQuery;
                      });
                    });
                  },
                  decoration: InputDecoration(
                    hintText: 'Digite o nome do produto',
                  ),
                ),
                ListaProdutosWidget(produtos: produtosFiltrados),
              ],
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
      ),
    );
  }
}
