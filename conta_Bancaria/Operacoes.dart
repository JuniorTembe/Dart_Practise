import 'dart:io';
class Operacoes{
  void menuPrincipal() {
    print("1 - Levantar Dinheiro");
    print("2 - Depositar Dinheiro");
    print("3 - Trasferir Dinheiro");
    print("4 - Verificar Saldo");
    print("5 - Dados da Conta ");
    print("6 - Extrato da Conta");

    String? opcao = stdin.readLineSync();

    switch (opcao) {
      case 1:
        print("Digite o numero da conta:");
        String? numCont = stdin.readLineSync();
        break;
      case 2:
        break;
      case 3:
        break;
      case 4:
        break;
      case 5:
        break;
      case 6:
        break;
      default:
    }
  }
}