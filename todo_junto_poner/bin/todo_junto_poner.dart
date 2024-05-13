import 'dart:async';

// Parte 1
String addHello(String user) {
  String greeting = 'Hello $user';
  print('Resultado de addHello: $greeting');
  return greeting;
}

// Parte 2
Future<String> greetUser() async {
  try {
    final username = await fetchUsername();
    String greeting = addHello(username);
    print('Resultado de greetUser: $greeting');
    return greeting;
  } catch (e) {
    print('Error en greetUser: $e');
    rethrow; // Relanza la excepción para que pueda ser manejada por el código llamante
  }
}

// Parte 3
Future<String> sayGoodbye() async {
  try {
    final result = await logoutUser();
    String message = '$result Thanks, see you next time';
    print('Resultado de sayGoodbye: $message');
    return message;
  } catch (e) {
    String message = 'Logout failed. Thanks, see you next time';
    print('Resultado de sayGoodbye: $message');
    return message;
  }
}

// Las siguientes funciones se proporcionan para que las utilices en tus soluciones.

Future<String> fetchUsername() =>
    Future.delayed(Duration(milliseconds: 500), () {
      String username = 'Jean';
      print('Resultado de fetchUsername: $username');
      return username;
    });

Future<String> logoutUser() =>
    Future.delayed(Duration(milliseconds: 500), _failOnce);

// El siguiente código se utiliza para probar y proporcionar comentarios sobre tu solución.
// No es necesario leerlo ni modificarlo.

void main() async {
  const didNotImplement =
      '¡Prueba fallida! ¿Olvidaste implementar o devolver desde';

  final List<String> messages = [];

  print('Probando...');
  try {
    messages
      ..add(_makeReadable(
          testLabel: 'Parte 1',
          testResult: await _asyncEquals(
              expected: 'Hello Jerry',
              actual: addHello('Jerry'),
              typoKeyword: 'Jerry'),
          readableErrors: {
            _typoMessage: _typoMessage,
            'null': '$didNotImplement addHello?',
            'Hello Instance of \'Future<String>\'':
                '¡Parece que olvidaste usar la palabra clave \'await\'!',
            'Hello Instance of \'_Future<String>\'':
                '¡Parece que olvidaste usar la palabra clave \'await\'!',
          }))
      ..add(_makeReadable(
          testLabel: 'Parte 2',
          testResult: await _asyncEquals(
              expected: 'Hello Jean',
              actual: await greetUser(),
              typoKeyword: 'Jean'),
          readableErrors: {
            _typoMessage: _typoMessage,
            'null': '$didNotImplement greetUser?',
            'HelloJean':
                '¡Parece que olvidaste el espacio entre \'Hello\' y \'Jean\'!',
            'Hello Instance of \'Future<String>\'':
                '¡Parece que olvidaste usar la palabra clave \'await\'!',
            'Hello Instance of \'_Future<String>\'':
                '¡Parece que olvidaste usar la palabra clave \'await\'!',
            '{Closure: (String) => dynamic from Function \'addHello\': static.(await fetchUsername())}':
                '¿Colocaste el carácter correctamente?',
            '{Closure \'addHello\'(await fetchUsername())}':
                '¿Colocaste el carácter correctamente?',
          }))
      ..add(_makeReadable(
          testLabel: 'Parte 3',
          testResult: await _asyncDidCatchException(sayGoodbye),
          readableErrors: {
            _typoMessage:
                '$_typoMessage. ¿Añadiste el texto \'Thanks, see you next time\'?',
            'null': '$didNotImplement sayGoodbye?',
            _noCatch:
                '¿Recordaste llamar a logoutUser dentro de un bloque try/catch?',
            'Instance of \'Future<String>\' Thanks, see you next time':
                '¿Recordaste usar la palabra clave \'await\' en la función sayGoodbye?',
            'Instance of \'_Future<String>\' Thanks, see you next time':
                '¿Recordaste usar la palabra clave \'await\' en la función sayGoodbye?',
          }))
      ..add(_makeReadable(
          testLabel: 'Parte 3',
          testResult: await _asyncEquals(
              expected: 'Success! Thanks, see you next time',
              actual: await sayGoodbye(),
              typoKeyword: 'Success'),
          readableErrors: {
            _typoMessage:
                '$_typoMessage. ¿Añadiste el texto \'Thanks, see you next time\'?',
            'null': '$didNotImplement sayGoodbye?',
            _noCatch:
                '¿Recordaste llamar a logoutUser dentro de un bloque try/catch?',
            'Instance of \'Future<String>\' Thanks, see you next time':
                '¿Recordaste usar la palabra clave \'await\' en la función sayGoodbye?',
            'Instance of \'_Future<String>\' Thanks, see you next time':
                '¿Recordaste usar la palabra clave \'await\' en la función sayGoodbye?',
            'Instance of \'_Exception\'':
                '¡ATRAPADO! ¿Recordaste devolver un string?',
          }))
      ..removeWhere((m) => m.contains(_passed))
      ..toList();

    if (messages.isEmpty) {
      print('¡Éxito! ¡Todas las pruebas pasaron!');
    } else {
      messages.forEach(print);
    }
  } catch (e) {
    print('Se intentó ejecutar la solución, pero se recibió una excepción: $e');
  }
}

// Funciones de prueba.
String _makeReadable({
  required String testResult,
  required Map<String, String> readableErrors,
  required String testLabel,
}) {
  String? readable;
  if (readableErrors.containsKey(testResult)) {
    readable = readableErrors[testResult];
    return '$testLabel $readable';
  } else if ((testResult != _passed) && (testResult.length < 18)) {
    readable = _typoMessage;
    return '$testLabel $readable';
  } else {
    return '$testLabel $testResult';
  }
}

Future<String> _asyncEquals({
  required String expected,
  required dynamic actual,
  required String typoKeyword,
}) async {
  final strActual = actual is String ? actual : actual.toString();
  try {
    if (expected == actual) {
      return _passed;
    } else if (strActual.contains(typoKeyword)) {
      return _typoMessage;
    } else {
      return strActual;
    }
  } catch (e) {
    return e.toString();
  }
}

Future<String> _asyncDidCatchException(Function fn) async {
  var caught = true;
  try {
    await fn();
  } on Exception catch (_) {
    caught = false;
  }

  if (caught == true) {
    return _passed;
  } else {
    return _noCatch;
  }
}

const _typoMessage =
    '¡Prueba fallida! ¡Revisa si hay errores tipográficos en el valor devuelto!';
const _passed = 'PASSED';
const _noCatch = 'NO_CATCH';

String _failOnce() {
  if (_logoutSucceeds) {
    return 'Éxito!';
  } else {
    _logoutSucceeds = true;
    throw Exception('El cierre de sesión falló');
  }
}

bool _logoutSucceeds = false;
