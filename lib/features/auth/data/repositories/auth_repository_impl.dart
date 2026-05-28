import '../../domain/repositories/auth_repository.dart';
import '../datasources/remote/auth_remote_datasource.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<bool> login(String email, String password) async {
    try {
      final responseModel = await remoteDataSource.login(email, password);
      if (responseModel.token.isNotEmpty) {
        // El token se obtuvo correctamente mediante el modelo estructurado
        return true;
      }
      return false;
    } catch (e) {
      rethrow;
    }
  }
}