import 'package:flutter/material.dart';
import '../../data/repositories/personal_repository_impl.dart';

class CatalogPage extends StatelessWidget {
  final repository = PersonalRepositoryImpl(baseUrl: 'http://localhost:3000');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Catálogo de Personais')),
      body: FutureBuilder(
        future: repository.getAll(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting)
            return Center(child: CircularProgressIndicator());
          if (snapshot.hasError)
            return Center(child: Text('Erro ao carregar'));

          final personais = snapshot.data!;

          return ListView.builder(
            itemCount: personais.length,
            itemBuilder: (context, index) {
              final p = personais[index];
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(p.photoUrl),
                ),
                title: Text(p.name),
                subtitle: Text('${p.city} - ${p.state}'),
                trailing: Text('⭐ ${p.rating}'),
              );
            },
          );
        },
      ),
    );
  }
}
