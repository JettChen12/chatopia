import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc.dart';
import 'event.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ChatBloc>(
      create: (BuildContext context) => ChatBloc()..add(InitEvent()),
      child: Builder(builder: (BuildContext context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    final ChatBloc bloc = BlocProvider.of<ChatBloc>(context);
    final ColorScheme theme = AdaptiveTheme.of(context).theme.colorScheme;

    return ColoredBox(
      color: theme.surface,
      child: const Center(
        child: Text('Chat', style: TextStyle(fontSize: 20, color: Colors.blue)),
      ),
    );
  }
}
