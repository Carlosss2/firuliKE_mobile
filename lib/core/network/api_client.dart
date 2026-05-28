import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiClient {
  static final ApiClient _instance = ApiClient._internal();
  factory ApiClient() => _instance;
  ApiClient._internal();

  final http.Client _client = http.Client();
  final String baseUrl = 'http://3.208.235.57:3000';

  static const _tokenKey = 'auth_token';
  String? _token;

  Future<String?> getToken() async {
    if (_token != null) return _token;
    final prefs = await SharedPreferences.getInstance();
    _token = prefs.getString(_tokenKey);
    return _token;
  }

  Future<void> saveToken(String token) async {
    _token = token;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, token);
  }

  Future<void> clearToken() async {
    _token = null;
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
  }

  Future<Map<String, String>> _buildHeaders({Map<String, String>? headers}) async {
    final activeHeaders = Map<String, String>.from(
      headers ?? {'Content-Type': 'application/json'},
    );
    final token = await getToken();
    if (token != null) {
      activeHeaders['Authorization'] = 'Bearer $token';
    }
    return activeHeaders;
  }

  Future<http.Response> get(String endpoint, {Map<String, String>? headers}) async {
    final url = Uri.parse('$baseUrl$endpoint');
    final activeHeaders = await _buildHeaders(headers: headers);
    return _client.get(url, headers: activeHeaders).timeout(const Duration(seconds: 15));
  }

  Future<http.Response> post(String endpoint, {Map<String, String>? headers, Object? body}) async {
    final url = Uri.parse('$baseUrl$endpoint');
    debugPrint('[ApiClient] POST $url');
    debugPrint('[ApiClient] body: $body');

    final activeHeaders = await _buildHeaders(headers: headers);

    debugPrint('[ApiClient] headers: ${activeHeaders.toString()}');

    try {
      final response = await _client
          .post(url, headers: activeHeaders, body: body)
          .timeout(const Duration(seconds: 15));
      debugPrint('[ApiClient] response status: ${response.statusCode}');
      return response;
    } catch (e) {
      debugPrint('[ApiClient] NETWORK ERROR: $e');
      rethrow;
    }
  }

  Future<http.Response> patch(String endpoint, {Map<String, String>? headers, Object? body}) async {
    final url = Uri.parse('$baseUrl$endpoint');
    debugPrint('[ApiClient] PATCH $url');
    
    final activeHeaders = await _buildHeaders(headers: headers);

    try {
      final response = await _client
          .patch(url, headers: activeHeaders, body: body)
          .timeout(const Duration(seconds: 15));
      debugPrint('[ApiClient] PATCH response status: ${response.statusCode}');
      return response;
    } catch (e) {
      debugPrint('[ApiClient] NETWORK ERROR (PATCH): $e');
      rethrow;
    }
  }

  Future<http.Response> delete(String endpoint, {Map<String, String>? headers}) async {
    final url = Uri.parse('$baseUrl$endpoint');
    final activeHeaders = await _buildHeaders(headers: headers);
    return _client.delete(url, headers: activeHeaders).timeout(const Duration(seconds: 15));
  }
}