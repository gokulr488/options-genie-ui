import 'package:flutter/material.dart';
import 'package:optionsgenieui/apis/apis.dart';
import 'package:optionsgenieui/common/app_data.dart';
import 'package:optionsgenieui/screens/home/home_controller.dart';
import 'package:talos_commons/base_classes/base_api.dart';
import 'package:talos_commons/utils/call_context.dart';
import 'package:talos_commons/widgets/base_screen.dart';

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
    init();
  }

  @override
  Widget build(BuildContext context) {
    return const BaseScreen(
        headerText: '',
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(children: []),
        ));
  }

  void init() async {
    HOSTNAME = '10.244.88.51';
    PORT = '8903';
    CallContext callContext = await Apis().ogLogin('gokul', 'unnir7488*');
    if (!callContext.isError) {
      token = callContext.data.token;
    }
  }
}
