import 'package:http/http.dart' as http;

class HttpClient {
  var url = 'http://159.89.50.39:5000/auth/perfil/login';

  Future<http.Response> signIn(String user, String password) async {
    return  http.post(url, body: {'nombre_contacto': user, 'password': password});
  }
}