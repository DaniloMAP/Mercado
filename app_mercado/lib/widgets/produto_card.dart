import 'package:flutter/material.dart';
import '../models/produto.dart';

class ProdutoCard extends StatelessWidget {
  final Produto produto;

  ProdutoCard({required this.produto});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(8.0),
      child: ListTile(
        leading: CircleAvatar(
          // Se você tiver URLs para as imagens, você pode usar o Image.network.
          // Caso contrário, você precisará gerenciar as imagens localmente.
          backgroundImage: AssetImage('assets/images/placeholder_image.jpg'),
        ),
        title: Text(produto.nome),
        subtitle: Text('Ref: ${produto.referencia} | ${produto.fornecedor}'),
        trailing: Text(
          'Quantidade: ${produto.quantidade}',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        onTap: () {
          // Adicione a lógica para ação quando o card for pressionado.
        },
      ),
    );
  }
}
