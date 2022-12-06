import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_list/di/injection.dart';
import 'package:todo_list/gen/assets.gen.dart';
import 'package:todo_list/presentation/ui/splash/bloc/splash_bloc.dart';
import 'package:todo_list/presentation/ui/splash/bloc/splash_event.dart';
import 'package:todo_list/presentation/ui/splash/bloc/splash_state.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<SplashBloc>(),
      child: Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: BlocConsumer<SplashBloc, SplashState>(
          listener: ((context, state) {
            if (state.routePath.isNotEmpty) {
              context.go(state.routePath);
            }
          }),
          builder: ((context, state) => Container(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _Logo(
                      onAnimateCompleted: () {
                        context
                            .read<SplashBloc>()
                            .add(const SplashMovedToRoute());
                      },
                    ),
                    Text(
                      'UpTodo',
                      style: GoogleFonts.lato(
                        fontSize: 40,
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}

class _Logo extends StatefulWidget {
  final Function onAnimateCompleted;

  const _Logo({required this.onAnimateCompleted});

  @override
  State<_Logo> createState() => _LogoState();
}

class _LogoState extends State<_Logo> with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );

    _opacityAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInCubic,
      ),
    );

    _opacityAnimation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        widget.onAnimateCompleted.call();
      }

      setState(() {});
    });

    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _opacityAnimation,
      child: SvgPicture.asset(
        Assets.images.icLogo,
        color: Colors.blue,
        width: 100,
        height: 100,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
