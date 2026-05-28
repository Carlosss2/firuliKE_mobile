import 'package:firulike/core/network/api_client.dart';

class AppContainer {
  final ApiClient apiClient = ApiClient();

  Future<void> init() async {
    await apiClient.getToken();
  }

  void dispose() {}
}
