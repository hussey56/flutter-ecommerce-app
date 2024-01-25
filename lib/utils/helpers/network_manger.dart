import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:ecom3/common/widgets/loaders/myloaders.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class NetworkManager extends GetxController {
  static NetworkManager get instance => Get.find();

  final Connectivity _connctivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _connectivitySubscription;
  final Rx<ConnectivityResult> _connectedStatus = ConnectivityResult.none.obs;

  // Initialize
  @override
  void onInit() {
    super.onInit();
    _connectivitySubscription =
        _connctivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    _connectedStatus.value = result;
    if (_connectedStatus.value == ConnectivityResult.none) {
      HLoaders.warningSnackBar(title: "No InternetConnection");
    }
  }

  Future<bool> isConnected() async {
    try {
      final result = await _connctivity.checkConnectivity();
      if (result == ConnectivityResult.none) {
        return false;
      } else {
        return true;
      }
    } on PlatformException catch (_) {
      return false;
    }
  }
  @override
  void onClose(){
    super.onClose();
    _connectivitySubscription.cancel();
  }
}
