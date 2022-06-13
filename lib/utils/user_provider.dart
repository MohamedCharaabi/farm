import 'package:farm_mobile/domain/models/user.dart';
import 'package:flutter/widgets.dart';

class UserProvider extends ChangeNotifier {
  late UserType _userType;

  UserType getuserType() => _userType;

  setUserType(UserType value) {
    _userType = value;
    notifyListeners();
  }
}
