import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter/pages/home.dart';
import 'package:flutter_starter/pages/intro.dart';
import 'package:flutter_starter/pages/login.dart';
import 'package:flutter_starter/pages/sign_up_as.dart';
import 'package:flutter_starter/pages/stall_owner/add_food.dart';
import 'package:flutter_starter/pages/stall_owner/owner_dashboard.dart';
import 'package:flutter_starter/pages/stall_owner/owner_food_menu.dart';
import 'package:flutter_starter/pages/stall_owner/owner_orders.dart';
import 'package:flutter_starter/pages/stall_owner/sale_info.dart';
import 'package:flutter_starter/pages/user/food_menu.dart';
import 'package:flutter_starter/pages/user/stall_list.dart';
import 'package:flutter_starter/pages/user/user_dashboard.dart';
import 'package:flutter_starter/pages/user/user_order_success.dart';
import 'package:flutter_starter/pages/user/user_orders.dart';
import 'package:flutter_starter/widgets/orders.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vibration/vibration.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final box = GetStorage();
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

  Widget goto() {
    if (box.hasData("isOwner")) {
      if (box.read("isOwner")) {
        return OwnerDashboard();
      } else {
        return UserDashboard();
      }
    } else {
      return SignUpAs();
    }
  }

  @override
  void initState() {
    super.initState();
    _firebaseMessaging.getToken().then((String token) {
      print(token);
    });
    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("message");
        print(message);
        if (await Vibration.hasVibrator()) {
          Vibration.vibrate(duration: 600);
        }
        Get.snackbar(
            message["notification"]["title"], message["notification"]["body"],
            colorText: Colors.white,
            barBlur: 100,
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            dismissDirection: SnackDismissDirection.HORIZONTAL,
            borderRadius: 8,
            margin: EdgeInsets.all(15),
            isDismissible: true);
      },
      onLaunch: (Map<String, dynamic> message) async {
        await Get.to(box.read("isOwner") ? OwnerOrders() : UserOrders());
      },
      onResume: (Map<String, dynamic> message) async {
        await Get.to(box.read("isOwner") ? OwnerOrders() : UserOrders());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: "Josefin",
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: goto(),
      // Intro(),
      defaultTransition: Transition.native,
    );
  }
}
