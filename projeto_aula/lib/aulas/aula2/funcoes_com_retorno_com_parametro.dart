import 'dart:io';

void main() {
  //Função com retorno e com parametro

  print(verificarAprovacao(7, 3));
  print(descontoSalario(1000, 700));
}

String verificarAprovacao(double nota1, double nota2) {
  return (nota1 + nota2) / 2 >= 6 ? "Aprovado" : "Reprovado";
}

String descontoSalario(double salario, double desconto) {
  return salario > desconto
      ? "Seu salário é ${salario - desconto}"
      : "Sem saldo";
}
