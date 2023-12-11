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

  Future<dynamic> post(String url, dynamic body) async {
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
