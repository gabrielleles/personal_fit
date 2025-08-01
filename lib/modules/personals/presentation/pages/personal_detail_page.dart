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
    final screenWidth = MediaQuery.of(context).size.width;
    final horizontalPadding = screenWidth < 600 ? 16.0 : 64.0;

    return Scaffold(
      appBar: AppBar(
        title: Text(personal.name),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: horizontalPadding, vertical: 24),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
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
        ),
      ),
    );
  }
}
