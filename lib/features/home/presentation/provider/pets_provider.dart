import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../domain/entities/pet_entity.dart';
import '../../domain/usecases/create_pet_usecase.dart';
import '../../domain/usecases/delete_pet_usecase.dart';
import '../../domain/usecases/get_pets_usecase.dart';
import '../../domain/usecases/update_pet_usecase.dart';

class PetsProvider extends ChangeNotifier {
  final GetPetsUseCase _getPetsUseCase;
  final CreatePetUseCase _createPetUseCase;
  final UpdatePetUseCase _updatePetUseCase;
  final DeletePetUseCase _deletePetUseCase;

  PetsProvider(
    this._getPetsUseCase,
    this._createPetUseCase,
    this._updatePetUseCase,
    this._deletePetUseCase,
  );

  List<PetEntity> _pets = [];
  List<PetEntity> get pets => _pets;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _error;
  String? get error => _error;

  int _currentNavbarIndex = 0;
  int get currentNavbarIndex => _currentNavbarIndex;

  void setNavbarIndex(int index) {
    _currentNavbarIndex = index;
    notifyListeners();
  }

  Future<void> loadPets() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      _pets = await _getPetsUseCase.execute();
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      _error = e.toString().replaceAll('Exception: ', '');
      notifyListeners();
    }
  }

  Future<PetEntity?> createPet(String name, String breed, int age, double peso, String proximaCita, String contactoDueno) async {
    try {
      final pet = await _createPetUseCase.execute(name, breed, age, peso, proximaCita, contactoDueno);
      _pets.add(pet);
      notifyListeners();
      return pet;
    } catch (e) {
      debugPrint('[PetsProvider] createPet error: $e');
      return null;
    }
  }

  Future<PetEntity?> updatePet(int id, String name, String breed, int age, double peso, String proximaCita, String contactoDueno) async {
    try {
      final pet = await _updatePetUseCase.execute(id, name, breed, age, peso, proximaCita, contactoDueno);
      final index = _pets.indexWhere((p) => p.id == id);
      if (index != -1) {
        _pets[index] = pet;
        notifyListeners();
      }
      return pet;
    } catch (e) {
      debugPrint('[PetsProvider] updatePet error: $e');
      return null;
    }
  }

  Future<bool> deletePet(int id) async {
    try {
      final success = await _deletePetUseCase.execute(id);
      if (success) {
        _pets.removeWhere((p) => p.id == id);
        notifyListeners();
      }
      return success;
    } catch (e) {
      debugPrint('[PetsProvider] deletePet error: $e');
      return false;
    }
  }
}