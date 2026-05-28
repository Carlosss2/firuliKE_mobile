import '../../domain/entities/pet_entity.dart';

class PetModel extends PetEntity {
  PetModel({
    required super.id,
    required super.name,
    super.breed,
    super.age,
    super.peso,
    super.proximaCita,
    super.contactoDueno,
  });

  factory PetModel.fromJson(Map<String, dynamic> json) {
    return PetModel(
      id: json['id'] as int? ?? 0,
      name: json['nombre'] as String? ?? 'Sin nombre',
      breed: json['raza'] as String?,
      
      // 🛡️ Mapeo seguro para la edad por si acaso el backend la manda como String
      age: json['edad'] is String 
          ? int.tryParse(json['edad'] as String) 
          : json['edad'] as int?,

      // 🛡️ SOLUCIÓN AL ERROR: Convierte a String y parsea de forma segura a double
      peso: json['peso'] != null 
          ? double.tryParse(json['peso'].toString()) 
          : null,
          
      proximaCita: json['proxima_cita'] as String?,
      contactoDueno: json['contacto_dueno'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nombre': name,
      'raza': breed,
      'edad': age,
      'peso': peso,
      'proxima_cita': proximaCita,
      'contacto_dueno': contactoDueno,
    };
  }
}