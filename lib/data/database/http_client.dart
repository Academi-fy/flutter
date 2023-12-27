import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class AppHTTPClient {
  final String baseUrl;

  var _server;

  AppHTTPClient({required this.baseUrl});

  Future<void> connect() async {
    _server = await HttpServer.bind(InternetAddress.anyIPv4, 3000);
    print("Server listening on ${_server.address}:${_server.port}");
    await for (HttpRequest request in _server) {
      handleRequest(request);
    }
  }

  Future<dynamic> get(String url) async {
    final response = await http.get(Uri.parse('$baseUrl$url'));
    print(response.body);
    return response;
  }

  Future<dynamic> getWithBody(String url, dynamic body) async {
    final uri = Uri.parse('$baseUrl$url');
    final request = await HttpClient().openUrl("GET", uri);
    request.headers.set("Content-Type", "application/json");
    request.write(jsonEncode(body));
    final response = await request.close();
    return response;
  }

  Future<dynamic> post(String url, Map<String, dynamic> body) async {
    final response = await http.post(
      Uri.parse('$baseUrl$url'),
      headers: {'Content-Type': 'application/json'},
      body: body,
    );
    return response.body;
  }

  Future<dynamic> put(String url, dynamic body) async {
    final response = await http.put(
      Uri.parse('$baseUrl$url'),
      headers: {'Content-Type': 'application/json'},
      body: body,
    );
    return response.body;
  }

  Future<dynamic> delete(String url) async {
    final response = await http.delete(Uri.parse('$baseUrl$url'));
    return response.body;
  }

  void handleRequest(HttpRequest request) {
    switch (request.method) {
      case 'GET':
        // Handle GET request
        break;
      case 'POST':
        // Handle POST request
        break;
      case 'PUT':
        // Handle PUT request
        break;
      case 'DELETE':
        // Handle DELETE request
        break;
      default:
        request.response
          ..statusCode = HttpStatus.methodNotAllowed
          ..write('Method not allowed')
          ..close();
    }
  }
}
