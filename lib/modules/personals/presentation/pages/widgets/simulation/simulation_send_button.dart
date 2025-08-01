import 'package:flutter/material.dart';

class SimulationSendButton extends StatelessWidget {
  final VoidCallback onPressed;

  const SimulationSendButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: 44,
      child: ElevatedButton.icon(
        icon: const Icon(Icons.send, size: 18),
        label: const Text(
          'Enviar Interesse',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blueAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 6,
        ),
      ),
    );
  }
}
