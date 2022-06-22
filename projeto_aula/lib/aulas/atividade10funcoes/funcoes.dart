import 'dart:convert';
import 'dart:math';

import 'package:robo_trader/aulas/atividade10funcoes/comunicado.dart';
import 'package:robo_trader/aulas/atividade10funcoes/exame.dart';
import 'package:robo_trader/aulas/atividade10funcoes/imc.dart';
import 'package:robo_trader/aulas/atividade10funcoes/obesidade.dart';
import 'package:robo_trader/aulas/atividade10funcoes/pessoa.dart';
import 'package:robo_trader/aulas/atividade10funcoes/tipoPagamento.dart';
import 'package:robo_trader/aulas/atividade10funcoes/tipoSanguineo.dart';

/// As funções elaboradas deverá possuir:
/// (i)   Anonymous function e/ou arrow function (pelo menos 2 exemplos)
/// (ii)  Parâmetros posicionais obrigatórios e opcionais
/// (iii) Parâmetros nomeados obrigatórios e opcionais
/// (iv)  Testes unitários

/*
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
*  Realiza uma verificação do IMC médio das pessoas de 1 a 100 anos
*   1 - Calcula a idade
*   2 - calcula IMC
*   3 - pega uma lista de pessoas e com base na sua idade calcula quantas pessoas com a idade X
* tem o imc médio, retorna uma lista de pessoas mostrando a quantidade de pessoas por faixa e seu imc médio
* */
int calcularIdade({required DateTime dataAniversario}) {
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

double calcularImc(Pessoa pessoa) {
  return pessoa.peso! / pow(pessoa.altura!, 2);
}

List<Imc> verificaFaixaEtariaImc({required List<Pessoa> pessoas}) {
  List<Imc> listaImcMedio = [];
  var varAuxiliarUnidade = 1;
  var varAuxDezena = 10;
  var varAuxiliarWhile = true;
  var imcMedio;
  var qtdPorFaixa;
  while (varAuxiliarWhile) {
    pessoas.forEach((e) {
      var idade = calcularIdade(dataAniversario: e.dtNasc!);
      Imc? imc;
      if (idade > varAuxiliarUnidade && idade < varAuxDezena) {
        var IMC = calcularImc(e);
        imcMedio += IMC.toStringAsFixed(2);
        qtdPorFaixa += 1;
      }
      if (pessoas.indexOf(e) + 1 == pessoas.length) {
        imc?.faixaEtaria =
            varAuxiliarUnidade.toString() + "-" + varAuxDezena.toString();
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
*  Realiza calcula quantidade de obesos por sexo
* 1 - Calcula quantidade de obesos por sexo
* */

List<Obesidade> calculaQtdObesoSexo(List<Pessoa> pessoas) {
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
  obesidade?.QtdObesoM = mulher * qtdObesoM / 100;
  obesidade?.QtdObesoH = homem * qtdObesoH / 100;
  listaObesos.add(obesidade!);
  return listaObesos;
}

/*
*  Realiza calculo da média das pessoas por tipo sanguíneo
* 1 - Calcula quantidade de pessoas por tipo sanguineo
* */

List<TipoSanguineo> calculaQtdMediaTipoSanguineo(
    List<Pessoa> pessoas, List<TipoSanguineo> tipoSanguineo) {
  List<TipoSanguineo> listaTipoSanguineo = [];
  tipoSanguineo.forEach((tipo) {
    var idade = 0;
    var qtdPessoas = 0;
    TipoSanguineo? tipoSanguineo;
    pessoas.forEach((p) {
      if (p.tipoSanguineo == tipo.tipoSangue!) {
        idade += calcularIdade(dataAniversario: p.dtNasc!);
        qtdPessoas += 1;
      }
      if (pessoas.indexOf(p) + 1 == pessoas.length) {
        var media = idade / qtdPessoas;
        tipoSanguineo?.idadeMedia = media;
        tipoSanguineo?.tipoSangue = tipo.tipoSangue!;
        listaTipoSanguineo.add(tipoSanguineo!);
      }
    });
  });
  return listaTipoSanguineo;
}

/*
*  Realiza verificação da quantidade de doadores por tipo sanquineo
* 1 - Calcula quantidade de possiveis doadores por tipo sanguineo
* 2 - Faz validação para cada tipo sanguineo para verificar se é compativel com sangue ou não
* OBS: Somente pessoas com idade de 16 a 69 anos e com peso acima de 50 Kg podem doar sangue.
* */

List<TipoSanguineo> verificaQtdDoadoresPorTipoSanguineo(
    List<Pessoa> pessoas, List<TipoSanguineo> tiposSanguineo) {
  List<TipoSanguineo> listaDoadores = [];
  tiposSanguineo.forEach((tip) {
    var idade = 0;
    var qtdPessoas = 0;
    TipoSanguineo? tipoSanguineo;
    pessoas.forEach((p) {
      idade = calcularIdade(dataAniversario: p.dtNasc!);
      if (idade >= 16 && idade <= 69 && p.peso! > 50) {
        var sanguePessoa = p.tipoSanguineo!;
        if (sanguePessoa == tip.tipoSangue || sanguePessoa == "AB+") {
          qtdPessoas += 1;
        } else {
          if (getDoaApos(sanguePessoa: p.tipoSanguineo!)) {
            qtdPessoas += 1;
          } else if (getDoaAandBandOneg(sanguePessoa: p.tipoSanguineo!)) {
            qtdPessoas += 1;
          } else if (getDoaBpos(sanguePessoa: p.tipoSanguineo!)) {
            qtdPessoas += 1;
          } else if (getDoaABneg(sanguePessoa: p.tipoSanguineo!)) {
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

bool getDoaApos({required String sanguePessoa}) =>
    sanguePessoa == "A-" || sanguePessoa == "O+" || sanguePessoa == "O-";

bool getDoaAandBandOneg({required String sanguePessoa}) => sanguePessoa == "O-";

bool getDoaBpos({required String sanguePessoa}) =>
    sanguePessoa == "B-" || sanguePessoa == "O+" || sanguePessoa == "O-";

bool getDoaABneg({required String sanguePessoa}) =>
    sanguePessoa == "A-" || sanguePessoa == "B-" || sanguePessoa == "O-";

/*
*  Realiza Agendamento da Coleta de Exame do Paciente
* 1 - Faz verificação de checklist de situação antes da coleta
* 2 - Faz verificações, caso estiver algo incorreto aplica multa com base no exame realizado
* */
Exame coletaSangue({required Pessoa pessoa, required Exame exame}) {
  if (exame.dataColeta?.day == DateTime.now().day) {
    pessoa.jejum == true
        ? exame.valorExame = exame.valorExame
        : exame.valorExame = verificaSituacaoExame(
            calcularMulta: (double) {
              0.1;
            },
            valorExame: exame.valorExame!);
  }
  return exame;
}

double verificaSituacaoExame({
  required double valorExame,
  required Function(double) calcularMulta,
}) =>
    valorExame += calcularMulta(valorExame).toStringAsFixed(2);

// Pagamento de coleta de sangue
// Pagar no Ato e ou pagar no resultado do exame
// Se pagar no dia tem desconto 2%
// Se Atrasar para coleta de sangue paga multa
// Se Atrasar a retirada do exame paga Multa
// Cupom de Desconto

/*
*  Realiza Pagamento da Coleta de Exame do Paciente
* 1 - Faz verificação de checklist de situação antes da coleta
* 2 - Faz verificações, se for pagar em dia e se for pagamento em dinheiro ou pix é aplicado desconto
* 3 - Faz verificações, caso estiver algo incorreto aplica multa com base no exame realizado
* */
double realizarPagamentoExame(Exame exame,
    {required TipoPagamento tipoPagamento, required DateTime dataPagamento}) {
  var valorTotal;
  if (dataPagamento.day == exame.dataColeta?.day) {
    valorTotal = desconto(tipoPagamento, valorExame: exame.valorExame!);
  } else {
    valorTotal = jurosPorAtraso(
        dias: calculaDiferencaDeDiasEntreDatas(dataPagamento),
        valorServico: exame.valorExame!,
        jurosPorDia: (double) {
          0.03;
        });
  }
  return valorTotal;
}

double jurosPorAtraso({
  required int dias,
  required double valorServico,
  required Function(double) jurosPorDia,
}) {
  for (var i = 1; i <= dias; i++) {
    double valor = jurosPorDia(valorServico);
    valorServico += valor;
  }
  return double.parse(valorServico.toStringAsFixed(2));
}

double desconto(TipoPagamento pagamento, {required double valorExame}) {
  if (pagamento.tipo == "dinheiro") valorExame - (valorExame * 0.02);
  if (pagamento.tipo == "pix") valorExame - (valorExame * 0.05);
  return valorExame;
}

int calculaDiferencaDeDiasEntreDatas(DateTime data)=> (DateTime.now().difference(data).inHours / 24).round();


// Coleta de amostra de sangue caso COVID:
// Reagente :
// Enviar comunicado para ministério da saúde informando mais 1 positivado
// Encaminhar para repouso em casa atestado 14 dias
// Não Reagente:
// Enviar para casa - repouso de 3 dias

bool verificaCovid(Pessoa pessoa, {required Exame exame}){
  var resultado = false;
  if(exame.nomeExame == "covid")  {
    exame.resultadoCovid == true ? resultado = true :  resultado = false;
  }
  emitirNotificadoSaude(pessoa: pessoa, resultado: resultado);
  return resultado;
}

void emitirNotificadoSaude({required Pessoa pessoa, required bool resultado}){
  Comunicado? comunicado;
  var atestado = 0;
  if(resultado){
    atestado = pessoa.atestado = 14;
    comunicado?.mensagem= "A pessoa $pessoa.nome apresentou reagente POSITIVO, necessita de $atestado dias de isolamento social";
  }else{
    atestado = pessoa.atestado = 3;
    comunicado?.mensagem= "A pessoa $pessoa.nome apresentou reagente NEGATIVO, necessita de $atestado dias de afastamento";
  }
}



/*
* Função para finalizar o atendimento do exame
*  Receber o exame que afim de verificar se o mesmo já foi realizado pagamento
* */
bool finalizarExame(
    Exame exame,
    bool servicoPago,
    ) {
  if (!exame.examePago!) {
    throw Exception("Exame do Paciente não foi Pago, Não Liberar Exame!");
  } else {
    if (servicoPago) {
      return true;
    }
    return false;
  }
}