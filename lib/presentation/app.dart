import 'package:flutter/material.dart';
import 'package:todo_list/presentation/navigation/todo_navigation.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: route,
      theme: ThemeData(
        backgroundColor: const Color(0xFF121212),
        brightness: Brightness.dark,
      ),
    );
  }
}
