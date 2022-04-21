//objetivo entneder o parametro de função:

const aprovado = "aprovado";
const reprovado = "reprovado";

void show() {
  verificaAprovacao(10, 5,
      (nota1, nota2) => (((nota1 + nota2) / 2) >= 6) ? aprovado : reprovado);
}

String verificaAprovacao(double nota1, double nota2, Function acao) {
  return acao(nota1, nota2);
}

String verificaMedia(double nota1, double nota2) {
  double media = (nota1 + nota2) / 2;
  if (media >= 6) {
    return aprovado;
  } else {
    return reprovado;
  }
}

String verificaMaiorNota(double nota1, double nota2) {
  double maior = nota1;
  if (nota2 > nota1) {
    maior = nota2;
  }
  if (maior >= 6) {
    return aprovado;
  } else {
    return reprovado;
  }
}

String verificaMenorNota(double nota1, double nota2) {
  double menor = nota1;
  if (nota2 < nota1) {
    menor = nota2;
  }
  if (menor >= 6) {
    return aprovado;
  } else {
    return reprovado;
  }
}

void main() {
  print(recebeBonus(1000, 100));
}

abstract class Salario {
  void recebeSalario(double salario, double valor);
}

double recebeBonificacao(double salario, double bonificacao) {
  return salario += bonificacao;
}

double descontoSalario(double salario, double desconto) {
  return salario -= desconto;
}

double recebeBonus(double salario, double bonus) {
  return salario + (0.1 * bonus);
}

double salario(int opcao, double salario, double valor) {
  if (opcao == 1) {
    return recebeBonificacao(salario, valor);
  } else if (opcao == 2) {
    return descontoSalario(salario, valor);
  } else {
    return recebeBonus(salario, valor);
  }
}

/*
Atividade I 
1). Qual a diferença entre a 1º e a 2º forma? Na sua opinião, o que melhorou 
e o que piorou?
R: A primeira forma está muito mais complicado de entender, precisa ler bem mais o código para compreender o código, se torna muito verboso 
para compreensão de quem não entende muito fica muito mais dificil de compreender, já a segunda forma fica mais simples e encurtada, atribuindo os
valores e conseguindo entender os seus significados, muito limpo e fácil de entender.

2). O que é e para que serve parâmetros do tipo função? Em que caso utilizamos?
Os parametros servem para serem atribuidos os valores dentro da função, pedindo para o "usuário" informar qq valor do tipo que é solicitado para funcioar a função.
Ultilizado nas funções que precisam atribuir algum valor dentro dela.

Atividade II - Defina 3 funções do mesmo contexto e uma interface para estas 
funções
→ Interface Salario 
→ Receber salario e um valor. Bonificar o valor no salário e informar se o 
total é maior que o salário mínimo.
→ Receber salario e um valor. Descontar o valor no salário e informar se 
ainda resta salário a receber.
→ Receber salario e um valor. Calcular e informar o % que o valor da 
comissão representa em relação ao salário.

Atividade III
Pensar em um projeto único 
Fazer um exemplo seu
*/
