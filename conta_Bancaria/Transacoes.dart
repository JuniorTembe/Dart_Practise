import "dart:io";

class Transacoes {
  void depositar(String numeroConta, double valor) {
  try {
    if (valor <= 0) {
      print('Erro: O valor do depósito deve ser maior que zero.');
      return;
    }

    // Ler os detalhes da conta do arquivo
    File file = File('database/$numeroConta.txt');
    String conteudo = file.readAsStringSync();
    List<String> linhas = conteudo.split('\n');
    double saldoAtual = double.parse(linhas[3].split(': ')[1]);

    // Atualizar o saldo na memória
    saldoAtual += valor;

    // Escrever o saldo atualizado no arquivo
    linhas[3] = 'Saldo: $saldoAtual';
    file.writeAsStringSync(linhas.join('\n'));

    print('Depósito de $valor efetuado com sucesso!');
  } catch (e) {
    print('Erro ao realizar depósito: $e');
  }
}


void transferir(String numeroConta, String contaDestino, double valor) {
  try {
    // Verificar se o número da conta de destino possui 11 dígitos e começa com '11010'
    if (contaDestino.length != 11 || !contaDestino.startsWith('11010')) {
      print('Número de conta de destino inválido.');
      return;
    }

    // Ler os detalhes da conta de origem
    File fileOrigem = File('database/$numeroConta.txt');
    if (!fileOrigem.existsSync()) {
      print('Conta de origem não encontrada.');
      return;
    }

    String conteudoOrigem = fileOrigem.readAsStringSync();
    List<String> linhasOrigem = conteudoOrigem.split('\n');
    double saldoOrigem = double.parse(linhasOrigem.firstWhere((line) => line.startsWith('Saldo')).split(': ')[1]);

    // Verificar se o saldo é suficiente para a transferência
    if (saldoOrigem < valor) {
      print('Saldo insuficiente para transferir $valor.');
      return;
    }

    // Atualizar o saldo da conta de origem
    saldoOrigem -= valor;
    linhasOrigem[3] = 'Saldo: $saldoOrigem';
    fileOrigem.writeAsStringSync(linhasOrigem.join('\n'));

    // Ler os detalhes da conta de destino
    File fileDestino = File('database/$contaDestino.txt');
    if (!fileDestino.existsSync()) {
      print('Conta de destino não encontrada.');
      return;
    }

    String conteudoDestino = fileDestino.readAsStringSync();
    List<String> linhasDestino = conteudoDestino.split('\n');
    double saldoDestino = double.parse(linhasDestino.firstWhere((line) => line.startsWith('Saldo')).split(': ')[1]);

    // Atualizar o saldo da conta de destino
    saldoDestino += valor;
    linhasDestino[3] = 'Saldo: $saldoDestino';
    fileDestino.writeAsStringSync(linhasDestino.join('\n'));

    print('Transferência de $valor para a conta $contaDestino realizada com sucesso.');
  } catch (e) {
    print('Erro ao transferir: $e');
  }
}




  void levantar(String numeroConta, double valor) {
  try {
    // Ler os detalhes da conta do arquivo
    File file = File('database/$numeroConta.txt');
    String conteudo = file.readAsStringSync();
    List<String> linhas = conteudo.split('\n');
    double saldoAtual = double.parse(linhas[3].split(': ')[1]);

    // Verificar se há saldo suficiente para levantar o valor desejado
    if (valor > saldoAtual) {
      print('Erro: Saldo insuficiente para levantar $valor');
      return;
    }

    // Atualizar o saldo na memória
    saldoAtual -= valor;

    // Escrever o saldo atualizado no arquivo
    linhas[3] = 'Saldo: $saldoAtual';
    file.writeAsStringSync(linhas.join('\n'));

    print('Levantamento de $valor efetuado com sucesso!');
  } catch (e) {
    print('Erro ao realizar levantamento: $e');
  }
}


  void verificarSaldo(String numeroConta) {
  try {
    // Ler os detalhes da conta do arquivo
    File file = File('database/$numeroConta.txt');
    String conteudo = file.readAsStringSync();
    List<String> linhas = conteudo.split('\n');
    
    // Encontrar e imprimir o saldo
    String saldoLine = linhas.firstWhere((line) => line.startsWith('Saldo'));
    double saldo = double.parse(saldoLine.split(': ')[1]);
    print('O saldo da conta $numeroConta é: $saldo');
  } catch (e) {
    print('Erro ao verificar saldo: $e');
  }
}


  void verificarExtrato(String numeroConta) {}
}
