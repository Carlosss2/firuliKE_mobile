import '../entities/pet_entity.dart';
import '../repositories/pet_repository.dart';

class UpdatePetUseCase {
  final PetRepository repository;

  UpdatePetUseCase(this.repository);

  Future<PetEntity> execute(int id, String name, String breed, int age, double peso, String proximaCita, String contactoDueno) {
    return repository.updatePet(id, name, breed, age, peso, proximaCita, contactoDueno);
  }
}