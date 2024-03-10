import "dart:io";
import "dart:math";

import "Conta.dart";
import "Conta_Prazo.dart";
import "Conta_Salario.dart";

class Menu {
  

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
        criarContaSalario();
        break;
      case 2:
        criarContaPrazo();
        break;
      default:
        print("Opção inválida. Tente novamente.");
        criarTipoConta();
    }
  }

  // cria uma conta salario
  void criarContaSalario() {
    String? titular;
    double? saldo;
    int? nuit;

    do {
      stdout.write("Digite o nome do titular da conta (mínimo 3 caracteres): ");
      titular = stdin.readLineSync();
    } while (titular == null || titular.length < 3);

    do {
      stdout.write(
          "Digite o saldo inicial (deve ser maior ou igual a 4000 MZN): ");
      saldo = double.tryParse(stdin.readLineSync() ?? '');
    } while (saldo == null || saldo < 4000);

    do {
      stdout.write("Digite o número NUIT (deve ter 6 dígitos): ");
      String? input = stdin.readLineSync();
      nuit = int.tryParse(input ?? '');
      if (nuit != null && input!.length != 6) {
        nuit = null;
      }
    } while (nuit == null);
    String numConta = gerarNumeroConta();
    ContaSalario conta =
        new ContaSalario(nuit, titular, numConta, saldo, obterDataHoraAtual());
    salvarDetalhesContaSalario(conta);
    print("Conta criada com sucesso! seu numero de Conta é : ${numConta}");
  }

  // cria uma conta prazo
  void criarContaPrazo() {
    String? titular;
    double? saldo;
    String? dataMaturidade;
    bool? autorenovavel;
    int? periodoAplicacao;

    do {
      stdout.write("Digite o nome do titular da conta (mínimo 3 caracteres): ");
      titular = stdin.readLineSync();
    } while (titular == null || titular.length < 3);

    do {
      stdout.write(
          "Digite o saldo inicial (deve ser maior ou igual a 4000 MZN): ");
      saldo = double.tryParse(stdin.readLineSync() ?? '');
    } while (saldo == null || saldo < 4000);

    do {
      stdout.write("Digite a data de maturidade (yyyy-mm-dd): ");
      dataMaturidade = stdin.readLineSync();
      if (dataMaturidade != null && !isValidDate(dataMaturidade)) {
        print("Data de maturidade inválida. Por favor, tente novamente.");
      }
    } while (dataMaturidade == null || !isValidDate(dataMaturidade));

    do {
      stdout.write("A conta é autorrenovável? (S/N): ");
      String? resposta = stdin.readLineSync()?.toUpperCase();
      if (resposta == 'S') {
        autorenovavel = true;
      } else if (resposta == 'N') {
        autorenovavel = false;
      } else {
        print("Resposta inválida. Por favor, digite S ou N.");
      }
    } while (autorenovavel == null);

    do {
      stdout.write("Digite o período de aplicação (em anos): ");
      periodoAplicacao = int.tryParse(stdin.readLineSync() ?? '');
      if (periodoAplicacao == null || periodoAplicacao <= 0) {
        print("Período de aplicação inválido. Deve ser um número positivo.");
      }
    } while (periodoAplicacao == null || periodoAplicacao <= 0);

    String numConta = gerarNumeroConta();
    ContaPrazo conta = new ContaPrazo(
      titular,
      numConta,
      saldo,
      obterDataHoraAtual(),
      dataMaturidade,
      autorenovavel,
      periodoAplicacao,
    );
    salvarDetalhesContaPrazo(conta);

    print("Conta a prazo criada com sucesso! Seu número de conta é: $numConta");
  }

  // gera um numero de conta
  String gerarNumeroConta() {
    String numeroConta = '11010';

    Random random = Random();
    for (int i = 0; i < 6; i++) {
      numeroConta += random.nextInt(10).toString();
    }

    return numeroConta;
  }

  // Obtem a data e a hora de hoje
  String obterDataHoraAtual() {
    DateTime agora = DateTime.now();
    String dataHoraAtual =
        '${agora.year}-${_formatarNumero(agora.month)}-${_formatarNumero(agora.day)} ';
    dataHoraAtual +=
        '${_formatarNumero(agora.hour)}:${_formatarNumero(agora.minute)}:${_formatarNumero(agora.second)}';
    return dataHoraAtual;
  }

  String _formatarNumero(int numero) {
    return numero < 10 ? '0$numero' : '$numero';
  }

  // verifica se a data informada pelo usuario está no formato correcto
  bool isValidDate(String input) {
    if (input.length != 10) {
      return false;
    }

    if (input[4] != '-' || input[7] != '-') {
      return false;
    }

    List<String> parts = input.split('-');

    if (parts.length != 3) {
      return false;
    }

    try {
      int year = int.parse(parts[0]);
      int month = int.parse(parts[1]);
      int day = int.parse(parts[2]);

      if (year < 1000 ||
          year > 9999 ||
          month < 1 ||
          month > 12 ||
          day < 1 ||
          day > 31) {
        return false;
      }
    } catch (e) {
      return false;
    }

    return true;
  }

  void salvarDetalhesContaSalario(ContaSalario conta) {
    try {
      Directory databaseDir = Directory("database/ContaSalario");
      if (!databaseDir.existsSync()) {
        databaseDir.createSync();
      }

      File file = File('${databaseDir.path}/${conta.numeroConta}.txt');
      String detalhesConta = '''
        Tipo de Conta: Conta Salário
        Titular: ${conta.titular}
        Número da Conta: ${conta.numeroConta}
        Saldo: ${conta.saldo}
        NUIT: ${conta.nuit}
        Data e Hora de Abertura: ${conta.dataCriacao}
      ''';

      file.writeAsStringSync(detalhesConta);
      print('Detalhes da conta salário salvos com sucesso!');
    } catch (e) {
      print('Erro ao salvar os detalhes da conta salário: $e');
    }
  }

  // Método para salvar os detalhes da conta a prazo
  void salvarDetalhesContaPrazo(ContaPrazo conta) {
    try {
      Directory databaseDir = Directory("database/ContaPrazo");
      if (!databaseDir.existsSync()) {
        databaseDir.createSync();
      }

      File file = File('${databaseDir.path}/${conta.numeroConta}.txt');
      String detalhesConta = '''
        Tipo de Conta: Conta Prazo
        Titular: ${conta.titular}
        Número da Conta: ${conta.numeroConta}
        Saldo: ${conta.saldo}
        Data e Hora de Abertura: ${conta.dataCriacao}
        Data de Maturidade: ${conta.dataMaturidade}
        Autorrenovável: ${conta.autorenovavel ? 'Sim' : 'Não'}
        Período de Aplicação: ${conta.periodoAplicacao} anos
      ''';

      file.writeAsStringSync(detalhesConta);
      print('Detalhes da conta a prazo salvos com sucesso!');
    } catch (e) {
      print('Erro ao salvar os detalhes da conta a prazo: $e');
    }
  }

  void atualizarDetalhesContaSalario(String novoSaldo) {
    try {
      File file = File('detalhes_conta_salario.txt');

      String conteudo = file.readAsStringSync();

      List<String> linhas = conteudo.split('\n');

      linhas[2] = 'Saldo: $novoSaldo';

      file.writeAsStringSync(linhas.join('\n'));

      print('Saldo da conta salário atualizado com sucesso!');
    } catch (e) {
      print('Erro ao atualizar o saldo da conta salário: $e');
    }
  }
}
