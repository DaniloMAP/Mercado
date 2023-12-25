// produto_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/produto_bloc.dart';
import '../widgets/produto_list.dart';

class ProdutoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProdutoBloc(),
      child: _ProdutoScreenContent(),
    );
  }
}

class _ProdutoScreenContent extends StatefulWidget {
  @override
  _ProdutoScreenContentState createState() => _ProdutoScreenContentState();
}

class _ProdutoScreenContentState extends State<_ProdutoScreenContent> {
  late ProdutoBloc _produtoBloc;

  @override
  void initState() {
    super.initState();
    _produtoBloc = BlocProvider.of<ProdutoBloc>(context);
    _produtoBloc.add(CarregarProdutos());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Produtos'),
        actions: [
          IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: () {
              _produtoBloc.add(CarregarProdutos());
            },
          ),
        ],
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return BlocBuilder<ProdutoBloc, ProdutoState>(
      builder: (context, state) {
        if (state is ProdutoLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is ProdutosCarregados) {
          return ProdutoList(produtos: state.produtos);
        } else if (state is ProdutoError) {
          return Center(child: Text('Erro: ${state.errorMessage}'));
        } else {
          return Container();
        }
      },
    );
  }
}
