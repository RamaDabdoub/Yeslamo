import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:empty_code/app/my_app.dart';
import 'package:empty_code/core/data/repositry/shared_prefrence_repositry.dart';
import 'package:empty_code/core/services/connectivity_service.dart';
import 'package:empty_code/core/services/location_service.dart';
import 'package:empty_code/core/services/notification_service.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

 
  Get.put(ConnectivitySerivce());
  Get.put(Connectivity());
 

  await Get.putAsync<SharedPreferences>(
    () async {
      return await SharedPreferences.getInstance();
    },
  );

  Get.lazyPut(
    () => SharedPrefrenceRepository(),
  );
    Get.put(LocationService());
  //    Get.Put(
  //     CartService(),
  // );
  
  try {
    await Firebase.initializeApp(
      // options: DefaultFirebaseOptions.currentPlatform,
    );

    Get.put(NotificationService());
  } catch (e) {
    print(e);
  }

  runApp(const MyApp());
}
