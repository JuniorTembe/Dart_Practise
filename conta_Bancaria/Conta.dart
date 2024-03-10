abstract class Conta {
  String? _titular;
  int? _numeroConta;
  double _saldo = 0;
  String? _dataCriacao;

  Conta(this._titular, this._numeroConta, this._saldo, this._dataCriacao);

  double get saldo => _saldo;
  String? get titular => _titular;
  int? get numeroConta => _numeroConta;
  String? get dataCriacao => _dataCriacao;

  set saldo(double saldo) => _saldo = saldo;
  set titular(String? titular) => _titular = titular;
  set numeroCOnta(int? numeroCOnta) => _numeroConta = numeroConta;
  set dataCriacao(String? dataCriacao) => _dataCriacao = dataCriacao;

  void levantar();
  void depositar();
  void dadosConta();
  void transferirDinheiro();
  void verificarSaldo() {
    print("O seu saldo é de: ${this._saldo}");
  }
}
