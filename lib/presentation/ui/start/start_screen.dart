import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_list/presentation/navigation/todo_navigation.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to UpTodo',
              style: GoogleFonts.lato(
                fontSize: 32,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 44),
              child: Text(
                'Please login to your account or create new account to continue',
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  fontSize: 16,
                  color: Colors.white.withOpacity(0.77),
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const Spacer(),
            Container(
              width: double.infinity,
              height: 48,
              margin: const EdgeInsets.symmetric(horizontal: 24),
              child: ElevatedButton(
                onPressed: () {
                  context.push(RouterPath.login);
                },
                child: Text(
                  'Login'.toUpperCase(),
                  style: GoogleFonts.lato(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 48,
              margin: const EdgeInsets.only(
                left: 24,
                right: 24,
                top: 24,
              ),
              child: OutlinedButton(
                onPressed: () {
                  context.push(RouterPath.register);
                },
                style: const ButtonStyle(
                  side: MaterialStatePropertyAll<BorderSide>(
                    BorderSide(
                      width: 2,
                      color: Colors.blue,
                    ),
                  ),
                ),
                child: Text(
                  'Create account'.toUpperCase(),
                  style: GoogleFonts.lato(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
