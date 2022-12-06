import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/presentation/ui/home/bloc/home_event.dart';
import 'package:todo_list/presentation/ui/home/bloc/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<HomeChangeIndex>(_changeIndex);
  }

  Future<void> _changeIndex(
      HomeChangeIndex event, Emitter<HomeState> emitter) async {
    return emitter(state.copyWith(index: event.index));
  }
}
