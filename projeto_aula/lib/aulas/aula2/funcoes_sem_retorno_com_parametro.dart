void main() {
  // Função sem retorno e com parametro
  verificarAprovacao(6, 7);
  descontoSalario(1000, 500);
}

void verificarAprovacao(double nota1, double nota2) {
  print((nota1 + nota2) / 2 >= 6 ? "Aprovado" : "Reprovado");
}

void descontoSalario(double salario, double desconto) {
  print(salario > desconto
      ? "Seu salário é igual à ${salario - desconto}"
      : "Saldo insuficiente");
}
