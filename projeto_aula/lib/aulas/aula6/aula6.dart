import 'dart:io';

void main(List<String> arguments) {
  int opcao;
  double nota1;
  double nota2;
  print('''
    Escolha uma das opções:
    1 - definição da nota pela média;
    2 - definição da nota pela maior nota;
    3 - definição da nota pela meno nota.
  ''');
  String? resposta;
  do {
    print('A entrada não pode ser nula');
    resposta = stdin.readLineSync();
  } while (resposta == null);
  opcao = int.parse(resposta);

  print('Informe a primeira nota:');
  resposta = null;
  do {
    print('A entrada não pode ser nula');
    resposta = stdin.readLineSync();
  } while (resposta == null);
  nota1 = double.parse(resposta);

  print('Informe a segunda nota:');
  resposta = null;
  do {
    print('A entrada não pode ser nula');
    resposta = stdin.readLineSync();
  } while (resposta == null);
  nota2 = double.parse(resposta);
  bool resultado;
  if(opcao == 1){
    resultado = verificarAprovacao(nota1, nota2, calcularMedia);
  }else if(opcao == 2){
    resultado = verificarAprovacao(nota1, nota2, calcularMaiorNota);
  }else if(opcao == 2){
    resultado = verificarAprovacao(nota1, nota2, calcularMenorNota);
  }else{
    resultado = verificarAprovacao(nota1, nota2, (nota1,nota2) =>
      ((nota1 * 2)+ (nota2 *1)) / 3);
  }if(resultado){
    print('aprovado');
  }else{
    print('reprovado');
  }
}

bool verificarAprovacao(double nota1, double nota2, Function definirNota) {
  double nota =  definirNota(nota1, nota2);
  return (nota >= 6);
}

void verificarNota(double nota){
  if(nota < 0 || nota > 10) throw Exception('nota inválida');
}


double calcularMedia(double nota1, double nota2){
  verificarNota(nota1);
  verificarNota(nota2);
  var mediaNotas = (nota1 + nota2) / 2;
  return mediaNotas;
}

double calcularMaiorNota(double nota1, double nota2){
  var maiorNota = nota1;
  if (nota2 > nota1)  maiorNota = nota2;
  return maiorNota;
}


double calcularMenorNota(double nota1, double nota2){
  var menorNota = nota1;
  if (nota2 < nota1)  menorNota = nota2;
  return menorNota;
}


/*
Legibilidade → Os nomes estão claros e compreensíveis?
  nome de funções e métodos - Objetivo pricipal da função ou variável

Acoplamento → Esta função roda em qualquer plataforma?
  baixa depencia de plataformas e da própria função
  var é acoplado -> ele espera um tipo e define o primeiro

Coesão, unidade lógica, modularização → Esta função tem qual objetivo?
	Para realizar o objetivo, realiza quantas tarefas?
	Estas tarefas podem ser reaproveitadas?
	Quais são as tarefas/funções?
	→ distância do código em relação ao começo da linha

	quebrar em partes pra funcionar td e ter legibilidade do código

Parameter Function → e se tiver outras formas de definir nota?
Anonymous Function → funções sem nome;
  só é util pra qdo for usar somente 1x, não é possível reultilizar

  parametro do tipo função só é útil quando a lógica for diferente ai usa parametro do tipo função

Arroy Function =>
Tratamento de erros
  thwors exceptions - para aplicação

Teste Unitário
 
1 tipo de atividade
*/
