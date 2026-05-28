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
  @override
  Future<bool> register(String email, String password) async {
    try {
      final userModel = await remoteDataSource.register(email, password);
      // Si el backend retorna un modelo con ID válido, el registro fue un éxito
      return userModel.id > 0;
    } catch (e) {
      rethrow;
    }
  }
}