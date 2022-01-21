import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:routinely/core/database.dart';
import 'package:routinely/dependency_injector.dart';
import 'package:routinely/domain/entities/routine_entity.dart';
import 'package:routinely/presentation/controllers/routine_adding_controller.dart';
import 'package:routinely/presentation/controllers/routine_entry_adding_controller.dart';
import 'package:routinely/presentation/controllers/routine_entry_update_controller.dart';
import 'package:routinely/presentation/controllers/routine_entry_viewing_controller.dart';
import 'package:routinely/presentation/controllers/routine_update_controller.dart';
import 'package:routinely/presentation/controllers/routine_viewing_controller.dart';
import 'package:routinely/presentation/controllers/routine_viewing_listing_controller.dart';
import 'package:routinely/presentation/dto/routine_entry_viewing_dto.dart';
import 'package:routinely/presentation/view/routine_adding_page.dart';
import 'package:routinely/presentation/view/routine_entry_adding_page.dart';
import 'package:routinely/presentation/view/routine_entry_update_page.dart';
import 'package:routinely/presentation/view/routine_entry_viewing_page.dart';
import 'package:routinely/presentation/view/routine_update_page.dart';
import 'package:routinely/presentation/view/routine_viewing_listing_page.dart';
import 'package:routinely/presentation/view/routine_viewing_page.dart';

void main() async {
  injectDependencies();
  await di<RoutineDatabase>().initializeDatabase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) {
        Map<String, Widget> routeMap = {
          RoutineAddingPage.route: ChangeNotifierProvider(
              create: (_) => di<AddRoutineController>(),
              child: const RoutineAddingPage()),
          RoutineViewingPage.route: ChangeNotifierProvider(
              create: (_) => di<RoutineViewingController>()
                ..init(settings.arguments as Routine),
              child: const RoutineViewingPage()),
          RoutineUpdatePage.route: ChangeNotifierProvider(
              create: (_) => di<RoutineUpdateController>()
                ..init(settings.arguments as Routine),
              child: const RoutineUpdatePage()),
          RoutineEntryAddingPage.route: ChangeNotifierProvider(
              create: (_) => di<RoutineEntryAddingController>()
                ..init(settings.arguments as Routine),
              child: const RoutineEntryAddingPage()),
          RoutineEntryViewingPage.route: ChangeNotifierProvider(
              create: (_) => di<RoutineEntryViewingController>()
                ..init(settings.arguments as RoutineEntryViewingDto),
              child: const RoutineEntryViewingPage()),
          RoutineEntryUpdatePage.route: ChangeNotifierProvider(
              create: (_) => di<RoutineEntryUpdateController>()
                ..init(settings.arguments as RoutineEntryViewingDto),
              child: const RoutineEntryUpdatePage()),
        };
        return MaterialPageRoute(builder: (ctx) => routeMap[settings.name]!);
      },
      home: ChangeNotifierProvider(
          create: (_) => di<RoutineViewingListingController>()..init(),
          child: const RoutineViewingListingPage()),
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
