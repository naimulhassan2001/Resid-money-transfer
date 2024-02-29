import 'package:flutter/foundation.dart';

import 'package:socket_io_client/socket_io_client.dart' as io;

import '../global/api_url.dart';
import '../helper/shared_preference_helper.dart';
import '../utils/app_utils.dart';
import 'notification_services.dart';

class SocketServices {
  late io.Socket socket;
  bool show = false;

  NotificationService notificationService = NotificationService();
  SharedPreferenceHelper sharedPreferenceHelper = SharedPreferenceHelper();

  void connectToSocket() {
    socket = io.io(
        ApiUrl.baseUrl,
        io.OptionBuilder()
            .setTransports(['websocket'])
            .enableAutoConnect()
            .build());

    socket.onConnect((data) =>
        debugPrint("=============================> Connection $data"));
    socket.onConnectError(
        (data) => print("============================>Connection Error $data"));

    socket.connect();

    socket.on('user-notification::${SharedPreferenceHelper.id}', (data) {
      print("================> get Data on socket: $data");
      notificationService.showNotification(data);
    });

    socket.on('blocked-user::${SharedPreferenceHelper.id}', (data) {
      // print("================> get Data on socket: $data");
      //
      // print(data);
      // print(data.runtimeType);

      print(data['statusCode'].toString());
      print(data['message'].toString());

      if (data['statusCode'] == 1000) {
        sharedPreferenceHelper.logOut() ;
        // Get.offAllNamed(AppRoute.logIn);
        Utils.toastMessage(data['message']);
      }
      // notificationService.showNotification(data);
    });
  }
}
