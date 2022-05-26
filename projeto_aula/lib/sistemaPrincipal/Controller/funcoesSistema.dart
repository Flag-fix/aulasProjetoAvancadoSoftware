import 'dart:convert';
import 'dart:math';

// void cadastrarCliente(ClienteFisica cliente) {
//   try {
//     var nomeCliente = cliente.nome;
//     var pin = cliente.pin;
//     if (cliente.pin == 0) {
//       throw PinCliente(error: ' Pin não pode ser $pin');
//     } else {
//       ClienteFisica cliente =
//           ClienteFisica(nome: nomeCliente, valorTotalCompra: 0, pin: pin);
//       clientes.add(cliente);
//     }
//   } on PinCliente catch (error) {
//     errors.add(error.toString());
//   } catch (e) {
//     throw Exception('Consulte o log $e');
//   }
// }

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

criptografarPin(var pinRandomSeguro) {
  var random = List<int>.generate(5, (i) => pinRandomSeguro.nextInt(256));
  var pin = base64Url.encode(random);
  return pin;
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

Random geradorpin() {
  return Random.secure();
}

double calcularReceita(List produtos) {
  try {
    double total = 0;
    if (produtos.isNotEmpty) {
      produtos.forEach((e) {
        total += e.valorProduto;
      });
    }
    return total;
  } catch (e) {
    throw Exception('Lista Vazia $e');
  }
}
