import 'package:get/get_state_manager/src/rx_flutter/rx_disposable.dart';

class UserDataService extends GetxService {
  static final UserDataService _instance = UserDataService._internal();

  factory UserDataService() {
    return _instance;
  }

  UserDataService._internal();
}
