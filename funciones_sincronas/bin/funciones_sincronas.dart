import 'dart:async';

Future<String> fetchUserOrder() =>
    // Imagina que esta función es
    // más compleja y lenta.
    Future.delayed(
      const Duration(seconds: 2),
      () => 'Café Latte Grande',
    );

String createOrderMessage() {
  var order = fetchUserOrder();
  return 'Tu pedido es: $order';
}

Future<void> main() async {
  print('Obteniendo pedido del usuario...');
  print(createOrderMessage());
}
