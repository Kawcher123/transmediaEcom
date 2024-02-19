import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:transmedia/injections/dependency_injection.dart';
import 'package:transmedia/presentation/navigation/navigation.dart';
import 'package:transmedia/presentation/navigation/routes.dart';

import 'data/data_sources/local/sqlite_data_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var initialRoute = await Routes.initialRoute;
  await DependencyInjection.init();

  runApp(Main(initialRoute));
}

class Main extends StatelessWidget {
  final String initialRoute;
  const Main(this.initialRoute, {super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: initialRoute,
      getPages: Nav.routes,
    );
  }
}
