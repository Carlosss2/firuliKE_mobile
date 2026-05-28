import 'package:flutter/material.dart';
import '../../domain/entities/pet_entity.dart';
import '../../domain/usecases/get_pets_usecase.dart';

class PetsProvider extends ChangeNotifier {
  final GetPetsUseCase _getPetsUseCase;

  PetsProvider(this._getPetsUseCase);

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
}