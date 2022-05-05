import 'dart:io';

void main(List<String> args) {
  // Arquivo FUNÇÕES COM RETORNO e SEM PARÂMETROS.
  print(calcularSalario());
  print(verificarAprovacao());
}

String calcularSalario() {
  print('Salario: ');
  var salario = double.parse(stdin.readLineSync()!);

  print('Desconto: ');
  var desconto = double.parse(stdin.readLineSync()!);
  if (salario > desconto) {
    return ("Saldo: ${salario - desconto}");
  } else {
    return ("Saldo Insuficiente");
  }
}

String verificarAprovacao() {
  print('Nota 1: ');
  var nota1 = double.parse(stdin.readLineSync()!);

  print('Nota 2: ');
  var nota2 = double.parse(stdin.readLineSync()!);

  var media = (nota1 + nota2) / 2;

  return media >= 6 ? 'Aprovado' : 'Reprovado';
}
