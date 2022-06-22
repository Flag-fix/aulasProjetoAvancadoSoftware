import 'dart:io';

void main(List<String> arguments) {

}


double verificarValorFinal(double valor1, double valor2, Function definirValor){
  double valor = definirValor(valor1,valor2);
  return valor;
}

void verificarValor(double valor){
  if(valor < 0) throw Exception('Desconto inválido');
}

double calcularValorTotal(double valor1, double valor2){
  verificarValor(valor1);
  verificarValor(valor2);
  var valorTotal = valor1 + valor2;
  return valorTotal;
}

int verificarQuantidadeParcelamento(double valor1, double valor2){
  verificarValor(valor1);
  verificarValor(valor2);
  var valorTotal = valor1 + valor2;
  var quantidadeParcelas;
  valorTotal > 200 ? quantidadeParcelas = 10 : quantidadeParcelas = 3;
  return quantidadeParcelas;
}

double calcularValorTotalComDesconto(double valor1, double valor2){
  verificarValor(valor1);
  verificarValor(valor2);
  var valorTotal = valor1 + valor2;
  return calculaDesconto(valorTotal);
}

double calculaDesconto(double valor){
  valor > 200 ? valor-=(valor*0.5) : valor-=(valor*0.1);
  return valor;
}
