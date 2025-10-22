import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:langchain/langchain.dart';
import 'package:langchain_openai/langchain_openai.dart';

import '../../core/log/log.dart';
import 'bloc.dart';
import 'event.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  void initState() {
    super.initState();
    _invoke();
  }

  Future<void> _invoke() async {
    final model = ChatOpenAI(
      apiKey: 'sk-',
      baseUrl: 'https://api.moonshot.cn/v1',
      defaultOptions:  const ChatOpenAIOptions(model: 'kimi-k2-0711-preview')
    );
    final prompt = PromptValue.string('你是谁？');
    final result = await model.invoke(prompt);
    logger.i(result);
  }

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
