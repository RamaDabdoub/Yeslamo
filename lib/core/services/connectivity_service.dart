import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:empty_code/core/enums/connectivity_status.dart';




class ConnectivitySerivce {
  StreamController<ConnectivityStatus> connectivityStatusController =
      StreamController<ConnectivityStatus>();

  ConnectivitySerivce() {
    //Connectivity from connectivityplus
    Connectivity connectivity = Connectivity();

    connectivity.onConnectivityChanged.listen((event) {
      connectivityStatusController.add(getStatus(event));
    });
  }

  ConnectivityStatus getStatus(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.bluetooth:
        return ConnectivityStatus.online;
      case ConnectivityResult.wifi:
        return ConnectivityStatus.online;
      case ConnectivityResult.ethernet:
        return ConnectivityStatus.online;
      case ConnectivityResult.mobile:
        return ConnectivityStatus.online;
      case ConnectivityResult.none:
        return ConnectivityStatus.offline;
      case ConnectivityResult.vpn:
        return ConnectivityStatus.online;
      case ConnectivityResult.other:
        return ConnectivityStatus.online;
    }
  }
}
