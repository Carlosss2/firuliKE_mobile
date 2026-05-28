import '../entities/pet_entity.dart';

abstract class PetRepository {
  Future<List<PetEntity>> getAllPets();
  Future<bool> createPet(String name, String type, String breed, int age);
}