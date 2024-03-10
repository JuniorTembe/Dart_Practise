import 'Conta.dart';
import 'dart:io';

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

 
}
