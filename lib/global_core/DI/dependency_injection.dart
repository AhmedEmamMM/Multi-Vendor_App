import '../auth/auth_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void initDependencyInjection() {
  getIt.registerSingleton(AuthService());
}
