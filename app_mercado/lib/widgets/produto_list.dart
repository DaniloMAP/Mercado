// produto_list.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/produto_bloc.dart';
import '../models/produto.dart'; // Certifique-se de importar o modelo de produto
import '../widgets/produto_card.dart';

class ProdutoList extends StatelessWidget {
  final List<Produto> produtos; // Adicionado o parâmetro produtos

  ProdutoList({required this.produtos}); // Atualizado o construtor

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProdutoBloc, ProdutoState>(
      builder: (context, state) {
        if (state is ProdutosCarregados) {
          return _buildProdutosList(state.produtos);
        } else if (state is ProdutoLoading) {
          return _buildLoadingIndicator();
        } else if (state is ProdutoError) {
          return _buildErrorText(state.errorMessage);
        } else {
          return _buildLoadingIndicator(); // Trate outros estados se necessário
        }
      },
    );
  }

  Widget _buildProdutosList(List<Produto> produtos) {
    return ListView.builder(
      itemCount: produtos.length,
      itemBuilder: (context, index) {
        return ProdutoCard(produto: produtos[index]);
      },
    );
  }

  Widget _buildLoadingIndicator() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildErrorText(String errorMessage) {
    return Center(
      child: Text(errorMessage),
    );
  }
}
