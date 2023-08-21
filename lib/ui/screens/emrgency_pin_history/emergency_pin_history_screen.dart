import 'package:alianza_admin/core/palette/palette.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EmergencyPinHistoryScreen extends StatelessWidget {
  const EmergencyPinHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 60,
            child: Text(
              'This content is not yet available',
              style: TextStyle(
                  fontSize: 16,
                  color: Palette.blueGrey,
                  decoration: TextDecoration.none),
            ),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              context.pop();
            },
            child: const Text('Return'),
          ),
        ],
      ),
    );
  }
}
