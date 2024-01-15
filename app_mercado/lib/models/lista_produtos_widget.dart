import 'package:flutter/material.dart';
import '../bloc/produto_bloc.dart';
import '../models/produto.dart';

class ListaProdutosWidget extends StatelessWidget {
  final ProdutoBloc produtoBloc;

  ListaProdutosWidget({required this.produtoBloc});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: StreamBuilder<List<Produto>>(
        stream: produtoBloc.produtosFiltradosStream,
        builder: (context, snapshot) {
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
              child: Text('Nenhum produto encontrado.'),
            );
          }
          return ListView.builder(
            shrinkWrap: true,
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  _mostrarDetalhesProduto(context, snapshot.data![index]);
                },
                child: Card(
                  child: ListTile(
                    leading: SizedBox(
                      width: 50.0,
                      height: 50.0,
                      child: Image.asset(
                        snapshot.data![index].imagem,
                        width: 50.0,
                        height: 50.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                    title: Text(snapshot.data![index].nome),
                    subtitle: Text(snapshot.data![index].categoria),
                  ),
                ),
              );
            },
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
          content: Container(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 200.0,
                  child: Image.asset(
                    produto.imagem,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 10.0),
                Text('Categoria: ${produto.categoria}'),
                Text('Disponível: ${produto.disponivel ? 'Sim' : 'Não'}'),
                Text('Referência: ${produto.referencia}'),
                Text('Fornecedor: ${produto.fornecedor}'),
                Text('Código de Barras: ${produto.codigoBarras}'),
                Text('Quantidade: ${produto.quantidade}'),
              ],
            ),
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
