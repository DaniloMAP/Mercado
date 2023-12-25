import '../models/produto.dart';

class ProdutoService {
  static Future<List<Produto>> carregarProdutos() async {
    // Simulando uma pequena pausa para simular um carregamento assíncrono
    await Future.delayed(Duration(seconds: 2));

    final List<Map<String, dynamic>> jsonList = [
      {
        "id": 1,
        "disponibilidade": true,
        "nome": "Produto 1",
        "referencia": "REF001",
        "fornecedor": "Fornecedor A",
        "codigoBarras": "123456789",
        "quantidade": 10,
        "imagem": "caminho/da/imagem1.jpg"
      }
    ];

    List<Produto> produtos = jsonList
        .map((json) => Produto(
              id: json['id'],
              disponibilidade: json['disponibilidade'],
              nome: json['nome'],
              referencia: json['referencia'],
              fornecedor: json['fornecedor'],
              codigoBarras: json['codigoBarras'],
              quantidade: json['quantidade'],
              imagem: json['imagem'],
            ))
        .toList();

    return produtos;
  }
}
