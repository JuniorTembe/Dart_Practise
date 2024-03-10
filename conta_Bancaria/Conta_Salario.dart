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

  
  
}
