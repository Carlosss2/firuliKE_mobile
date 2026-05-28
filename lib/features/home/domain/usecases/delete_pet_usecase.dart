import '../repositories/pet_repository.dart';

class DeletePetUseCase {
  final PetRepository repository;

  DeletePetUseCase(this.repository);

  Future<bool> execute(int id) {
    return repository.deletePet(id);
  }
}