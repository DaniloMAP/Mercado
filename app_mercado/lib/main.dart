import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/produto_bloc.dart';
import 'screens/produto_screen.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<ProdutoBloc>(
          create: (BuildContext context) => ProdutoBloc(),
        ),
        // Adicione outros BlocProviders aqui, se necessário
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mini Mercado Apepê',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ProdutoScreen(),
    );
  }
}
