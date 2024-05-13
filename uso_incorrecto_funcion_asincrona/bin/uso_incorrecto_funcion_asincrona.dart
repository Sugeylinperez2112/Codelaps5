import 'dart:async';

Future<String> fetchUserOrder() =>
    // Imagina que esta función es más compleja y lenta.
    Future.delayed(
      const Duration(seconds: 2),
      () => 'Café con leche grande',
    );

Future<String> createOrderMessage() async {
  var order = await fetchUserOrder();
  return 'Tu pedido es: $order';
}

void main() async {
  print(await createOrderMessage());
}
