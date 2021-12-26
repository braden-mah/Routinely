import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:routinely/core/database.dart';
import 'package:routinely/dependency_injector.dart';
import 'package:routinely/presentation/controllers/routine_adding_controller.dart';
import 'package:routinely/presentation/controllers/routine_viewing_controller.dart';
import 'package:routinely/presentation/view/routine_adding_page.dart';
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
      initialRoute: RoutineViewingPage.route,
      routes: {
        RoutineViewingPage.route: (_) => ChangeNotifierProvider(
            create: (_) => di<ViewRoutineController>()..init(),
            child: const RoutineViewingPage()),
        RoutineAddingPage.route: (_) => ChangeNotifierProvider(
            create: (_) => di<AddRoutineController>(),
            child: const RoutineAddingPage()),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
