void main() {
  List<int> numeros = [10, 5, 8, 20, 15, 25, 18, 30, 12];
  
  if (numeros.length < 2) {
    print("O array deve ter pelo menos dois números para encontrar o segundo maior.");
    return;
  }

  int maior = numeros[0];
  int segundoMaior = numeros[1];

  for (int i = 2; i < numeros.length; i++) {
    if (numeros[i] > maior) {
      segundoMaior = maior;
      maior = numeros[i];
    } else if (numeros[i] > segundoMaior && numeros[i] != maior) {
      segundoMaior = numeros[i];
    }
  }

  print("O segundo maior número é: $segundoMaior");
}
