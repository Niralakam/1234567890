import 'package:ProGuidance/services/service-wrapper/local-storage-service.dart';
import 'package:ProGuidance/services/service.dart';
import 'package:ProGuidance/services/service-wrapper/rest_client_service.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.I;
Future<void> setupInjectionLocator() async {
  var instance = await LocalStorageService.getInstance();
  locator.registerSingleton<LocalStorageService>(instance);
  locator.registerFactory(() => RestClientService());
  locator.registerFactory(() => Services());
}
