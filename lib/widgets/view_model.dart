import 'package:artplatform/widgets/Social_Login.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';

class ViewModel {
  final SocialLogin _socialLogin;
  bool isLogined = false;
  User? user;

  ViewModel(this._socialLogin);

  Future login() async {
    isLogined = await _socialLogin.login();
    if (isLogined) {
      user = await UserApi.instance.me();
    }
  }

  Future logout() async {
    await _socialLogin.logout();
    isLogined = false;
    user = null;
  }
}
