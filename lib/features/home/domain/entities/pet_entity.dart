class PetEntity {
  final int id;
  final String name;
  final String? breed;
  final int? age;
  final double? peso;
  final String? proximaCita;
  final String? contactoDueno;

  PetEntity({
    required this.id,
    required this.name,
    this.breed,
    this.age,
    this.peso,
    this.proximaCita,
    this.contactoDueno,
  });
}