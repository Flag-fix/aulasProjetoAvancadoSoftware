

class Cliente {
  final String nome;
  final DateTime dataNascimento;
  final String pin;

  const Cliente({required this.nome, required this.dataNascimento, required this.pin});
}

class PinCliente implements Exception {
  final String error;

  const PinCliente({required this.error});
}
