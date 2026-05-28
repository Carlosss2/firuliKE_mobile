import 'package:firulike/core/di/app_container.dart';
import 'package:firulike/features/home/data/datasources/remote/pets_remote_datasource.dart';
import 'package:firulike/features/home/data/repositories/pet_repository_impl.dart';
import 'package:firulike/features/home/domain/repositories/pet_repository.dart';
import 'package:firulike/features/home/domain/usecases/create_pet_usecase.dart';
import 'package:firulike/features/home/domain/usecases/delete_pet_usecase.dart';
import 'package:firulike/features/home/domain/usecases/get_pets_usecase.dart';
import 'package:firulike/features/home/domain/usecases/update_pet_usecase.dart';
import 'package:firulike/features/home/presentation/provider/pets_provider.dart';

class HomeDI {
  final AppContainer appContainer;

  late final PetsRemoteDataSource petsRemoteDataSource;
  late final PetRepository petsRepository;
  late final GetPetsUseCase getPetsUseCase;
  late final CreatePetUseCase createPetUseCase;
  late final UpdatePetUseCase updatePetUseCase;
  late final DeletePetUseCase deletePetUseCase;
  late final PetsProvider petsProvider;

  HomeDI(this.appContainer) {
    _init();
  }

  void _init() {
    petsRemoteDataSource = PetsRemoteDataSource(apiClient: appContainer.apiClient);
    petsRepository = PetRepositoryImpl(petsRemoteDataSource);
    getPetsUseCase = GetPetsUseCase(petsRepository);
    createPetUseCase = CreatePetUseCase(petsRepository);
    updatePetUseCase = UpdatePetUseCase(petsRepository);
    deletePetUseCase = DeletePetUseCase(petsRepository);
    petsProvider = PetsProvider(
      getPetsUseCase,
      createPetUseCase,
      updatePetUseCase,
      deletePetUseCase,
    );
  }
}
