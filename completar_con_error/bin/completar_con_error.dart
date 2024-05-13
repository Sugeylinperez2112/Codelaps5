import 'dart:async';

Future<void> fetchUserOrder() {
  // Simulando una situación donde la función encuentra un error.
  return Future.delayed(
    const Duration(seconds: 2),
    () => throw Exception(
        'Error al obtener el pedido del usuario: el ID de usuario no es válido'),
  );
}

void main() {
  fetchUserOrder().catchError((error) {
    print(error);
  });
  print('Obteniendo pedido del usuario...');
}
