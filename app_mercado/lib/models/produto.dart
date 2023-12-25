// models/produto.dart
class Produto {
  final int id;
  final bool disponibilidade;
  final String nome;
  final String referencia;
  final String fornecedor;
  final String codigoBarras;
  final int quantidade;
  final String imagem;

  Produto({
    required this.id,
    required this.disponibilidade,
    required this.nome,
    required this.referencia,
    required this.fornecedor,
    required this.codigoBarras,
    required this.quantidade,
    required this.imagem,
  });
}
