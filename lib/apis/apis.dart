import 'package:optionsgenieui/apis/og_login.dart';
import 'package:optionsgenieui/apis/upstox_login_page.dart';
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
}
