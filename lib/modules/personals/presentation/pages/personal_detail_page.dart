import 'package:flutter/material.dart';
import '../../domain/entities/personal.dart';
import 'widgets/detail/personal_detail_avatar.dart';
import 'widgets/detail/personal_detail_info.dart';
import 'widgets/detail/personal_detail_actions.dart';

class PersonalDetailPage extends StatelessWidget {
  final Personal personal;

  const PersonalDetailPage({super.key, required this.personal});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(personal.name),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            PersonalDetailAvatar(
              photoUrl: personal.photoUrl,
              name: personal.name,
              rating: personal.rating,
            ),
            const SizedBox(height: 16),
            PersonalDetailInfo(personal: personal),
            const SizedBox(height: 24),
            PersonalDetailActions(personal: personal),
          ],
        ),
      ),
    );
  }
}
