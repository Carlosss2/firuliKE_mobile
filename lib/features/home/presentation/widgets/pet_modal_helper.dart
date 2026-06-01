import 'package:flutter/material.dart';
import '../../domain/entities/pet_entity.dart';
import '../provider/pets_provider.dart';
import 'pet_form_modal.dart';

void showPetFormModal(BuildContext context, PetsProvider provider, {PetEntity? pet}) {

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
    ),
    builder: (_) => PetFormModal(pet: pet),
  ).then((result) {
    if (result == null) return;
    if (pet == null) {
      provider.createPet(
        result['name'],
        result['breed'],
        result['age'],
        result['peso'],
        result['proximaCita'],
        result['contactoDueno'],
      );
    } else {
      provider.updatePet(
        pet.id,
        result['name'],
        result['breed'],
        result['age'],
        result['peso'],
        result['proximaCita'],
        result['contactoDueno'],
      );
    }
  });
}
