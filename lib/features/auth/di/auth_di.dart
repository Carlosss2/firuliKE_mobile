import 'package:firulike/core/di/app_container.dart';
import 'package:firulike/features/auth/data/datasources/remote/auth_remote_datasource.dart';
import 'package:firulike/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:firulike/features/auth/domain/repositories/auth_repository.dart';
import 'package:firulike/features/auth/domain/usecases/login_usecase.dart';
import 'package:firulike/features/auth/domain/usecases/register_usecase.dart';
import 'package:firulike/features/auth/presentation/provider/login_provider.dart';
import 'package:firulike/features/auth/presentation/provider/register_provider.dart';

class AuthDI {
  final AppContainer appContainer;

  late final AuthRemoteDataSource authRemoteDataSource;
  late final AuthRepository authRepository;
  late final LoginUseCase loginUseCase;
  late final RegisterUseCase registerUseCase;
  late final LoginProvider loginProvider;
  late final RegisterProvider registerProvider;

  AuthDI(this.appContainer) {
    _init();
  }

  void _init() {
    authRemoteDataSource = AuthRemoteDataSource(apiClient: appContainer.apiClient);
    authRepository = AuthRepositoryImpl(authRemoteDataSource);
    loginUseCase = LoginUseCase(authRepository);
    registerUseCase = RegisterUseCase(authRepository);
    loginProvider = LoginProvider(loginUseCase);
    registerProvider = RegisterProvider(registerUseCase);
  }
}
