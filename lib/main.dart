import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'modules/personals/presentation/providers/personal_provider.dart';
import 'modules/personals/data/repositories/personal_repository_impl.dart';
import 'core/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<PersonalProvider>(
          create: (context) {
            final provider = PersonalProvider(repository: PersonalRepositoryImpl());
            provider.fetchPersonals(); // ✅ carregando os dados iniciais
            return provider;
          },
        ),
      ],
      child: MaterialApp(
        title: 'Personal Fit',
        theme: ThemeData(primarySwatch: Colors.blue),
        initialRoute: AppRoutes.catalog,
        onGenerateRoute: AppRoutes.generateRoute,
      ),
    );
  }
}
