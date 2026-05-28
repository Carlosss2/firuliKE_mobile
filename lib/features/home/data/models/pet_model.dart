import '../../domain/entities/pet_entity.dart';

class PetModel extends PetEntity {
  PetModel({
    required super.id,
    required super.name,
    super.type,
    super.breed,
    super.age,
  });

  factory PetModel.fromJson(Map<String, dynamic> json) {
    return PetModel(
      id: json['id'] as int? ?? 0,
      name: json['name'] as String? ?? 'Sin nombre',
      type: json['type'] as String?,
      breed: json['breed'] as String?,
      age: json['age'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'type': type,
      'breed': breed,
      'age': age,
    };
  }
}