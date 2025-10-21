import 'package:bloc/bloc.dart';

import 'event.dart';
import 'state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(SettingsState().init()) {
    on<InitEvent>(_init);
  }

  void _init(InitEvent event, Emitter<SettingsState> emit) async {
    emit(state.clone());
  }
}
