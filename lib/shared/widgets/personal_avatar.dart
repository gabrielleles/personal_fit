import 'package:flutter/material.dart';

class PersonalAvatar extends StatelessWidget {
  final String photoUrl;
  final double radius;

  const PersonalAvatar({
    Key? key,
    required this.photoUrl,
    this.radius = 20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Se a URL estiver vazia, exibe o ícone direto
    if (photoUrl.isEmpty) {
      return CircleAvatar(
        radius: radius,
        backgroundColor: Colors.grey.shade200,
        child: Icon(Icons.person, size: radius),
      );
    }

    // Usa ClipOval para garantir formato circular, e Image.network com erro tratado
    return ClipOval(
      child: Image.network(
        photoUrl,
        width: radius * 2,
        height: radius * 2,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            width: radius * 2,
            height: radius * 2,
            color: Colors.grey.shade200,
            child: Icon(Icons.person, size: radius),
          );
        },
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Container(
            width: radius * 2,
            height: radius * 2,
            alignment: Alignment.center,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded / (loadingProgress.expectedTotalBytes ?? 1)
                  : null,
            ),
          );
        },
      ),
    );
  }
}
