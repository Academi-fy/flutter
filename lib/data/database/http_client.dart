import 'dart:io';

class HttpClient {
  final String baseUrl;

  var _server;

  Future<void> connect() async {
    _server = await HttpServer.bind(InternetAddress.anyIPv4, 3000);
    print("Server listening on ${_server.address}:${_server.port}");
    await for (HttpRequest request in _server) {
      handleRequest(request);
    }
  }

  Future<dynamic> get(String url) async {
    // Implement GET request logic
    final response = await HttpClient().get(Uri.parse('$baseUrl$url'));
    return response;
  }

  Future<dynamic> post(String url, dynamic body) async {
    // Implement POST request logic
    final response = await HttpClient().post(Uri.parse('$baseUrl$url'),
        headers: {'Content-Type': 'application/json'}, body: body);
    return response;
  }

  Future<dynamic> put(String url, dynamic body) async {
    // Implement PUT request logic
    final response = await HttpClient().put(Uri.parse('$baseUrl$url'),
        headers: {'Content-Type': 'application/json'}, body: body);
    return response;
  }

  Future<dynamic> delete(String url) async {
    // Implement DELETE request logic
    final response = await HttpClient().delete(Uri.parse('$baseUrl$url'));
    return response;
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
