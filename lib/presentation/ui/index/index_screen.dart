import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_list/presentation/navigation/todo_navigation.dart';

class IndexScreen extends StatelessWidget {
  const IndexScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        alignment: Alignment.center,
        child: TextButton(
          onPressed: () {
            context.push('/index/detail');
          },
          child: const Text('Index'),
        ),
      ),
    );
  }
}
