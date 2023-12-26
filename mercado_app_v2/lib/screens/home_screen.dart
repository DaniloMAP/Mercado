import 'package:flutter/material.dart';
import '../models/produto.dart';
import '../widgets/filtro_widget.dart';
import '../widgets/lista_produtos_widget.dart';

class HomeScreen extends StatelessWidget {
  final List<Produto> produtos = [
    Produto(nome: 'Produto 1', referencia: 'REF001', categoria: 'Categoria A'),
    // Adicione mais produtos aqui...
  ];

  @override
  Widget build(BuildContext context) {
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
  }
}
