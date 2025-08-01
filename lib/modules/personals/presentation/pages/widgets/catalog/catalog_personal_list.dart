import 'package:flutter/material.dart';
import '../../../../../../core/routes.dart';
import '../../../../domain/entities/personal.dart';
import '../../shared/personal_avatar.dart';

class CatalogPersonalList extends StatelessWidget {
  final List<Personal> personals;

  const CatalogPersonalList({super.key, required this.personals});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: personals.length,
      itemBuilder: (context, index) {
        final personal = personals[index];
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          child: InkWell(
            onTap: () {
              Navigator.pushNamed(
                context,
                AppRoutes.detail,
                arguments: personal,
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  PersonalAvatar(photoUrl: personal.photoUrl, radius: 24),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          personal.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 16,
                            ),
                            const SizedBox(width: 4),
                            Text(personal.rating.toString()),
                          ],
                        ),
                        Text(
                          'Especialidades: ${personal.specialties.join(', ')}',
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
