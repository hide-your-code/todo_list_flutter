import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CalendarDetailScreen extends StatelessWidget {
  const CalendarDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: TextButton(
          onPressed: () {
            context.pop();
          },
          child: const Text('Calendar detail'),
        ),
      ),
    );
  }
}
