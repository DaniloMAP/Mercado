// widgets/lista_produtos_widget.dart
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
          return GestureDetector(
            onTap: () {
              _mostrarDetalhesProduto(context, produtos[index]);
            },
            child: Card(
              child: ListTile(
                leading: Image.asset(
                  produtos[index].imagem,
                  width: 50.0,
                  height: 50.0,
                  fit: BoxFit.cover,
                ),
                title: Text(produtos[index].nome),
                subtitle: Text(produtos[index].categoria),
              ),
            ),
          );
        },
      ),
    );
  }

  void _mostrarDetalhesProduto(BuildContext context, Produto produto) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(produto.nome),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.5,
                  child: Image.asset(
                    produto.imagem,
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.5,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text('Categoria: ${produto.categoria}'),
              Text('Disponível: ${produto.disponivel ? 'Sim' : 'Não'}'),
              Text('Referência: ${produto.referencia}'),
              Text('Fornecedor: ${produto.fornecedor}'),
              Text('Código de Barras: ${produto.codigoBarras}'),
              Text('Quantidade: ${produto.quantidade}'),
              // Adicione mais informações do produto se necessário...
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Fechar'),
            ),
          ],
        );
      },
    );
  }
}
