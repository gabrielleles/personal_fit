import 'package:flutter/material.dart';
import '../modules/personals/presentation/pages/catalog_page.dart';
import '../modules/personals/presentation/pages/personal_detail_page.dart';
import '../modules/personals/presentation/pages/personal_simulation_page.dart';
import '../modules/personals/domain/entities/personal.dart';

class AppRoutes {
  static const String catalog = '/';
  static const String detail = '/detail';
  static const String simulation = '/simulation';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case catalog:
        return MaterialPageRoute(builder: (_) => CatalogPage());
      case detail:
        final personal = settings.arguments as Personal;
        return MaterialPageRoute(
          builder: (_) => PersonalDetailPage(personal: personal),
        );
      case simulation:
        final personal = settings.arguments as Personal;
        return MaterialPageRoute(
          builder: (_) => PersonalSimulationPage(personal: personal),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('Rota não encontrada')),
          ),
        );
    }
  }
}
