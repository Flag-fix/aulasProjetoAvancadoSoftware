class PinCliente implements Exception {
  final String error;

  const PinCliente({required this.error});
}

class ValorProduto implements Exception {
  String error;

  ValorProduto(this.error);
}
