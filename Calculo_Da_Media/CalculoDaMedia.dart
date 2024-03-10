import 'dart:io';

void main() {
  List<int> numeros = [];
  bool continuar = true;

  while (continuar) {
    print('Digite um número:');
    String entrada = stdin.readLineSync()!;
    numeros.add(int.parse(entrada));

    print('Deseja adicionar outro número? (S/N)');
    String resposta = stdin.readLineSync()!.toUpperCase();
    if (resposta != 'S') {
      continuar = false;
    }
  }

  
  double soma = 0;
  for (int numero in numeros) {
    soma += numero;
  }
  double media = numeros.isEmpty ? 0 : soma / numeros.length;

  print('Os números digitados foram: $numeros');
  print('A média dos números é: $media');
}
