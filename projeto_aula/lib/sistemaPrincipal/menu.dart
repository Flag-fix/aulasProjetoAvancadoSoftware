import 'dart:io';

import 'package:robo_trader/sistemaPrincipal/Model/ClienteFisica.dart';

import 'Controller/funcoesSistema.dart';
import 'Model/Produto.dart';

List<Produto> produtos = [];
List<ClienteFisica> clientes = [];
List<String> errors = [];

void exibirMenu() {
  var opcao;
  print("Informe uma opção");
  while (opcao != 4) {
    opcao = int.parse(stdin.readLineSync()!);
    if (opcao == 1) cadastrarProduto();
    if (opcao == 2) listarProdutos();
    if (opcao == 3) efetuarCompraCliente();
    if (opcao == 4) break;
  }
}
