import 'package:http/http.dart' as http;

class ApiClient {
  // 1. Instancia privada estática
  static final ApiClient _instance = ApiClient._internal();

  // 2. Constructor de tipo factory que siempre retorna la misma instancia
  factory ApiClient() => _instance;

  // 3. Constructor privado nombrado
  ApiClient._internal();

  // Cliente HTTP nativo de la librería
  final http.Client _client = http.Client();

  // Tu IP centralizada de AWS EC2 [cite: 12]
  final String baseUrl = 'http://3.208.235.57:3000';

  /// Método genérico optimizado para peticiones POST [cite: 26]
  Future<http.Response> post(String endpoint, {Map<String, String>? headers, Object? body}) async {
    final url = Uri.parse('$baseUrl$endpoint');
    
    // Unificamos headers por defecto (como Content-Type JSON)
    final activeHeaders = headers ?? {'Content-Type': 'application/json'};

    return await _client.post(
      url,
      headers: activeHeaders,
      body: body,
    );
  }

  // Nota: Aquí mismo agregarás en el futuro tus métodos get(), put() y delete() para las Mascotas[cite: 26].
}