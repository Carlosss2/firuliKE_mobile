import 'package:flutter/foundation.dart';
import '../../../../core/storage/token_storage.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/remote/auth_remote_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<bool> login(String email, String password) async {
    debugPrint('[AuthRepositoryImpl] login() called');
    try {
      final responseModel = await remoteDataSource.login(email, password);
      debugPrint('[AuthRepositoryImpl] token received: ${responseModel.token.isNotEmpty ? "yes (${responseModel.token.length} chars)" : "EMPTY"}');
      if (responseModel.token.isNotEmpty) {
        await TokenStorage().saveToken(responseModel.token);
        debugPrint('[AuthRepositoryImpl] token saved successfully');
        return true;
      }
      debugPrint('[AuthRepositoryImpl] token is empty, returning false');
      return false;
    } catch (e) {
      debugPrint('[AuthRepositoryImpl] ERROR: $e');
      rethrow;
    }
  }

  @override
  Future<bool> register(String email, String password) async {
    final userModel = await remoteDataSource.register(email, password);
    return userModel.id > 0;
  }
}