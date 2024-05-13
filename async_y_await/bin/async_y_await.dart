import 'dart:async';

Future<void> main() async {
  print(await createOrderMessage());
}

Future<String> createOrderMessage() async {
  var order = await fetchUserOrder();
  return 'Tu pedido es: $order';
}

Future<String> fetchUserOrder() {
  // Simulando una operación de obtención de pedido del usuario
  return Future.delayed(const Duration(seconds: 2), () => 'Café Latte Grande');
}
