import "dart:io";
import "Conta_Prazo.dart";
import "Operacoes.dart";
import "Transacoes.dart";

class Menu {
  Operacoes operacoes = new Operacoes();

  void criarConta() {
    print("< ---------- Banco LDS ---------- >\n");
    print("Seja bem-vindo ao nosso banco\n");
    print("Deseja criar uma conta?\n");
    print("1 - SIM");
    print("2 - NÃO");

    String? opc1 = stdin.readLineSync();
    int Opc01 = int.tryParse(opc1!) ?? 0;

    switch (Opc01) {
      case 1:
        criarTipoConta();
        break;
      case 2:
        print("Obrigado, volte sempre!");
        break;
      default:
        print("Opção inválida. Tente novamente.");
        criarConta();
    }
  }

  void criarTipoConta() {
    print("Qual tipo de conta deseja abrir? \n");
    print("1 - Conta Salário");
    print("2 - Conta a Prazo");

    String? opc2 = stdin.readLineSync();
    int Opc02 = int.tryParse(opc2!) ?? 0;

    switch (Opc02) {
      case 1:
        operacoes.criarContaSalario();
        break;
      case 2:
        operacoes.criarContaPrazo();
        break;
      default:
        print("Opção inválida. Tente novamente.");
        criarTipoConta();
    }
  }

  void menuPrincipal() {
    Transacoes transacoes = Transacoes();

    print("1 - Levantar Dinheiro");
    print("2 - Depositar Dinheiro");
    print("3 - Transferir Dinheiro");
    print("4 - Verificar Saldo");
    print("5 - Dados da Conta");
    print("6 - Extrato da Conta");
    print("7 - Criar Conta");

    String? opcao = stdin.readLineSync();

    switch (opcao) {
      case '1':
        print("Digite o seu número da conta:");
        String? numConta1 = stdin.readLineSync();
        print("Digite o valor a levantar:");
        double valor1 = double.parse(stdin.readLineSync() ?? '0');
        transacoes.levantar(numConta1!, valor1);
        break;
      case '2':
        print("Digite o seu número da conta:");
        String? numConta2 = stdin.readLineSync();
        print("Digite o valor a depositar:");
        double valor2 = double.parse(stdin.readLineSync() ?? '0');
        transacoes.depositar(numConta2!, valor2);
        break;
      case '3':
        print("Digite o número da conta de origem:");
        String? numContaOrigem = stdin.readLineSync();
        print("Digite o número da conta de destino:");
        String? numContaDestino = stdin.readLineSync();
        print("Digite o valor a transferir:");
        double valor3 = double.parse(stdin.readLineSync() ?? '0');
        transacoes.transferir(numContaOrigem!, numContaDestino!, valor3);
        break;
      case '4':
        print("Digite o seu número da conta:");
        String? numConta4 = stdin.readLineSync();
        transacoes.verificarSaldo(numConta4!);
        break;
      case '5':
        print("Digite o número da conta:");
        String? numConta5 = stdin.readLineSync();
        print("Por desenvolver");
        break;
      case '6':
        print("Digite o número da conta:");
        String? numConta6 = stdin.readLineSync();
        print("Por desenvolver");
        break;
      case '7':
        criarTipoConta();
        break;
      default:
        print("Opção inválida.");
    }
  }
}
