import 'package:get_it/get_it.dart';
import 'package:routinely/core/database.dart';
import 'package:routinely/data/repositories/routine_repository.dart';
import 'package:routinely/domain/services/routine_service.dart';
import 'package:routinely/presentation/controllers/routine_adding_controller.dart';
import 'package:routinely/presentation/controllers/routine_viewing_controller.dart';

final di = GetIt.instance;
void injectDependencies() {
  di.registerLazySingleton(() => RoutineDatabase());
  di.registerLazySingleton(() => RoutineRepository(di<RoutineDatabase>()));
  di.registerLazySingleton(() => RoutineService(di<RoutineRepository>()));
  di.registerFactory(() => AddRoutineController(di<RoutineService>()));
  di.registerFactory(() => ViewRoutineController(di<RoutineService>()));
}
