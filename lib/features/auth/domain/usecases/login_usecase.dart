import 'package:flutter/foundation.dart';
import '../repositories/auth_repository.dart';

class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  Future<bool> execute(String email, String password) {
    debugPrint('[LoginUseCase] execute() called');
    return repository.login(email, password);
  }
}