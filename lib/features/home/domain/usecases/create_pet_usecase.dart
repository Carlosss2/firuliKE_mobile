import '../entities/pet_entity.dart';
import '../repositories/pet_repository.dart';

class CreatePetUseCase {
  final PetRepository repository;

  CreatePetUseCase(this.repository);

  Future<PetEntity> execute(String name, String breed, int age, double peso, String proximaCita, String contactoDueno) {
    return repository.createPet(name, breed, age, peso, proximaCita, contactoDueno);
  }
}