import 'dart:convert';
import '../../../../../../core/network/api_client.dart';
import '../../models/login_response_model.dart';
import '../../models/user_model.dart'; 

class AuthRemoteDataSource {
  // Inyectamos el singleton centralizado mediante el constructor
  final ApiClient apiClient;

  AuthRemoteDataSource({required this.apiClient});

  Future<LoginResponseModel> login(String email, String password) async {
  
    final response = await apiClient.post(
      '/auth/login',
      body: jsonEncode({'email': email, 'password': password}),
    );

    if (response.statusCode == 201 || response.statusCode == 200) {
      final Map<String, dynamic> decodedData = jsonDecode(response.body);
      
      return LoginResponseModel.fromJson(decodedData);
    } else {
      final errorData = jsonDecode(response.body);
      throw Exception(errorData['message'] ?? 'Error al iniciar sesión');
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