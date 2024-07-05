// ignore_for_file: use_build_context_synchronously

import 'package:optionsgenieui/apis/apis.dart';
import 'package:optionsgenieui/common/app_data.dart';
import 'package:talos_commons/base_classes/base_api.dart';
import 'package:talos_commons/utils/Alerts.dart';
import 'package:talos_commons/utils/call_context.dart';
import 'package:talos_commons/utils/log_level.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeController {
  String? upstoxCode;

  HomeController._privateConstructor();

  static final HomeController instance = HomeController._privateConstructor();

  void init() async {
    HOSTNAME = '10.244.88.51';
    // HOSTNAME = 'localhost';
    PORT = '8903';
    CallContext callContext = await Apis().ogLogin('gokul', 'unnir7488*');
    if (!callContext.isError) {
      token = callContext.data.token;
    }
  }

  void onLoginToUpstoxClicked() async {
    CallContext callContext = await Apis().getUpstoxLoginPage();
    if (!callContext.isError) {
      _launchInBrowser(callContext.data.url);
    }
  }

  Future<void> _launchInBrowser(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }

  void onAuthenticateClicked() async {
    CallContext callContext = await Apis().upstoxLogin(upstoxCode ?? '');
    if (!callContext.isError) {
      log(callContext.data.message, logLevel: TOAST_MESSAGE);
    } else {
      log('Failed to authenticate ${callContext.message}',
          logLevel: POP_UP_MESSAGE);
    }
  }
}
