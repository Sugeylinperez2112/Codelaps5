import 'dart:async';
import 'dart:math';

void main() {
  fetchUserOrder().then((order) {
    print('Orden del usuario: $order');
  }).catchError((error) {
    print('Error capturado: $error');
  });
}

Future<String> fetchUserOrder() {
  return Future.delayed(Duration(seconds: 2), () {
    // Simulando una respuesta exitosa
    var order = {'id': 1, 'product': 'Libro'};
    // Generando un error aleatorio para simular un fallo
    var randomError = Random().nextBool();
    if (randomError) {
      throw Exception('Error al obtener la orden del usuario');
    } else {
      return order.toString();
    }
  });
}
