import 'dart:async';

Future<void> printOrderMessage() async {
  print('Esperando el pedido del usuario...');
  var order = await fetchUserOrder();
  print('Tu pedido es: $order');
}

Future<String> fetchUserOrder() {
  // Imagina que esta función es más compleja y lenta.
  return Future.delayed(const Duration(seconds: 4), () => 'Café Latte Grande');
}

void main() async {
  contarSegundos(4);
  await printOrderMessage();
}

// Puedes ignorar esta función - está aquí para visualizar el tiempo de retraso en este ejemplo.
void contarSegundos(int s) {
  for (var i = 1; i <= s; i++) {
    Future.delayed(Duration(seconds: i), () => print(i));
  }
}
