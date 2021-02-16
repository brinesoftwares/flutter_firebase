import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter/pages/stall_owner/owner_food_menu.dart';
import 'package:flutter_starter/pages/stall_owner/owner_notification.dart';
import 'package:flutter_starter/pages/stall_owner/owner_orders.dart';
import 'package:flutter_starter/pages/stall_owner/owner_profile.dart';
import 'package:flutter_starter/pages/stall_owner/sale_info.dart';
import 'package:flutter_starter/pages/user/stall_list.dart';
import 'package:flutter_starter/pages/user/user_notification.dart';
import 'package:flutter_starter/pages/user/user_orders.dart';
import 'package:flutter_starter/pages/user/user_profile.dart';
import 'package:flutter_starter/services/api_services/fireDB.dart';
import 'package:flutter_starter/utils/form_validator.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class OwnerDashboard extends StatefulWidget {
  @override
  _OwnerDashboardState createState() => _OwnerDashboardState();
}

class _OwnerDashboardState extends State<OwnerDashboard> {
  double size = 140;
  final box = GetStorage();

  @override
  void initState() { 
    // TODO: implement initState
    print(box.read("user")["id"]);
    Database.updateOwnerToken();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
              ),
              FadeIn(
                duration: Duration(seconds: 2),
                child: Image.asset(
                  'assets/images/app_icon/icon.jpg',
                  height: 140,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FadeInLeft(
                    child: InkWell(
                      onTap: () {
                        Get.to(OwnerFoodMenu());
                      },
                      child: Container(
                        width: 150,
                        height: 200,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius:
                              new BorderRadius.all(new Radius.circular(22)),
                          border: new Border.all(
                            color: Colors.grey[700],
                            width: 2.0,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/menu.png',
                              height: 100,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Menu",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color:  Color(0xff701504),),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  FadeInRight(
                    child: InkWell(
                      onTap: (){
                        Get.to(OwnerNotification());
                      },
                                          child: Container(
                        width: 150,
                        height: 200,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius:
                              new BorderRadius.all(new Radius.circular(22)),
                          border: new Border.all(
                            color: Colors.grey[700],
                            width: 2.0,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/notification.png',
                              height: 100,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Notifications",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color:  Color(0xff701504),),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FadeInLeft(
                    delay: Duration(milliseconds: 400),
                    child: InkWell(
                      onTap: (){
                        Get.to(OwnerOrders());
                      },
                                          child: Container(
                        width: 150,
                        height: 200,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius:
                              new BorderRadius.all(new Radius.circular(22)),
                          border: new Border.all(
                            color: Colors.grey[700],
                            width: 2.0,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/order-food.png',
                              height: 100,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Orders",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color:  Color(0xff701504),),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  FadeInRight(
                    delay: Duration(milliseconds: 400),
                    child: InkWell(
                      onTap: (){
                        // Get.to(OwnerProfile());
                        Get.to(SaleInfo());
                      },
                                          child: Container(
                        width: 150,
                        height: 200,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius:
                              new BorderRadius.all(new Radius.circular(22)),
                          border: new Border.all(
                            color: Colors.grey[700],
                            width: 2.0,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/sale.png',
                              height: 100,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Sale",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color:  Color(0xff701504),),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
