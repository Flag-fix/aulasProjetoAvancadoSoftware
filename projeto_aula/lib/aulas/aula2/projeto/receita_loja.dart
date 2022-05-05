import 'dart:io';

// Método sem retorno e sem parâmetro
void menuInicial() {
  print("Menu Sistema");

  var qtdProdutos = stdin.readLineSync();

  qtdProdutos == null
      ? print("Erro de execução, digite um valor válido")
      : qtdVendas(int.parse(qtdProdutos));
}

// Método com retorno e sem parâmetro
LojaTI cadastrarVenda() {
  print("Nome do serviço: ");
  String nomeCLiente = stdin.readLineSync()!;

  print("Preço produto: ");
  double precoProduto = double.parse(stdin.readLineSync()!);

  print("Quantas unidades ${nomeCLiente} comprou? ");
  int qtdProdutos = int.parse(stdin.readLineSync()!);

  return LojaTI(
    nomeCliente: nomeCLiente,
    precoPeca: precoProduto,
    qtdPeca: qtdProdutos,
  );
}

// Método com retorno e sem parâmetro
ProdutoLoja cadastroProduto() {
  print("Nome do Produto: ");
  String nomeProduto = stdin.readLineSync()!;

  return ProdutoLoja(
    nomeProduto: nomeProduto,
    listaProdutos: <String>[],
  );
}

// Método com retorno e com parâmetro
qtdVendas(int qtdProdutos) {
  var listaPrint = <String>[];
  double total = 0;

  for (int cont = 1; cont <= qtdProdutos; cont++) {
    double receitaLoja = 0;
    String nomeProduto = ", ";

    var produtoDto = cadastroProduto();

    print("Quantos Produtos foram vendidos na Loja? ");
    var qtdProdutosVendidos = stdin.readLineSync()!;

    for (int cont = 1; cont <= int.parse(qtdProdutosVendidos); cont++) {
      var servicoDto = cadastrarVenda();

      receitaLoja = calculaPrecos(
        servicoDto.qtdPeca,
        servicoDto.precoPeca,
      );
      produtoDto.listaProdutos.add(servicoDto.precoPeca);
    }
    produtoDto.listaProdutos.forEach((i) {
      nomeProduto += i + " ";
    });

    listaPrint.add(
        "O Produto  ${produtoDto.nomeProduto} gerou o total de R\$ ${receitaLoja} com os produtos${nomeProduto}");

    total += receitaLoja;
  }

  listaPrint.forEach((element) {
    print(element);
  });
  return ("Lucro total = R\$ ${total}");
}

double calculaPrecos(int qtdPeca, double precoPeca) {
  return qtdPeca * precoPeca;
}

class LojaTI {
  String nomeCliente;
  double precoPeca;
  int qtdPeca;

  LojaTI(
      {required this.nomeCliente,
      required this.precoPeca,
      required this.qtdPeca});
}

class ProdutoLoja {
  String nomeProduto;
  List listaProdutos;

  ProdutoLoja({required this.nomeProduto, required this.listaProdutos});
}
