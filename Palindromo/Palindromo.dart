import 'dart:io';

void main() {
  print("Digite uma palavra ou frase para verificar se é um palíndromo:");
  String palavra = stdin.readLineSync()!.toLowerCase().replaceAll(' ', '');

  if (ehPalindromo(palavra)) {
    print("É um palíndromo.");
  } else {
    print("Não é um palíndromo.");
  }
}

bool ehPalindromo(String palavra) {
  int inicio = 0;
  int fim = palavra.length - 1;

  while (inicio < fim) {
    if (palavra[inicio] != palavra[fim]) {
      return false;
    }
    inicio++;
    fim--;
  }
  return true;
}
