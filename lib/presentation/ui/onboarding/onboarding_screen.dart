import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_list/di/injection.dart';
import 'package:todo_list/gen/assets.gen.dart';
import 'package:todo_list/presentation/ui/onboarding/bloc/onboarding_bloc.dart';
import 'package:todo_list/presentation/ui/onboarding/bloc/onboarding_event.dart';
import 'package:todo_list/presentation/ui/onboarding/bloc/onboarding_state.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_list/presentation/navigation/todo_navigation.dart';

import '../../components/custom_tab_page_selector.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<OnboardingBloc>(),
      child: BlocConsumer<OnboardingBloc, OnboardingState>(
        listener: (context, state) {
          if (state.moveToStartScreen) {
            context.go(RouterPath.start);
          }
        },
        builder: (context, state) => Scaffold(
          backgroundColor: Theme.of(context).backgroundColor,
          appBar: _appBar(context),
          body: SafeArea(
            child: Column(
              children: [
                _Indicator(
                  onTabChanged: (index) {
                    context
                        .read<OnboardingBloc>()
                        .add(OnboardingOnTabChanged(index: index));
                  },
                ),
                const _Buttons(),
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
      leadingWidth: 100,
      leading: TextButton(
        onPressed: () {
          context.read<OnboardingBloc>().add(const OnboardingSkip());
        },
        child: Text(
          'Skip'.toUpperCase(),
          style: GoogleFonts.lato(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Colors.white.withOpacity(0.44),
          ),
        ),
      ),
    );
  }
}

class _Indicator extends StatefulWidget {
  final Function(int index) onTabChanged;

  const _Indicator({required this.onTabChanged});

  @override
  State<_Indicator> createState() => _IndicatorState();
}

class _IndicatorState extends State<_Indicator>
    with SingleTickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 3, vsync: this);

    _controller.addListener(() {
      final index = _controller.index;
      widget.onTabChanged.call(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<OnboardingBloc, OnboardingState>(
      listener: (context, state) {
        _controller.index = state.index;
      },
      child: Expanded(
        child: Stack(
          children: [
            SizedBox(
              height: 500,
              child: TabBarView(
                controller: _controller,
                children: [
                  _firstPage(),
                  _secondPage(),
                  _thirdPage(),
                ],
              ),
            ),
            Container(
              alignment: Alignment.topCenter,
              margin: const EdgeInsets.only(top: 300),
              child: CustomTabPageSelector(
                controller: _controller,
                indicatorSize: 30,
                color: const Color(0xFFAFAFAF),
                selectedColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _firstPage() => Column(
        children: [
          SizedBox(
            height: 250,
            child: SvgPicture.asset(Assets.images.bgOnboardingFirst),
          ),
          const SizedBox(
            height: 100,
          ),
          const _Description(
            title: 'Create daily routine',
            description:
                'In Uptodo  you can create your personalized routine to stay productive',
          ),
        ],
      );

  Widget _secondPage() => Column(
        children: [
          SizedBox(
            height: 250,
            child: SvgPicture.asset(Assets.images.bgOnboardingSecond),
          ),
          const SizedBox(
            height: 100,
          ),
          const _Description(
            title: 'Manage your tasks',
            description:
                'You can easily manage all of your daily tasks in DoMe for free',
          ),
        ],
      );

  Widget _thirdPage() => Column(
        children: [
          SizedBox(
            height: 250,
            child: SvgPicture.asset(Assets.images.bgOnboardingThird),
          ),
          const SizedBox(
            height: 100,
          ),
          const _Description(
            title: 'Orgonaize your tasks',
            description:
                'You can organize your daily tasks by adding your tasks into separate categories',
          ),
        ],
      );
}

class _Description extends StatelessWidget {
  final String title;
  final String description;

  const _Description({
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 53),
      child: Column(
        children: [
          Text(
            title,
            style: GoogleFonts.lato(
              fontWeight: FontWeight.w700,
              fontSize: 32,
              color: Colors.white,
            ),
          ),
          const SizedBox(
            height: 42,
          ),
          Text(
            description,
            textAlign: TextAlign.center,
            style: GoogleFonts.lato(
              fontWeight: FontWeight.w400,
              fontSize: 16,
              color: Colors.white.withOpacity(0.87),
            ),
          ),
        ],
      ),
    );
  }
}

class _Buttons extends StatelessWidget {
  const _Buttons();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OnboardingBloc, OnboardingState>(
      builder: (context, state) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 24),
        child: Row(
          children: [
            if (!state.isStart)
              TextButton(
                onPressed: () {
                  context
                      .read<OnboardingBloc>()
                      .add(const OnboardingPreviousPage());
                },
                child: Text(
                  'Back'.toUpperCase(),
                  style: GoogleFonts.lato(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.white.withOpacity(0.44),
                  ),
                ),
              ),
            const Spacer(),
            if (!state.isEnd)
              SizedBox(
                width: 90,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    context
                        .read<OnboardingBloc>()
                        .add(const OnboardingNextPage());
                  },
                  child: Text(
                    'Next'.toUpperCase(),
                  ),
                ),
              )
            else
              SizedBox(
                width: 150,
                height: 48,
                child: ElevatedButton(
                  onPressed: () {
                    context.read<OnboardingBloc>().add(const OnboardingSkip());
                  },
                  child: Text(
                    'Get started'.toUpperCase(),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
