
class Produto {
  String nomeProduto;
  double valorProduto;

  Produto({required this.nomeProduto, required this.valorProduto});
}

class ValorProduto implements Exception {
  String error;

  ValorProduto(this.error);
}