import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_list/di/injection.dart';
import 'package:todo_list/presentation/navigation/todo_navigation.dart';
import 'package:todo_list/presentation/ui/login/bloc/login_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/presentation/ui/login/bloc/login_event.dart';
import 'package:todo_list/presentation/ui/login/bloc/login_state.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: _appBar(context),
      body: BlocProvider(
        create: (context) => getIt.get<LoginBloc>(),
        child: SafeArea(
          child: Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 24,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                _title(),
                const SizedBox(height: 53),
                _titleUsername(),
                const SizedBox(height: 8),
                const _FieldUsername(),
                const SizedBox(height: 25),
                _titlePassword(),
                const SizedBox(height: 8),
                const _FieldPassword(),
                const SizedBox(height: 70),
                const _ButtonLogin(),
                _or(),
                _buttonLoginWithGoogle(),
                _buttonLoginWithFacebook(),
                const Spacer(),
                _buttonMoveToRegister(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: IconButton(
        onPressed: () {
          context.pop();
        },
        icon: const Icon(
          Icons.arrow_back_ios_new,
        ),
      ),
    );
  }

  Widget _title() => Text(
        'Login',
        style: GoogleFonts.lato(
          fontSize: 32,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
      );

  Widget _titleUsername() => Text(
        'Username',
        style: GoogleFonts.lato(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Colors.white.withOpacity(0.87),
        ),
      );

  Widget _titlePassword() => Text(
        'Password',
        style: GoogleFonts.lato(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Colors.white.withOpacity(0.87),
        ),
      );

  Widget _or() => Container(
        margin: const EdgeInsets.only(
          top: 30,
        ),
        alignment: Alignment.center,
        width: double.infinity,
        child: Row(
          children: [
            const Flexible(
              flex: 1,
              child: Divider(
                height: 2,
                color: Color(0xFF979797),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 2),
              child: Text(
                'or',
                style: GoogleFonts.lato(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF979797),
                ),
              ),
            ),
            const Flexible(
              flex: 1,
              child: Divider(
                height: 2,
                color: Color(0xFF979797),
              ),
            ),
          ],
        ),
      );

  Widget _buttonLoginWithGoogle() => Container(
        width: double.infinity,
        height: 48,
        margin: const EdgeInsets.only(
          top: 24,
        ),
        child: OutlinedButton(
          onPressed: () {},
          style: const ButtonStyle(
            side: MaterialStatePropertyAll<BorderSide>(
              BorderSide(
                width: 2,
                color: Colors.blue,
              ),
            ),
          ),
          child: Text(
            'Login with Google',
            style: GoogleFonts.lato(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ),
      );

  Widget _buttonLoginWithFacebook() => Container(
        width: double.infinity,
        height: 48,
        margin: const EdgeInsets.only(
          top: 24,
        ),
        child: OutlinedButton(
          onPressed: () {},
          style: const ButtonStyle(
            side: MaterialStatePropertyAll<BorderSide>(
              BorderSide(
                width: 2,
                color: Colors.blue,
              ),
            ),
          ),
          child: Text(
            'Login with Facebook',
            style: GoogleFonts.lato(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ),
      );

  Widget _buttonMoveToRegister(BuildContext context) => Container(
        margin: const EdgeInsets.only(top: 30, left: 30, right: 30),
        alignment: Alignment.center,
        child: TextButton(
          onPressed: () {
            context.replace(RouterPath.register);
          },
          child: RichText(
            text: TextSpan(
              text: 'Don\'t have an account?',
              style: GoogleFonts.kanit(color: const Color(0xFF979797)),
              children: [
                const WidgetSpan(
                  child: SizedBox(
                    width: 5,
                  ),
                ),
                TextSpan(
                  text: 'Register',
                  style: GoogleFonts.lato(
                    fontSize: 14,
                    color: Colors.white.withOpacity(0.87),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}

class _FieldUsername extends StatelessWidget {
  const _FieldUsername({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Enter your Username',
        hintStyle: GoogleFonts.roboto(
          fontSize: 16,
          color: const Color(0xFF535353),
          fontWeight: FontWeight.w400,
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(4),
          ),
          borderSide: BorderSide(
            color: Color(0xFF979797),
            width: 1,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(4),
          ),
          borderSide: BorderSide(
            color: Color(0xFF979797),
            width: 1,
          ),
        ),
      ),
      onChanged: (value) {
        context.read<LoginBloc>().add(LoginFieldUsername(username: value));
      },
    );
  }
}

class _FieldPassword extends StatelessWidget {
  const _FieldPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Enter your Password',
        hintStyle: GoogleFonts.roboto(
          fontSize: 16,
          color: const Color(0xFF535353),
          fontWeight: FontWeight.w400,
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(4),
          ),
          borderSide: BorderSide(
            color: Color(0xFF979797),
            width: 1,
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(4),
          ),
          borderSide: BorderSide(
            color: Color(0xFF979797),
            width: 1,
          ),
        ),
      ),
      onChanged: (value) {
        context.read<LoginBloc>().add(LoginFieldPassword(password: value));
      },
    );
  }
}

class _ButtonLogin extends StatelessWidget {
  const _ButtonLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) => SizedBox(
        width: double.infinity,
        height: 48,
        child: ElevatedButton(
          onPressed: state.isEnable
              ? () {
                  context.go(RouterPath.index);
                }
              : null,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.disabled)) {
                return const Color(0x808687E7);
              } else {
                return const Color(0xFF8687E7);
              }
            }),
          ),
          child: Text(
            'Login',
            style: GoogleFonts.lato(
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
