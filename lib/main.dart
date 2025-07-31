import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'modules/personals/presentation/providers/personal_provider.dart';
import 'modules/personals/data/repositories/personal_repository_impl.dart';
import 'modules/personals/presentation/pages/catalog_page.dart';

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
          create: (_) => PersonalProvider(repository: PersonalRepositoryImpl()),
        ),
      ],
      child: MaterialApp(
        title: 'Personal Fit',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const CatalogPage(),
        //
        // routes: {
        //   '/detail': (_) => PersonalDetailPage(),
        // },
      ),
    );
  }
}
