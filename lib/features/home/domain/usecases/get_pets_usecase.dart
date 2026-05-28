import '../entities/pet_entity.dart';
import '../repositories/pet_repository.dart';

class GetPetsUseCase {
  final PetRepository repository;

  GetPetsUseCase(this.repository);

  Future<List<PetEntity>> execute() async {
    return await repository.getAllPets();
  }
}