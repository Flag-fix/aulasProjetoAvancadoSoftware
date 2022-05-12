import 'dart:io';

import 'package:robo_trader/sistemaPrincipal/Model/Cliente.dart';

import 'Model/Produto.dart';

List<Produto> produtos = [];
List<Cliente> clientes = [];
List<String> errors = [];

void exibirMenu() {
  var opcao = int.parse(stdin.readLineSync()!);
  while (opcao != 4) {
    if (opcao == 1) cadastrarProduto();
    if (opcao == 2) mostrarProdutos();
    if (opcao == 3) efetuarCompraCliente();
    if (opcao == 4) break;
  }

}

void efetuarCompraCliente() {
  if (clientes.isEmpty) {
    cadastrarCliente();
  } else {
    try {
      listarClientes();
      print("Informe Nome do Cliente");
      var nomeCliente = stdin.readLineSync()!;
      bool retorno = verificarPinCliente(nomeCliente);
      if(retorno){
        realizarCompra();
      }else{
        throw PinCliente(error: 'Pin Incorreto, Tente Novamente');
      }
    } on PinCliente catch (error) {
      errors.add(error.toString());
    } catch (e) {
      throw Exception('Consulte o log $e');
    }
  }
}

void cadastrarProduto() {
  try {
    print("Digite Nome do Produto");
    var nomeProduto = stdin.readLineSync()!;
    print("Digite Valor do Produto");
    var valorProduto = double.parse(stdin.readLineSync()!);
    if (valorProduto == 0) {
      throw ValorProduto('Valor do Produto não pode ser 0');
    } else {
      Produto produto =
          Produto(nomeProduto: nomeProduto, valorProduto: valorProduto);
      produtos.add(produto);
    }
  } on ValorProduto catch (error) {
    errors.add(error.toString());
  } catch (e) {
    throw Exception('Consulte o log $e');
  }
}

void cadastrarCliente() {}

void mostrarProdutos() {
  try {
    if (produtos.isNotEmpty) {
      produtos.forEach((e) {
        e;
      });
    }
  } catch (e) {
    throw Exception('Lista Vazia $e');
  }
}

void listarClientes() {
  try {
    if (clientes.isNotEmpty) {
      clientes.forEach((e) {
        e;
      });
    }
  } catch (e) {
    throw Exception('Lista Vazia $e');
  }
}

bool verificarPinCliente(String nome) {
  bool result = false;
  clientes.forEach((e) {
    if (e.nome == nome) {
      print("Informe Pin do Cliente");
      var pin = int.parse(stdin.readLineSync()!);
      if (e.pin == pin) {
        result = true;
      }
      result = false;
    }
  });
  return result;
}

void realizarCompra(){

}