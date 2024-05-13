import 'dart:async';

Future<String> createOrderMessage() async {
  var order = await fetchUserOrder();
  return 'Tu pedido es: $order';
}

Future<String> fetchUserOrder() =>
    // Imagina que esta función es
    // más compleja y lenta.
    Future.delayed(
      const Duration(seconds: 2),
      () => 'Café MOCCA Grande',
    );

Future<void> main() async {
  print('Obteniendo pedido del usuario...');
  print(await createOrderMessage());
}
