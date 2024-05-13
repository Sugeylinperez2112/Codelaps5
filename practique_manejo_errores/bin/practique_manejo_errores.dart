import 'dart:async';

Future<String> changeUsername() async {
  try {
    // Llama a la función asincrónica fetchNewUsername() y devuelve su resultado.
    return await fetchNewUsername();
  } catch (error) {
    // Detecta cualquier error que se produzca y devuelve el valor de cadena del error.
    return error.toString();
  }
}

// La siguiente función es proporcionada para simular una operación asincrónica que podría llevar un tiempo
// y potencialmente arrojar una excepción.

Future<String> fetchNewUsername() =>
    Future.delayed(const Duration(milliseconds: 500), () => throw UserError());

class UserError implements Exception {
  @override
  String toString() => 'New username is invalid';
}

// Código de prueba y feedback

void main() async {
  final List<String> messages = [];
  const typoMessage =
      '¡Prueba fallida! Revisa si hay errores tipográficos en tu valor de retorno';

  print('Testing...');
  try {
    messages
      ..add(_makeReadable(
          testLabel: '',
          testResult: await _asyncDidCatchException(changeUsername),
          readableErrors: {
            typoMessage: typoMessage,
            _noCatch:
                '¿Recuerdas llamar fetchNewUsername dentro de un bloque try/catch?',
          }))
      ..add(_makeReadable(
          testLabel: '',
          testResult: await _asyncErrorEquals(changeUsername),
          readableErrors: {
            typoMessage: typoMessage,
            _noCatch:
                '¿Recuerdas llamar fetchNewUsername dentro de un bloque try/catch?',
          }))
      ..removeWhere((m) => m.contains(_passed))
      ..toList();

    if (messages.isEmpty) {
      print('Success. All tests passed!');
    } else {
      messages.forEach(print);
    }
  } catch (e) {
    print('Tried to run solution, but received an exception: $e');
  }
}

// Funciones auxiliares de prueba
String _makeReadable({
  required String testResult,
  required Map<String, String> readableErrors,
  required String testLabel,
}) {
  if (readableErrors.containsKey(testResult)) {
    final readable = readableErrors[testResult];
    return '$testLabel $readable';
  } else {
    return '$testLabel $testResult';
  }
}

Future<String> _asyncErrorEquals(Function fn) async {
  final result = await fn();
  if (result == UserError().toString()) {
    return _passed;
  } else {
    return '¡Prueba fallida! ¿Has convertido a cadena y devuelto el error atrapado?';
  }
}

Future<String> _asyncDidCatchException(Function fn) async {
  var caught = true;
  try {
    await fn();
  } on UserError catch (_) {
    caught = false;
  }

  if (caught == false) {
    return _noCatch;
  } else {
    return _passed;
  }
}

const _passed = 'PASSED';
const _noCatch = 'NO_CATCH';
