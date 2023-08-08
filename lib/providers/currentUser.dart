import 'package:artplatform/api/user_api/user_apidata.dart';
import 'package:artplatform/api/user_api/user_model.dart';
import 'package:flutter/material.dart';

class CurrentUserProvider extends ChangeNotifier {
  String? _logged = '';
  String? get logged => _logged;

  UserModel? _user;
  UserModel? get user => _user;

  void setLogin(String status) {
    _logged = status;
    notifyListeners();
  }

  Future<void> getUser(String id) async {
    _user = await UserApiData.getcurrentUser(id);
    print(user!.id);
    print(user!.name);
    notifyListeners();
  }
}
