import 'dart:async';

Future<String> reportUserRole() async {
  var userRole = await fetchRole();
  return "Rol del usuario: $userRole";
}

Future<String> reportLogins() async {
  var loginAmount = await fetchLoginAmount();
  return "Número total de inicios de sesión: $loginAmount";
}

Future<String> fetchRole() => Future.delayed(_halfSecond, () => _role);
Future<int> fetchLoginAmount() => Future.delayed(_halfSecond, () => _logins);

void main() async {
  print('Probando...');
  List<String> messages = [];
  const passed = 'PASSED';
  const testFailedMessage = 'Prueba fallida para la función:';
  const typoMessage =
      '¡Prueba fallida! Verifique si hay errores tipográficos en su valor de retorno';
  try {
    messages
      ..add(_makeReadable(
          testLabel: 'Parte 1',
          testResult: await _asyncEquals(
            expected: 'Rol del usuario: administrador',
            actual: await reportUserRole(),
            typoKeyword: _role,
          ),
          readableErrors: {
            typoMessage: typoMessage,
            'null':
                '¡Prueba fallida! ¿Olvidó implementar o devolver desde reportUserRole?',
            'Rol del usuario: Instance of \'Future<String>\'':
                '$testFailedMessage reportUserRole. ¿Usaste la palabra clave await?',
            'Rol del usuario: Instance of \'_Future<String>\'':
                '$testFailedMessage reportUserRole. ¿Usaste la palabra clave await?',
            'Rol del usuario:':
                '$testFailedMessage reportUserRole. ¿Devuelves un rol de usuario?',
            'Rol del usuario: ':
                '$testFailedMessage reportUserRole. ¿Devuelves un rol de usuario?',
            'Rol del usuario: tester':
                '$testFailedMessage reportUserRole. ¿Invocaste fetchRole para obtener el rol del usuario?',
          }))
      ..add(_makeReadable(
          testLabel: 'Parte 2',
          testResult: await _asyncEquals(
            expected: 'Número total de inicios de sesión: 42',
            actual: await reportLogins(),
            typoKeyword: _logins.toString(),
          ),
          readableErrors: {
            typoMessage: typoMessage,
            'null':
                '¡Prueba fallida! ¿Olvidó implementar o devolver desde reportLogins?',
            'Número total de inicios de sesión: Instance of \'Future<int>\'':
                '$testFailedMessage reportLogins. ¿Usaste la palabra clave await?',
            'Número total de inicios de sesión: Instance of \'_Future<int>\'':
                '$testFailedMessage reportLogins. ¿Usaste la palabra clave await?',
            'Número total de inicios de sesión: ':
                '$testFailedMessage reportLogins. ¿Devuelves el número de inicios de sesión?',
            'Número total de inicios de sesión:':
                '$testFailedMessage reportLogins. ¿Devuelves el número de inicios de sesión?',
            'Número total de inicios de sesión: 57':
                '$testFailedMessage reportLogins. ¿Invocaste fetchLoginAmount para obtener el número de inicios de sesión del usuario?',
          }))
      ..removeWhere((m) => m.contains(passed))
      ..toList();

    if (messages.isEmpty) {
      print('Éxito. ¡Todas las pruebas pasaron!');
    } else {
      messages.forEach(print);
    }
  } on UnimplementedError {
    print(
        '¡Prueba fallida! ¿Olvidó implementar o devolver desde reportUserRole?');
  } catch (e) {
    print('Intenté ejecutar la solución, pero recibí una excepción: $e');
  }
}

const _role = 'administrador';
const _logins = 42;
const _halfSecond = Duration(milliseconds: 500);

String _makeReadable({
  required String testResult,
  required Map<String, String> readableErrors,
  required String testLabel,
}) {
  if (readableErrors.containsKey(testResult)) {
    var readable = readableErrors[testResult];
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
  var strActual = actual is String ? actual : actual.toString();
  try {
    if (expected == actual) {
      return 'PASSED';
    } else if (strActual.contains(typoKeyword)) {
      return '¡Prueba fallida! Verifique si hay errores tipográficos en su valor de retorno';
    } else {
      return strActual;
    }
  } catch (e) {
    return e.toString();
  }
}
