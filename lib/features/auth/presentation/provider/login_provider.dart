import 'package:flutter/material.dart';
import '../../domain/usecases/login_usecase.dart';

class LoginProvider extends ChangeNotifier {
  final LoginUseCase _loginUseCase;

  LoginProvider(this._loginUseCase);

  // Controladores para los inputs de la UI
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<bool> login() async {
    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    debugPrint('[LoginProvider] login() called with email: $email');

    if (email.isEmpty || password.isEmpty) {
      debugPrint('[LoginProvider] validation failed: empty fields');
      _errorMessage = "Por favor, completa todos los campos.";
      notifyListeners();
      return false;
    }

    _isLoading = true;
    _errorMessage = null;
    notifyListeners();

    try {
      debugPrint('[LoginProvider] calling LoginUseCase.execute()...');
      final success = await _loginUseCase.execute(email, password);
      debugPrint('[LoginProvider] LoginUseCase returned: $success');
      _isLoading = false;
      notifyListeners();
      return success;
    } catch (e) {
      debugPrint('[LoginProvider] ERROR caught: $e');
      _isLoading = false;
      _errorMessage = e.toString().replaceAll('Exception: ', '');
      notifyListeners();
      return false;
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}