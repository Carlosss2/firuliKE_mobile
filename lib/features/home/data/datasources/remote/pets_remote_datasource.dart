import 'dart:convert';
import '../../../../../core/network/api_client.dart';
import '../../models/pet_model.dart';

class PetsRemoteDataSource {
  final ApiClient apiClient;

  PetsRemoteDataSource({required this.apiClient});

  Future<List<PetModel>> fetchPets() async {
    final response = await apiClient.get('/pets');

    if (response.statusCode == 200 || response.statusCode == 201) {
      final List<dynamic> decodedList = jsonDecode(response.body);
      return decodedList.map((item) => PetModel.fromJson(item)).toList();
    } else {
      throw Exception('Fallo al obtener el listado de mascotas desde el servidor');
    }
  }

  Future<PetModel> createPet(Map<String, dynamic> body) async {
    final response = await apiClient.post('/pets', body: jsonEncode(body));

    if (response.statusCode == 201 || response.statusCode == 200) {
      final Map<String, dynamic> decoded = jsonDecode(response.body);
      return PetModel.fromJson(decoded);
    } else {
      final errorData = jsonDecode(response.body);
      throw Exception(errorData['message'] ?? 'Error al crear la mascota');
    }
  }

  Future<PetModel> updatePet(int id, Map<String, dynamic> body) async {
    final response = await apiClient.patch('/pets/$id', body: jsonEncode(body));

    if (response.statusCode == 200 || response.statusCode == 201) {
      final Map<String, dynamic> decoded = jsonDecode(response.body);
      return PetModel.fromJson(decoded);
    } else {
      final errorData = jsonDecode(response.body);
      throw Exception(errorData['message'] ?? 'Error al actualizar la mascota');
    }
  }

  Future<bool> deletePet(int id) async {
    final response = await apiClient.delete('/pets/$id');
    return response.statusCode == 200 || response.statusCode == 204;
  }
}