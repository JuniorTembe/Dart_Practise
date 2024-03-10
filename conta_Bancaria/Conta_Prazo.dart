import 'Conta.dart';

class ContaPrazo extends Conta {
  String? _dataMaturidade;
  bool _autorenovavel = false;
  int _periodoAplicacao = 0;
  

  ContaPrazo(
      String titular,
      String numeroConta,
      double saldo,
      String dataCriacao,
      this._dataMaturidade,
      this._autorenovavel,
      this._periodoAplicacao)
      : super(titular, numeroConta, saldo, dataCriacao);

  String? get dataMaturidade => _dataMaturidade;
  set dataMaturidade(String? dataMaturidade) =>
      _dataMaturidade = dataMaturidade;

  bool get autorenovavel => _autorenovavel;
  set autorenovavel(bool autorenovavel) => _autorenovavel = autorenovavel;

  int get periodoAplicacao => _periodoAplicacao;
  set periodoAplicacao(int periodoAplicacao) =>
      _periodoAplicacao = periodoAplicacao;



  @override
  void dadosConta() {
    print("< ------- Dados da conta ------- >");
    print(
        "Titular: ${this.titular} \nNumero da Conta: ${this.numeroConta} \nData de Criacão: ${this.dataCriacao} \nData de Maturidade: ${this.dataMaturidade} \nPeriodo de Aplicacão: ${this._periodoAplicacao} \n");
  }

  @override
  void depositar(double valor) {
    if (valor <= 0) {
      print("Não é possivel depositar o valor informado!");
    }
    this.saldo += valor;
  }

  @override
  void levantar(double valor) {
    if (valor + 100 > this.saldo) {
      print("Saldo insuficiente para levantar ${valor}");
    }
    this.saldo - valor;
    print("Efectuou um levantamento de ${valor} aos ");
  }

  @override
  void transferirDinheiro(int contaDestino, double valor) {
    if (valor > this.saldo) {
      print("Erro! O seu saldo é insuficiente para trasferir ${valor}");
    }
    
  }

  @override
  void verificarSaldo() {
    print("O seu saldo é de: ${this.saldo}");
  }
}
