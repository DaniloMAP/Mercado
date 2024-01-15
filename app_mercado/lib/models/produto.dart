class Produto {
  final int id;
  final String nome;
  final String categoria;
  final bool disponivel;
  final String referencia;
  final String fornecedor;
  final String codigoBarras;
  final int quantidade;
  final String imagem;

  Produto({
    required this.id,
    required this.nome,
    required this.categoria,
    required this.disponivel,
    required this.referencia,
    required this.fornecedor,
    required this.codigoBarras,
    required this.quantidade,
    required this.imagem,
  });

  factory Produto.fromJson(Map<String, dynamic> json) {
    return Produto(
      id: json['id'],
      nome: json['nome'],
      categoria: json['categoria'],
      disponivel: json['disponivel'] == 1,
      referencia: json['referencia'],
      fornecedor: json['fornecedor'],
      codigoBarras: json['codigoBarras'],
      quantidade: json['quantidade'],
      imagem: json['imagem'],
    );
  }
}
