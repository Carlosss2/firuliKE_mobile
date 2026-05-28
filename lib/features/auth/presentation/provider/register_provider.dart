import 'package:flutter/material.dart';
import '../../domain/usecases/register_usecase.dart';

class RegisterProvider extends ChangeNotifier {
  final RegisterUseCase _registerUseCase;

  RegisterProvider(this._registerUseCase);

  // Controladores de texto para la UI de registro
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<bool> register() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();
    final confirmPassword = confirmPasswordController.text.trim();

    // 1. Validación local primaria
    if (email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      _errorMessage = "Por favor, completa todos los campos.";
      notifyListeners();
      return false;
    }

    if (password != confirmPassword) {
      _errorMessage = "Las contraseñas no coinciden.";
      notifyListeners();
      return false;
    }

    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      final success = await _registerUseCase.execute(email, password);
      _isLoading = false;
      if (success) {
        clearControllers();
      }
      notifyListeners();
      return success;
    } catch (e) {
      _isLoading = false;
      _errorMessage = e.toString().replaceAll('Exception: ', '');
      notifyListeners();
      return false;
    }
  }

  void clearControllers() {
    emailController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
    _errorMessage = null;
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}