import 'package:flutter/material.dart';
import '../models/produto.dart';

class ListaProdutosWidget extends StatelessWidget {
  final List<Produto> produtos;

  ListaProdutosWidget({required this.produtos});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: produtos.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(produtos[index].nome),
            subtitle: Text(produtos[index].categoria),
            // Adicione mais informações do produto se necessário...
          );
        },
      ),
    );
  }
}
