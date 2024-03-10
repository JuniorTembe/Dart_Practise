import "dart:io";
import "dart:math";

void main() {
  print("Bem vindo ao sistema de calculo de equacão quadratica");
  print(
      "Sabe-se que uma equacao quadratica tem duas variaveis e uma constante");
  print("aX^2 + bX + c = 0");

  print("Digite o valor de a: ");
  String? a = stdin.readLineSync();

  print("Digite o valor de b: ");
  String? b = stdin.readLineSync();

  print("Digite o valor de c: ");
  String? c = stdin.readLineSync();

  int valorA = int.parse(a!);
  int valorB = int.parse(b!);
  int valorC = int.parse(c!);

  int delta = ((valorB *valorB) - (4 * valorA * valorC));

  if (delta <=0) {
    print("nao tem raizes reiais");
    return;
  }
  double x1 = (-valorB + sqrt(delta)) / 2 * valorA;
  double x2 = (-valorB - sqrt(delta)) / 2 * valorA;

  print("As raizes da sua equacão são: \nX1 = ${x1} \nX2 = ${x2}");
}
