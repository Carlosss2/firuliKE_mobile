import 'package:firulike/core/network/api_client.dart';
import 'package:firulike/core/storage/token_storage.dart';

class AppContainer {
  final ApiClient apiClient = ApiClient();
  final TokenStorage tokenStorage = TokenStorage();

  Future<void> init() async {
    await tokenStorage.getToken();
  }

  void dispose() {}
}
