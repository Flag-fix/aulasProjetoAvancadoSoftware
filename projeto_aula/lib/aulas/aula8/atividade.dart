// *********************
// http://dontpad.com/aulaifpsa

// 1) Para atribuir um valor em um atributo, qual a diferença em:
//  (i) atribuir um valor no atributo na  definição da classe; e
//  (ii) solicitar o seu valor via parâmetro do construtor?
//  R: Ao atribuir um valor diretamente no atributo da classe não fica bom pois dependendo do encapsulamento do atributo não é possivel alterar o valor, e não pode ser alterado não se tornando viável, se tornando um valor default
//  Já no segundo caso é a melhor forma de se fazer pois definimos o tipo do atributo e informamamos oq quisermos para receber no atributo x ou y.

// 2) O que é para que ser construtor? Qual código pode-se definir nele?
//  R: O contrutor server para contruir a classe e inserir os atributos que quisermos e quando quisermos. Podem ser definidos atributos, e definir se é nomeado, obrigatório.
//
// 3) Para que serve "final"? Em que caso utilizamos? Para coletar dados, qual a vantagem e desvantagem?
//  R: final serve para definir que aquela variável é imutável, e executável em tempo de execução. para criar geters e setters e definir seu encapsulamento.
// a vantagem é de que mantemos a segurança da variável, desvantegem de ter que ficar atribuindo seus valores obrigatórios no construtor.

//4) Crie e instancie as classes abaixo. Para cada atributo, atribua valores, altere os valores e imprima-os.
// * → obrigatório
// = valor (valor padrão)
// ? pode ser nulo
// Caso não esteja implícito, de acordo com o contexto, defina se os atributos podem ser nulos ou não e se podem ser privado ou não.
// a) Bola{cor=branco,tamanho=7, categoria?}
// b) Professor{ id, nome, cpf, e-mail} >> inicialize todos os atributos no contrutor
// c) Aluno{ ra, nome, cpf, telefone} >> com todos os atributos final, inicialize todos os atributos no contrutor
//  utilizando parâmetros nomeados
// d) Peça{código, nome, descrição, preço de custo}
// → get nome e descição, get preço de venda (30% sobre o preço de custo)
// → set código - somente números positivos
// → set preço de custo - somente valore positivos
// e) Carro{nome, ano fabricação}
// → get tempo de uso, get nome e ano fabricação
// → set ano fabricação - somente ano positivo e coerente
// f) Cidade{nome,Estado{nome,sigla}}
// g) Funcionario{nome, cpf, telefone, Cidade{nome,Estado{nome,sigla}}}
// h) Peca{nome,Tipo{nome,Categoria{nome, descirção}},Unidade de Medida{sigla, descricao},
//    Fabricante{nome,Cidade{nome,Estado{nome,sigla}} }}
// i) Faça 4 classes do seu estudo de caso utilizando tudo que aprendeu hoje.

class Bola {
  String cor = "Branco";
  int tamanho = 7;
  String? categoria;
}

class Professor {
  int id;
  String nome;
  String cpf;
  String email;

  Professor(this.id, this.nome, this.cpf, this.email);
}

class Aluno {
  final int ra;
  final String nome;
  final String cpf;
  final String telefone;

  Aluno(
      {required this.ra,
      required this.nome,
      required this.cpf,
      required this.telefone});
}

class Peca1 {
  int codigo;
  String nome;
  String descricao;
  double precoCusto;

  getNome() {
    return nome;
  }

  getDescricao() {
    return descricao;
  }

  getPrecoVenda() {
    return precoCusto - (precoCusto * 0.7);
  }

  setCodigo(int codigo) {
    if (codigo > 0) this.codigo = codigo;
  }

  setPrecoCusto(double precoCusto) {
    if (precoCusto > 0) this.precoCusto = precoCusto;
  }

  Peca1(this.codigo, this.nome, this.descricao, this.precoCusto);
}

class Carro {
  String nome;
  int anoFabricacao;

  getTempoUso() {
    return DateTime.now().year - anoFabricacao;
  }

  getNome() {
    return nome;
  }

  getAnoFabricacao() {
    return anoFabricacao;
  }

  setAnoFabricacao(int anoFabricacao) {
    if (anoFabricacao > 1900) this.anoFabricacao = anoFabricacao;
  }

  Carro(this.nome, this.anoFabricacao);
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

class Funcionario {
  String nome;
  String cpf;
  int telefone;
  Cidade cidade;

  Funcionario(this.nome, this.cpf, this.telefone, this.cidade);
}

class UnidadeMedida {
  String sigla;
  String descricao;

  UnidadeMedida(this.sigla, this.descricao);
}

class Categoria {
  String nome;
  String descricao;

  Categoria(this.nome, this.descricao);
}

class Tipo {
  String nome;
  Categoria categoria;

  Tipo(this.nome, this.categoria);
}

class Peca {
  String nome;
  Tipo tipo;

  Peca(this.nome, this.tipo);
}

class Fabricante {
  String nome;
  Cidade cidade;

  Fabricante(this.nome, this.cidade);
}

void main(List<String> args) {}


class Pessoa {
  String? nome;
  DateTime? dtNasc;
  double? peso;
  String? sexo;
  double? altura;
  bool? jejum;
  int? atestado;

  Pessoa(
      {this.nome,
      this.dtNasc,
      this.peso,
      this.jejum,
      this.atestado,
      this.sexo,
      this.altura});
}


class TipoPagamento {
  late String? tipo;
  late double? valorTotal;

  TipoPagamento({
    required this.tipo,
    this.valorTotal,
  });
}



class ControleVeiculo {
  final int localControle;
  final DateTime dataSolicitacao;
  final String placaVeiculo;
  final String cnhCondutor;

  getPlacaVeiculo(){
    return placaVeiculo;
  }

  ControleVeiculo(
      {required this.localControle,
      required this.dataSolicitacao,
      required this.placaVeiculo,
      required this.cnhCondutor});
}

class Refeitorio {
  final String refeitorio;
  final DateTime data_solicitacao;
  final DateTime dataRequisicao;
  final String itemConsumo;
  final int quantidade;

  Refeitorio(
      {required this.refeitorio,
      required this.data_solicitacao,
      required this.dataRequisicao,
      required this.quantidade,
      required this.itemConsumo});
}
