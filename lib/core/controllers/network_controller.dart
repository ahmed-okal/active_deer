import 'package:active_deer/core/views/no_internet_view.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

class NetworkController extends GetxController {
  final Connectivity _connectivity = Connectivity();

  @override
  void onInit() {
    super.onInit();
    _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  void _updateConnectionStatus(List<ConnectivityResult> connectivityResult) {
    if (connectivityResult.contains(ConnectivityResult.none)) {
      if (Get.currentRoute != '/NoInternetView') {
        Get.to(() => const NoInternetView(), routeName: '/NoInternetView');
      }
    } else {
      if (Get.currentRoute == '/NoInternetView') {
        Get.back();
      }
    }
  }
}
