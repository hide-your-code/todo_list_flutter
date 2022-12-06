import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/presentation/ui/start/bloc/start_event.dart';
import 'package:todo_list/presentation/ui/start/bloc/start_state.dart';

class StartBloc extends Bloc<StartEvent, StartState> {
  StartBloc() : super(const StartState());
}
