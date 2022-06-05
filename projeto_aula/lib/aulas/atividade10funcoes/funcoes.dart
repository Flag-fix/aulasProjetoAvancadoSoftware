import 'dart:convert';
import 'dart:js_util';
import 'dart:math';

import 'package:robo_trader/aulas/atividade10funcoes/imc.dart';
import 'package:robo_trader/aulas/atividade10funcoes/obesidade.dart';
import 'package:robo_trader/aulas/atividade10funcoes/pessoa.dart';
import 'package:robo_trader/aulas/atividade10funcoes/tipoSanguineo.dart';

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

List<Imc> verificaFaixaEtariaImc(List<Pessoa> pessoas){
  List<Imc> listaImcMedio = [];
  var varAuxiliarUnidade = 1;
  var varAuxDezena = 10;
  var varAuxiliarWhile = true;
  var imcMedio ;
  var qtdPorFaixa;
  while(varAuxiliarWhile){
    pessoas.forEach((e) {
      var idade = calcularIdade(e.dtNasc!);
      Imc? imc;
      if (idade > varAuxiliarUnidade && idade < varAuxDezena) {
        var IMC = calcularImc(e);
        imcMedio += IMC.toStringAsFixed(2);
        qtdPorFaixa += 1;
      }
      if (pessoas.indexOf(e) + 1 == pessoas.length) {
        imc?.faixaEtaria = varAuxiliarUnidade.toString() + "-" + varAuxDezena.toString();
        var resultado = imcMedio / qtdPorFaixa;
        imc?.imcMedio = resultado;
        imcMedio = 0.0;
        qtdPorFaixa = 0;
        listaImcMedio.add(imc!);
        varAuxDezena += 10;
        varAuxiliarUnidade += 10;
        if (varAuxDezena == 100) {
          varAuxiliarWhile = false;
        }
      }
    });
  }
  return listaImcMedio;
}

/*
* Função - 03
*  Realiza calcula quantidade de obesos por sexo
* 1 - Calcula quantidade de obesos por sexo
* */

List<Obesidade> calculaQtdObesoSexo(List<Pessoa> pessoas){
  List<Obesidade> listaObesos = [];
  var qtdObesoH = 0;
  var homem = 0;
  var mulher = 0;
  var qtdObesoM = 0;
  Obesidade? obesidade;
  pessoas.forEach((p) {
    var IMC = calcularImc(p);
    if (p.sexo == "MASCULINO") {
      homem += 1;
      //Pessoa obesa com IMC acima de 30
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
  //add a % de mulheres e homens
  obesidade?.QtdObesoM = mulher*qtdObesoM/100;
  obesidade?.QtdObesoH = homem*qtdObesoH/100;
  listaObesos.add(obesidade!);
  return listaObesos;
}


/*
* Função - 04
*  Realiza calculo da média das pessoas por tipo sanguíneo
* 1 - Calcula quantidade de pessoas por tipo sanguineo
* */

List<TipoSanguineo> calculaQtdMediaTipoSanguineo(List<Pessoa> pessoas, List<TipoSanguineo> tipoSanguineo){
  List<TipoSanguineo> listaTipoSanguineo = [];
  tipoSanguineo.forEach((tipo) {
    var idade = 0;
    var qtdPessoas = 0;
    TipoSanguineo? tipoSanguineo;
    pessoas.forEach((p) {
      if (p.tipoSanguineo == tipo.tipoSangue!) {
        idade += calcularIdade(p.dtNasc!);
        qtdPessoas += 1;
      }
      if (pessoas.indexOf(p) + 1 == pessoas.length) {
        var media= idade / qtdPessoas;
        tipoSanguineo?.idadeMedia =media;
        tipoSanguineo?.tipoSangue = tipo.tipoSangue!;
        listaTipoSanguineo.add(tipoSanguineo!);
      }
    });
  });
  return listaTipoSanguineo;
}


/*
* Função - 05
*  Realiza verificação da quantidade de doadores por tipo sanquineo
* 1 - Calcula quantidade de possiveis doadores por tipo sanguineo
* 2 - Faz validação para cada tipo sanguineo para verificar se é compativel com sangue ou não
* OBS: Somente pessoas com idade de 16 a 69 anos e com peso acima de 50 Kg podem doar sangue.
* */

List<TipoSanguineo> verificaQtdDoadoresPorTipoSanguineo(List<Pessoa> pessoas, List<TipoSanguineo> tiposSanguineo){
  List<TipoSanguineo> listaDoadores = [];
  tiposSanguineo.forEach((tip) {
    var idade = 0;
    var qtdPessoas = 0;
    TipoSanguineo? tipoSanguineo;
    pessoas.forEach((p) {
      idade = calcularIdade(p.dtNasc!);
      if (idade >= 16 && idade <= 69 && p.peso! > 50) {
        var sanguePessoa = p.tipoSanguineo!;
        if (sanguePessoa == tip.tipoSangue || sanguePessoa == "AB+") {
          qtdPessoas += 1;
        }else{
          if(getDoaApos(sanguePessoa)) {
            qtdPessoas += 1;
          } else if(getDoaAandBandOneg(sanguePessoa)) {
            qtdPessoas += 1;
          } else if(getDoaBpos(sanguePessoa)) {
            qtdPessoas += 1;
          } else if(getDoaABneg(sanguePessoa)) {
            qtdPessoas += 1;
          }
        }
      }
      if (pessoas.indexOf(p) + 1 == pessoas.length) {
        tipoSanguineo?.qtdDoadores = qtdPessoas;
        tipoSanguineo?.tipoSangue = tip.tipoSangue;
        listaDoadores.add(tipoSanguineo!);
      }
    });
  });
  return listaDoadores;
}

bool getDoaApos(String sanguePessoa) {
  return sanguePessoa == "A-" || sanguePessoa == "O+" || sanguePessoa == "O-";
}

bool getDoaAandBandOneg(String sanguePessoa) {
  return sanguePessoa == "O-";
}

bool getDoaBpos(String sanguePessoa) {
  return sanguePessoa == "B-" || sanguePessoa == "O+" || sanguePessoa == "O-";
}

bool getDoaABneg(String sanguePessoa) {
  return sanguePessoa == "A-" || sanguePessoa == "B-" || sanguePessoa == "O-";
}