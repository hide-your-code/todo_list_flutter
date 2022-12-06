import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class IndexDetailScreen extends StatelessWidget {
  const IndexDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: TextButton(
          onPressed: () {
            context.pop();
          },
          child: const Text('Index detail'),
        ),
      ),
    );
  }
}
