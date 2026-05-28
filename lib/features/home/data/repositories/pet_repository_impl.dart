import '../../domain/entities/pet_entity.dart';
import '../../domain/repositories/pet_repository.dart';
import '../datasources/remote/pets_remote_datasource.dart';

class PetRepositoryImpl implements PetRepository {
  final PetsRemoteDataSource remoteDataSource;

  PetRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<PetEntity>> getAllPets() async {
    try {
      final models = await remoteDataSource.fetchPets();
      // Retornamos la lista mapeada hacia entidades limpias de dominio
      return models;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<bool> createPet(String name, String type, String breed, int age) async {
    try {
      return await remoteDataSource.storePet({
        'name': name,
        'type': type,
        'breed': breed,
        'age': age,
      });
    } catch (e) {
      rethrow;
    }
  }
}