import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc.dart';
import 'event.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeBloc>(
      create: (BuildContext context) => HomeBloc()..add(InitEvent()),
      child: Builder(builder: (BuildContext context) => _buildPage(context)),
    );
  }

  Widget _buildPage(BuildContext context) {
    final HomeBloc bloc = BlocProvider.of<HomeBloc>(context);
    return Container(
      child: Center(child: Text('Home', style: TextStyle(fontSize: 20,color: Colors.blue))),
    );
  }
}
