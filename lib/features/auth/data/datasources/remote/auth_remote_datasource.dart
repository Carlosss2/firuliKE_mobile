import 'dart:convert';
import 'package:flutter/foundation.dart';
import '../../../../../core/network/api_client.dart';
import '../../models/login_response_model.dart';
import '../../models/user_model.dart'; 

class AuthRemoteDataSource {
  // Inyectamos el singleton centralizado mediante el constructor
  final ApiClient apiClient;

  AuthRemoteDataSource({required this.apiClient});

  Future<LoginResponseModel> login(String email, String password) async {
    debugPrint('[AuthRemoteDataSource] login() - POST /auth/login');
    final body = jsonEncode({'email': email, 'password': password});
    debugPrint('[AuthRemoteDataSource] request body: $body');

    final response = await apiClient.post(
      '/auth/login',
      body: body,
    );

    debugPrint('[AuthRemoteDataSource] response status: ${response.statusCode}');
    debugPrint('[AuthRemoteDataSource] response body: ${response.body}');

    if (response.statusCode == 201 || response.statusCode == 200) {
      final Map<String, dynamic> decodedData = jsonDecode(response.body);
      debugPrint('[AuthRemoteDataSource] parsed response successfully');
      return LoginResponseModel.fromJson(decodedData);
    } else {
      final errorData = jsonDecode(response.body);
      final message = errorData['message'] ?? 'Error al iniciar sesión';
      debugPrint('[AuthRemoteDataSource] error response: $message');
      throw Exception(message);
    }
  }
  Future<UserModel> register(String email, String password) async {
    final response = await apiClient.post(
      '/users/register',
      body: jsonEncode({'email': email, 'password': password}),
    );

    if (response.statusCode == 201 || response.statusCode == 200) {
      final Map<String, dynamic> decodedData = jsonDecode(response.body);
      return UserModel.fromJson(decodedData);
    } else {
      final errorData = jsonDecode(response.body);
      
      
      if (errorData['message'] is List) {
        throw Exception((errorData['message'] as List).join('\n'));
      }
      
      throw Exception(errorData['message'] ?? 'Error al registrar el usuario');
    }
  }
}