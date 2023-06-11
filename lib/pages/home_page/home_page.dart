import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_proyect/pages/home_page/bloc/home_bloc.dart';
import '../../widgets/bottom_nav_bar/bottom_navigation_bar.dart';

class HomePage extends StatefulWidget {
  final Widget child;
  const HomePage({super.key, required this.child});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Provider(
        create: (_) => HomeBloc(),
        child: widget.child,
        dispose: (context, value) {
          value.close();
        },
      ),
      bottomNavigationBar: const BottomNavigationnWidget(),
    );
  }
}
