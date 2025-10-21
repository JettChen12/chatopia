import 'package:bloc/bloc.dart';

import 'event.dart';
import 'state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc() : super(ChatState().init()) {
    on<InitEvent>(_init);
  }

  void _init(InitEvent event, Emitter<ChatState> emit) async {
    emit(state.clone());
  }
}
