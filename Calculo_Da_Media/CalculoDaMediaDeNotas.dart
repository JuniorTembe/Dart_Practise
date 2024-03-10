import 'dart:io';

void main() {
  List<int> numeros = [];
  print("Olá! Bem-vindo ao Edondzo");

  for (int i = 1; i <=4; i++) {
    print("Digite o ${i}º número: ");
    int num = int.parse(stdin.readLineSync()!);
    numeros.add(num);
  }

  double soma = 0;
  for (int i = 0; i < numeros.length; i++) {
    soma += numeros[i];
  }

  double media = soma / numeros.length;
  print("A média das notas é: ${media}");
}
