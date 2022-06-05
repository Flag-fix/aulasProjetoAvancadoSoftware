import 'dart:convert';
import 'dart:js_util';
import 'dart:math';

import 'package:robo_trader/aulas/atividade10funcoes/pessoa.dart';

/// As funções elaboradas deverá possuir:
/// (i)   Anonymous function e/ou arrow function (pelo menos 2 exemplos)
/// (ii)  Parâmetros posicionais obrigatórios e opcionais
/// (iii) Parâmetros nomeados obrigatórios e opcionais
/// (iv)  Testes unitários

/*
* Função - 01
*  Realizar uma verificação se o pin do cliente é válido para pagamento
*   1 - Gera um pin randomico seguro
*   2 - criptografa o pin seguro em Base 64
*   3 - função para decodificar pin
*   4 - Verifica o Pin do cliente passado por parametro e retorna bool
* */

Random geradorpin() {
  return Random.secure();
}

criptografarPin(var pinRandomSeguro) {
  var random = List<int>.generate(5, (i) => pinRandomSeguro.nextInt(256));
  return base64Url.encode(random);
}

decodificarPin(var pinCliente) {
  try {
    if (pinCliente) {
      var pin = base64Decode(pinCliente);
      return pin;
    } else {
      throw Exception('Consulte o log $e');
    }
  } catch (Exception) {}
}

bool verificarPinCliente(var pinCliente) {
  var result = false;
  if (pinCliente) {
    var decod = decodificarPin(pinCliente);
    if (decod == pinCliente) {
      result = true;
    }
  }
  return result;
}

/*
* Função - 02
*  Realiza uma verificação do IMC médio das pessoas de 1 a 100 anos
*   1 - Calcula a idade
*   2 - calcula IMC
*   3 - pega uma lista de pessoas e com base na sua idade calcula quantas pessoas com a idade X
* tem o imc médio, retorna uma lista de pessoas mostrando a quantidade de pessoas por faixa e seu imc médio
* */
int calcularIdade(DateTime dataAniversario) {
  DateTime hoje = DateTime.now();
  int idade = hoje.year - dataAniversario.year;
  if (hoje.month < dataAniversario.month) {
    idade--;
  } else if (hoje.month == dataAniversario.month) {
    if (hoje.day < dataAniversario.day) {
      idade--;
    }
  }
  return idade;
}

double calcularImc(Pessoa pessoa){
  return pessoa.peso! / pow(pessoa.altura!, 2);
}

List<Pessoa> verificaFaixaEtariaImc(List<Pessoa> pessoas){
  List<Pessoa> listaPessoas = [];
  var varAuxiliarUnidade = 1;
  var varAuxDezena = 10;
  var varAuxiliarWhile = true;
  var imcMedio ;
  var qtdPorFaixa;
  while(varAuxiliarWhile){
    pessoas.forEach((e) {
      var idade = calcularIdade(e.dtNasc!);
      Pessoa pessoaNova = newObject();
      if (idade > varAuxiliarUnidade && idade < varAuxDezena) {
        var IMC = calcularImc(e);
        imcMedio += IMC.toStringAsFixed(2);
        qtdPorFaixa += 1;
      }
      if (pessoas.indexOf(e) + 1 == pessoas.length) {
        pessoaNova.faixaEtaria = varAuxiliarUnidade.toString() + "-" + varAuxDezena.toString();
        var resultado = imcMedio / qtdPorFaixa;
        pessoaNova.imcMedio = resultado;
        imcMedio = 0.0;
        qtdPorFaixa = 0;
        listaPessoas.add(pessoaNova);
        varAuxDezena += 10;
        varAuxiliarUnidade += 10;
        if (varAuxDezena == 100) {
          varAuxiliarWhile = false;
        }
      }
    });
  }
  return listaPessoas;
}

/*
* Função - 03
*  Realiza calcula quantidade de obesos por sexo
* 1 - Calcula quantidade de obesos por sexo
* */

List<Pessoa> calculaQtdObesoSexo(List<Pessoa> pessoas){
  List<Pessoa> listaPessoas = [];
  var qtdObesoH = 0;
  var homem = 0;
  var mulher = 0;
  var qtdObesoM = 0;
  Pessoa pessoa = newObject();
  pessoas.forEach((p) {
    var IMC = calcularImc(p);
    if (p.sexo == "MASCULINO") {
      homem += 1;
      if (IMC > 30) {
        qtdObesoH += 1;
      }
    } else {
      if (IMC > 30) {
        qtdObesoM += 1;
      }
      mulher += 1;
    }
  });
  pessoa.QtdObesoM = mulher*qtdObesoM/100;
  pessoa.QtdObesoH = homem*qtdObesoH/100;
  listaPessoas.add(pessoa);
  return listaPessoas;
}

