import 'dart:io';

void main() {
  print("Funções sem retorno e sem parametro");

  verificarAprovacao();
  descontoSalario();
}

// Exercício de pegar 2 notas, calcular média e informa se esta aprovado/reprovado
void verificarAprovacao() {
  print("Informar notas: ");
  var entrada = stdin.readLineSync(); // Pode ser null a variável

  var nota01 = entrada != null
      ? double.parse(entrada)
      : 0; // Verificar se a entrada foi null ou não

  var nota02 = double.parse(stdin.readLineSync()!); // Pode ser null a variável

  var media = (nota01 + nota02) / 2;

  print(media >= 6 ? "Aprovado" : "Reprovado");
}

// Descontar - Receber salario e o valor do desconto
// Descontar somente se haver saldo.
// No final informar o saldo
void descontoSalario() {
  print("Informe o salário: ");
  var entrada1 = stdin.readLineSync();

  print("Informe o adiantamento: ");
  var entrada2 = stdin.readLineSync();

  if (entrada1 != null && entrada2 != null) {
    print(double.parse(entrada1) > double.parse(entrada2)
        ? "Seu salário é igual à ${double.parse(entrada1) - double.parse(entrada2)}"
        : "Saldo insuficiente");
  } else {
    print("Erro variáveis nulas");
  }
}
