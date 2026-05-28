import '../../domain/entities/pet_entity.dart';
import '../../domain/repositories/pet_repository.dart';
import '../datasources/remote/pets_remote_datasource.dart';

class PetRepositoryImpl implements PetRepository {
  final PetsRemoteDataSource remoteDataSource;

  PetRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<PetEntity>> getAllPets() async {
    return remoteDataSource.fetchPets();
  }

  @override
  Future<PetEntity> createPet(String name, String breed, int age, double peso, String proximaCita, String contactoDueno) async {
    return remoteDataSource.createPet({
      'nombre': name,
      'raza': breed,
      'edad': age,
      'peso': peso,
      'proxima_cita': proximaCita,
      'contacto_dueno': contactoDueno,
    });
  }

  @override
  Future<PetEntity> updatePet(int id, String name, String breed, int age, double peso, String proximaCita, String contactoDueno) async {
    return remoteDataSource.updatePet(id, {
      'nombre': name,
      'raza': breed,
      'edad': age,
      'peso': peso,
      'proxima_cita': proximaCita,
      'contacto_dueno': contactoDueno,
    });
  }

  @override
  Future<bool> deletePet(int id) async {
    return remoteDataSource.deletePet(id);
  }
}