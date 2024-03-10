import 'dart:io';

void main() {
  print('Digite um número:');
  String numero = stdin.readLineSync()!;
  

  List<String> digitos = numero.split('');
  
  
  int soma = 0;
  for (String digito in digitos) {
    if (digito.isNotEmpty) {
      soma += int.parse(digito);
    }
  }

  print('A soma dos dígitos de $numero é $soma.');
}
