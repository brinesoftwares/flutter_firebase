import 'package:flutter/material.dart';
import 'package:flutter_starter/pages/home.dart';
import 'package:flutter_starter/pages/intro.dart';
import 'package:flutter_starter/pages/login.dart';
import 'package:flutter_starter/pages/sign_up_as.dart';
import 'package:flutter_starter/pages/stall_owner/add_food.dart';
import 'package:flutter_starter/pages/stall_owner/owner_food_menu.dart';
import 'package:flutter_starter/pages/stall_owner/sale_info.dart';
import 'package:flutter_starter/pages/user/food_menu.dart';
import 'package:flutter_starter/pages/user/stall_list.dart';
import 'package:flutter_starter/pages/user/user_dashboard.dart';
import 'package:flutter_starter/pages/user/user_order_success.dart';
import 'package:flutter_starter/pages/user/user_orders.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async{
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final box = GetStorage();

  Widget goto(){
    if(box.hasData('intro')) {
      if(box.hasData('login')){
        return HomePage();
      }
      else{
        return LoginPage();
      }
    }
    else{
      return Intro();
    }
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
      home: SignUpAs(),
      // Intro(),
      defaultTransition: Transition.native,
    );
  }
}
