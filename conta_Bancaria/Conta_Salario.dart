import 'Conta.dart';

class ContaSalario extends Conta {
  int? _nuit;

  ContaSalario(
    this._nuit,
    String titular,
    String numeroConta,
    double saldo,
    String dataCriacao,
  ) : super(titular, numeroConta, saldo, dataCriacao);

  int? get nuit => _nuit;
  set nuit(int? nuit) => _nuit = nuit;

  @override
  void dadosConta() {
    print("< ------- Dados da conta ------- >");
    print(
        "Titular: ${this.titular} \nNumero da Conta: ${this.numeroConta} \nData de Criacão: ${this.dataCriacao} \nNuit: ${this._nuit}");
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
    if (valor + 85 > this.saldo) {
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
