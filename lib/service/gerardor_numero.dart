import 'dart:math';

class GeradorNumeroAletario {

  int gerarNumeroAleatorio() {
    Random randomGerado = Random();
    return randomGerado.nextInt(1000);
  }
}
