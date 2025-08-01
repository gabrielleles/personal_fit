import 'package:flutter/material.dart';
import '../../../../domain/entities/personal.dart';
import '../../shared/personal_avatar.dart';

class PersonalDetailInfo extends StatelessWidget {
  final Personal personal;

  const PersonalDetailInfo({super.key, required this.personal});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PersonalAvatar(photoUrl: personal.photoUrl, radius: 50),
        const SizedBox(height: 16),
        Text(
          personal.name,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        Text(
          personal.city,
          style: const TextStyle(fontSize: 16, color: Colors.grey),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24),
          child: Text(
            personal.bio,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }
}
