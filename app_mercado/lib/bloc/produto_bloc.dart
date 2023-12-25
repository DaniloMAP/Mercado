import 'package:app_mercado/models/produto.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../service/produto_service.dart';

// Eventos
abstract class ProdutoEvent {}

class CarregarProdutos extends ProdutoEvent {}

// Estados
abstract class ProdutoState {}

class ProdutoInitial extends ProdutoState {}

class ProdutoLoading extends ProdutoState {}

class ProdutosCarregados extends ProdutoState {
  final List<Produto> produtos;

  ProdutosCarregados(this.produtos);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProdutosCarregados &&
          runtimeType == other.runtimeType &&
          produtos == other.produtos;

  @override
  int get hashCode => produtos.hashCode;
}

class ProdutoError extends ProdutoState {
  final String errorMessage;

  ProdutoError(this.errorMessage);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProdutoError &&
          runtimeType == other.runtimeType &&
          errorMessage == other.errorMessage;

  @override
  int get hashCode => errorMessage.hashCode;
}

class ProdutoBloc extends Bloc<ProdutoEvent, ProdutoState> {
  ProdutoBloc() : super(ProdutoInitial());

  @override
  Stream<ProdutoState> mapEventToState(ProdutoEvent event) async* {
    if (event is CarregarProdutos) {
      yield ProdutoLoading();

      try {
        final List<Produto> produtos = await ProdutoService.carregarProdutos();
        yield ProdutosCarregados(produtos);
      } catch (e) {
        // Lidar com erros, se necessário
        print('Erro ao carregar produtos: $e');
        yield ProdutoError('Erro ao carregar produtos: $e');
      }
    }
  }
}
