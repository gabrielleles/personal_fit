import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import 'modules/personals/data/repositories/personal_repository_impl.dart';
import 'modules/personals/domain/repositories/personal_repository.dart';
import 'modules/personals/presentation/controllers/personal_controller.dart';
import 'modules/personals/presentation/pages/personal_list_page.dart';

void main() {
  final PersonalRepository repository = PersonalRepositoryImpl(baseUrl: 'http://localhost:3000');
  final controller = PersonalController(repository);

  runApp(MyApp(controller));
}

class MyApp extends StatelessWidget {
  final PersonalController controller;

  const MyApp(this.controller, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: controller..loadPersonals(),
      child: MaterialApp(
        title: 'Personais Fit',
        theme: ThemeData(
          useMaterial3: true,
          colorSchemeSeed: Colors.blue,
        ),
        home: const PersonalListPage(),
      ),
    );
  }
}
