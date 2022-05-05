import 'dart:ffi';

void main() {
  // Atividade II → Realize as atividades abaixo

  //Exercício 1 - faça a chamada do método adicionarSalario validando se o valor é positivo.
  double valor = 1000.00;
  double salario = 1000.00;

  adicionarSalario(salario, valor, ePositivo);

  //Exercício 2 - refaça o exe anterior, convertendo a named function em anonymous function.
  adicionarSalario(salario, valor, (valor) {
    return (valor) > 0;
  });

  //Exercício 3  - refaça o exe anterior, utilizando a arrow function.
  adicionarSalario(salario, valor, (valor) => valor > 0);

  //Exercício 4  - refaça os exe's a, b e c, porém validando se o valor é menor do que o salário.
  // R: Não é possivel realizar essa validação pois a função ePositivo recebe apenas um parametro não sendo possível verificar o os valores sendo q ele só pega o valor do valor

  //Exercício 5  - refaça o exe c porém fazendo uma validação sua.
  adicionarSalario(
      salario, valor, (valor) => valor >= 1000 && valor <= 2000 ? true : false);

  //Exercício 6 - faça 2 exemplos do uso de funções anônimas utilizando a biblioteca do dart.
  List<String> listaItens = ["João", "Maria"];
  listaItens.forEach(print);
  listaItens.map((i) {
    if (i.isEmpty)
      print("Lista Vazia");
    else
      print(i.toLowerCase());
  });

  /*
  Exercício 6 - Conseguiu entender:
    - O contexto em que é útil utilizar funções anônimas?
    - Os requisitos necessários para usar funções anônimas? 
    - diferença entre função nomeada e anônimas?
    - diferença entre anonymous function e arrow function?
    Em que caso devemos utilizar Arrow Function? O que devemos considerar?
  */
  // R:arrow functions permitem ter um retorno direto, onde são valores retornados sem ter que usar a palavar return, se tornando melhor a legibilidade
}

void adicionarSalario(
    double salario, double valor, Function(double valor) validacao) {
  bool eValido = validacao(valor);
  if (eValido) {
    final total = salario + valor;
    print(total);
  } else {
    print("Inválido");
  }
}

bool ePositivo(double numero) {
  if (numero > 0) {
    return true;
  } else {
    return false;
  }
}

bool valorMenorQueSalario(double valor, double salario) {
  if (valor < salario) {
    return true;
  } else {
    return false;
  }
}
