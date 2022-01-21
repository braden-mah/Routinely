import 'package:get_it/get_it.dart';
import 'package:routinely/core/database.dart';
import 'package:routinely/data/repositories/routine_entry_repository.dart';
import 'package:routinely/data/repositories/routine_repository.dart';
import 'package:routinely/domain/services/routine_entry_service.dart';
import 'package:routinely/domain/services/routine_service.dart';
import 'package:routinely/presentation/controllers/routine_adding_controller.dart';
import 'package:routinely/presentation/controllers/routine_entry_adding_controller.dart';
import 'package:routinely/presentation/controllers/routine_entry_update_controller.dart';
import 'package:routinely/presentation/controllers/routine_entry_viewing_controller.dart';
import 'package:routinely/presentation/controllers/routine_update_controller.dart';
import 'package:routinely/presentation/controllers/routine_viewing_controller.dart';
import 'package:routinely/presentation/controllers/routine_viewing_listing_controller.dart';

final di = GetIt.instance;
void injectDependencies() {
  di.registerLazySingleton(() => RoutineDatabase());

  di.registerLazySingleton(() => RoutineRepository(di<RoutineDatabase>()));
  di.registerLazySingleton(() => RoutineService(di<RoutineRepository>()));

  di.registerLazySingleton(() => RoutineEntryRepository(di<RoutineDatabase>()));
  di.registerLazySingleton(
      () => RoutineEntryService(di<RoutineEntryRepository>()));

  di.registerFactory(() => AddRoutineController(di<RoutineService>()));
  di.registerFactory(
      () => RoutineViewingListingController(di<RoutineService>()));
  di.registerFactory(() => RoutineViewingController(
      di<RoutineService>(), di<RoutineEntryService>()));
  di.registerFactory(() => RoutineUpdateController(di<RoutineService>()));
  di.registerFactory(
      () => RoutineEntryAddingController(di<RoutineEntryService>()));
  di.registerFactory(
      () => RoutineEntryViewingController(di<RoutineEntryService>()));
  di.registerFactory(
      () => RoutineEntryUpdateController(di<RoutineEntryService>()));
}
