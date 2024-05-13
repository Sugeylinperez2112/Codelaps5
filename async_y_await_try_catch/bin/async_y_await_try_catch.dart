import 'dart:async';

Future<void> printOrderMessage() async {
  try {
    print('Esperando la orden del usuario...');
    var order = await fetchUserOrder();
    print(order);
  } catch (err) {
    print('Error capturado: $err');
  }
}

Future<String> fetchUserOrder() {
  // Imagina que esta función es más compleja.
  var str = Future.delayed(const Duration(seconds: 4),
      () => throw 'No se puede localizar la orden del usuario');
  return str;
}

void main() async {
  await printOrderMessage();
}
