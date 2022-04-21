double vendaProduto(int quantidade, double valorProduto) =>
    quantidade * valorProduto;

double descontoProduto(double valorProduto, double desconto) =>
    valorProduto - (valorProduto * (desconto / 100));

// Mudar para 
double atualizarValorProduto(double novoValor) => novoValor;

void main() {
  print(descontoProduto(100, 10));
}
