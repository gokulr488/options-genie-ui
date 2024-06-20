import 'package:flutter/material.dart';
import 'package:optionsgenieui/screens/home/home_controller.dart';
import 'package:talos_commons/widgets/base_screen.dart';
import 'package:talos_commons/widgets/build_text_field.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController ctrl = HomeController.instance;

  @override
  void initState() {
    super.initState();
    ctrl.init();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
        headerText: '',
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(children: [
            TextButton(
                onPressed: ctrl.onLoginToUpstoxClicked,
                child: const Text('Login to Upstox')),
            BuildTextField(
                width: 300,
                label: 'Upstox Code',
                initialValue: ctrl.upstoxCode,
                onChanged: (p0) => ctrl.upstoxCode = p0),
            TextButton(
                onPressed: ctrl.onAuthenticateClicked,
                child: const Text('Authenticate with Upstox')),
          ]),
        ));
  }
}
