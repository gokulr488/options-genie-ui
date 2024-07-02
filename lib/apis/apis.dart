import 'package:optionsgenieui/apis/get_option_chain.dart';
import 'package:optionsgenieui/apis/og_login.dart';
import 'package:optionsgenieui/apis/upstox_login_page.dart';
import 'package:optionsgenieui/apis/upstox_login.dart';
import 'package:talos_commons/utils/call_context.dart';

class Apis {
  Future<CallContext> getUpstoxLoginPage() async {
    return await UpstoxLoginPageApi(req: UpstoxLoginPageUrlResp()).call();
  }

  Future<CallContext> ogLogin(String userName, String password) async {
    return await OgLoginApi(
            req: OgLoginReq(password: password, userName: userName))
        .call();
  }

  Future<CallContext> upstoxLogin(String code) async {
    return await UpstoxLoginApi(req: UpstoxLoginReq(code: code)).call();
  }

  Future<CallContext> getOptionChain(String futuresKey, {String? date}) async {
    return await GetOptionChainApi(
            req: GetOptionChainApiReq(futuresKey: futuresKey, date: date))
        .call();
  }
}
