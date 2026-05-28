class PetEntity {
  final int id;
  final String name;
  final String? type;  // Perro, Gato, etc.
  final String? breed; // Raza
  final int? age;

  PetEntity({
    required this.id,
    required this.name,
    this.type,
    this.breed,
    this.age,
  });
}