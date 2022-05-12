import 'dart:io';

// import 'package:dartz/dartz.dart';

import '../Model/ClienteFisica.dart';
import '../Model/Exceptions.dart';
import '../Model/Produto.dart';
import '../menu.dart';

void efetuarCompraCliente() {
  if (clientes.isEmpty) {
    cadastrarCliente();
  } else {
    try {
      listarClientes();
      print("Informe Nome do Cliente");
      var nomeCliente = stdin.readLineSync()!;
      bool retorno = verificarPinCliente(nomeCliente);
      if (retorno) {
        realizarCompra(nomeCliente);
      } else {
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

void cadastrarCliente() {
  try {
    print("Digite nome do Cliente");
    var nomeCliente = stdin.readLineSync()!;
    print("Digite Pin para Realizar Compra");
    var pin = int.parse(stdin.readLineSync()!);
    if (pin == 0) {
      throw PinCliente(error: ' Pin não pode ser $pin');
    } else {
      ClienteFisica cliente =
          ClienteFisica(nome: nomeCliente, valorTotalCompra: 0, pin: pin);
      clientes.add(cliente);
    }
  } on PinCliente catch (error) {
    errors.add(error.toString());
  } catch (e) {
    throw Exception('Consulte o log $e');
  }
}

void listarProdutos() {
  try {
    if (produtos.isNotEmpty) {
      produtos.forEach((e) {
        print(e.nomeProduto);
        print(e.valorProduto);
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
        print(e.nome);
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

void realizarCompra(String nomeCliente) {
  listarProdutos();
  print("Informe nome do Produto");
  var produto = stdin.readLineSync()!;
  produtos.forEach((prod) {
    if (prod.nomeProduto == produto) {
      clientes.forEach((cli) {
        if (cli.nome == nomeCliente) {
          cli.valorTotalCompra = prod.valorProduto;
        }
      });
    }
  });
}

// class EitherTest {
//   late Either<ClienteFisica, ClienteJuridica> pessoaTipo;
//
//   EitherTest(dynamic choice) {
//     if (pessoaTipo is ClienteJuridica) {
//       pessoaTipo = Right(choice);
//     } else {
//       pessoaTipo = Left(choice);
//     }
//   }
// }
