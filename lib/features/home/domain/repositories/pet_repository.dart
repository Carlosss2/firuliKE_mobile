import '../entities/pet_entity.dart';

abstract class PetRepository {
  Future<List<PetEntity>> getAllPets();
  Future<PetEntity> createPet(String name, String breed, int age, double peso, String proximaCita, String contactoDueno);
  Future<PetEntity> updatePet(int id, String name, String breed, int age, double peso, String proximaCita, String contactoDueno);
  Future<bool> deletePet(int id);
}