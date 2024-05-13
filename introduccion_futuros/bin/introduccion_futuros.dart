import 'dart:async';

Future<String> obtenerPedidoUsuario() {
  // Simulando la obtención de información del usuario desde otro servicio o base de datos.
  return Future.delayed(const Duration(seconds: 2), () => 'Café Latte Grande');
}

void main() {
  print('Obteniendo pedido del usuario...');
  obtenerPedidoUsuario().then((pedido) {
    print('Pedido del usuario: $pedido');
  });
}
