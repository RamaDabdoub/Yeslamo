
import 'package:empty_code/core/enums/connectivity_status.dart';
import 'package:empty_code/ui/shared/utils.dart';
import 'package:get/get.dart';



class MyAppController extends GetxController {
  @override
  void onInit() {
    checkConnection();
    super.onInit();
  }
//checkConnection  لح توصل للستريم المفتوحة على مستوى الابليكيشن وتعمل عليه ليسن
  void checkConnection() async {

    ConnectivityStatus status =
        connectivitySerivce.getStatus(await connectivity.checkConnectivity());
        //  شيكنا حالة الاتصال قبل اي تغييرcheckConnectivity
// بتتغير حالة الاتصال لما المستخدم يطفي النت ويشغلو 
    connectivitySerivce.connectivityStatusController.add(status);
    isOnline = status == ConnectivityStatus.online;

    connectivitySerivce.connectivityStatusController.stream.listen((event) {
      isOnline = event == ConnectivityStatus.online;

      //! if (event == ConnectivityStatus.ONLINE)
      //!   isOnline.value = true;
      //! else
      //!   isOnline.value = false;
    });
  }
}
