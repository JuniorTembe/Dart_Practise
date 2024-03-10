abstract class Conta {
  String? _titular;
  int? _numeroConta;
  double _saldo = 0;
  String? _dataCriacao;

  Conta(String titular, int numeroConta, double saldo, String dataCriacao) {
    this._titular = titular;
    this._numeroConta = numeroConta;
    this._dataCriacao = dataCriacao;
    this._saldo = saldo;
  }

  double get saldo => _saldo;
  String? get titular => _titular;
  int? get numeroConta => _numeroConta;
  String? get dataCriacao => _dataCriacao;

  set saldo(double saldo) => _saldo = saldo;
  set titular(String? titular) => _titular = titular;
  set numeroCOnta(int? numeroCOnta) => _numeroConta = numeroConta;
  set dataCriacao(String? dataCriacao) => _dataCriacao = dataCriacao;

  void levantar(double valor);
  void depositar(double valor);
  void dadosConta();
  void transferirDinheiro(int contaDestino, double valor);
  void verificarSaldo();
}
