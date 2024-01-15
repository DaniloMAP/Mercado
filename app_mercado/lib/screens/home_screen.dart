import 'package:app_mercado/bloc/produto_bloc.dart';
import 'package:flutter/material.dart';
import '../models/lista_produtos_widget.dart';
import '../widgets/filtro_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ProdutoBloc _produtoBloc;

  @override
  void initState() {
    super.initState();
    _produtoBloc = ProdutoBloc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Mini Mercado Apepê',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.yellow,
      ),
      body: Column(
        children: [
          FiltroWidget(
            onSearchQueryChanged: _produtoBloc.filtrarPorNome,
            onCategoryFilterChanged: _produtoBloc.filtrarPorCategoria,
          ),
          ListaProdutosWidget(produtoBloc: _produtoBloc),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _produtoBloc.dispose();
    super.dispose();
  }
}
