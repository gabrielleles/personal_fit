import 'package:flutter/material.dart';
import '../../../../domain/entities/personal.dart';
import '../../shared/personal_avatar.dart';

class CatalogPersonalCard extends StatelessWidget {
  final Personal personal;
  final VoidCallback onTap;

  const CatalogPersonalCard({
    super.key,
    required this.personal,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: ListTile(
        onTap: onTap,
        leading: PersonalAvatar(photoUrl: personal.photoUrl, radius: 24),
        title: Text(personal.name),
        subtitle: Text('${personal.city}, ${personal.state}'),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.star, color: Colors.amber, size: 16),
            Text(personal.rating.toStringAsFixed(1)),
          ],
        ),
      ),
    );
  }
}

