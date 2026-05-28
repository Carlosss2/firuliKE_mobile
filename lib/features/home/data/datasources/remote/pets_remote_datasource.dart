import 'dart:convert';
import '../../../../../core/network/api_client.dart';
import '../../models/pet_model.dart';

class PetsRemoteDataSource {
  final ApiClient apiClient;

  PetsRemoteDataSource({required this.apiClient});

  Future<List<PetModel>> fetchPets() async {
    // Nota: Si tu ApiClient aún no tiene implementado el método .get(), 
    // puedes usar: await apiClient.post('/pets/findAll') o el mapeo correspondiente de tu NestJS.
    // Aquí consumimos un GET limpio a tu endpoint de NestJS:
    final url = Uri.parse('${apiClient.baseUrl}/pets');
    
    // Hacemos la consulta directamente usando la librería http mediante una llamada limpia
    final response = await apiClient.post('/pets'); // Ajusta a tu endpoint exacto (ej. /pets)
    
    if (response.statusCode == 200 || response.statusCode == 201) {
      final List<dynamic> decodedList = jsonDecode(response.body);
      return decodedList.map((item) => PetModel.fromJson(item)).toList();
    } else {
      throw Exception('Fallo al obtener el listado de mascotas desde el servidor');
    }
  }

  Future<bool> storePet(Map<String, dynamic> body) async {
    final response = await apiClient.post('/pets', body: jsonEncode(body));
    return response.statusCode == 201 || response.statusCode == 200;
  }
}