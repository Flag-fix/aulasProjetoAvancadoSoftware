import 'dart:io';

void main() {

  var nome = stdin.readLineSync()!;
  var numero = int.parse(stdin.readLineSync()!);
  var valido = stdin.readLineSync()! == 'S';
  var dataNasc = DateTime.parse(stdin.readLineSync()!);
  var sexo = stdin.readLineSync()!;
  //var alunoFinal = Aluno2(nome: nome, numero: numero, valido: valido, dataNascimento: dataNasc, sexo: sexo);
  //print(alunoFinal);

  Estado estado = Estado(nome: 'Paraná', sigla: 'PR');
  Aluno aluno = Aluno(
    nome: 'Joaquim',
    reg
  )

}

MinhaClasse minhaClasse = new MinhaClasse();
MinhaClasse minhaClasse2 = MinhaClasse();

class MinhaClasse {}

class MinhaClasseQuatro {
  String? nome;
  int? numero;
  bool? valido;
  MinhaClasseQuatro(String valor) {
    nome = valor;
  }
}

class MinhaClasseCompleta {
  String? nome;
  int? numero;
  bool? valido;
  MinhaClasseCompleta(String nome, int numero, bool valido) {
    this.nome = nome;
    this.numero = numero;
    this.valido = valido;
  }
}

class MinhaClasseSimplificada {
  String? nome;
  int? numero;
  bool? valido;
  MinhaClasseSimplificada(this.nome, this.numero, this.valido);
}

class MinhaClasseSimples {
  late String? nome;
  late int? numero;
  late bool? valido;
  MinhaClasseSimples();
}

class Aluno2 {
  final String nome;
  final int numero;
  final bool valido;
  final String sexo;
  int _anonascimento;

  set anoNascimento(int anoNascimento){
    if(anoNascimento > 0 ) _anonascimento = anoNascimento;
  }

  int get idade {
    var anoAtual = DateTime.now().year;
    var idade = anoAtual - _anonascimento;
    return idade;
  }

  Aluno2(this._anonascimento, {required this.nome, required this.numero, required this.valido, required this.sexo});
}

class Aluno extends Pessoa{
  final int registroAcademico;

  Aluno(String nome, int numero, bool valido, String sexo, this.registroAcademico) : super(nome, numero, valido, sexo);
}


class Professor extends Pessoa{
  final int siape;

  Professor(Cidade cidade) : super(cidade);
}


class Estado {
  String nome;
  String sigla;

  Estado({required this.nome, required this.sigla});
}

class Cidade {
  String nome;
  Estado estado;

  Cidade({required this.nome, required this.estado});
}

class Pessoa{
  final String nome;
  final int numero;
  final bool valido;
  final String sexo;
  final Cidade cidade;

  Pessoa(this.cidade, {required this.nome, required this.numero, required this.valido, required this.sexo});
}

