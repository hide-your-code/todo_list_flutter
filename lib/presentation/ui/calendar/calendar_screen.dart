import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../navigation/todo_navigation.dart';

class CalendarScreen extends StatelessWidget {
  const CalendarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        alignment: Alignment.center,
        child: TextButton(
          onPressed: () {
            context.push('/calendar/detail');
          },
          child: const Text('Calendar'),
        ),
      ),
    );
  }
}
