import 'package:bloc/bloc.dart';

import 'event.dart';
import 'state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState().init()) {
    on<InitEvent>(_init);
  }

  Future<void> _init(InitEvent event, Emitter<HomeState> emit) async {
    emit(state.clone());
  }
}
