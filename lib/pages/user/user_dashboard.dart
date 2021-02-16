import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter/pages/user/stall_list.dart';
import 'package:flutter_starter/pages/user/user_notification.dart';
import 'package:flutter_starter/pages/user/user_orders.dart';
import 'package:flutter_starter/pages/user/user_profile.dart';
import 'package:flutter_starter/services/api_services/fireDB.dart';
import 'package:flutter_starter/utils/form_validator.dart';
import 'package:get/get.dart';

class UserDashboard extends StatefulWidget {
  @override
  _UserDashboardState createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {
  double size = 140;

  @override
  void initState() {
    // TODO: implement initState
    Database.updateUserToken();
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
                        Get.to(StallList());
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
                              'assets/images/food-stall.png',
                              height: 100,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Stalls",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.amber[900]),
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
                        Get.to(UserNotification());
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
                                  color: Colors.amber[900]),
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
                        Get.to(UserOrders());
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
                                  color: Colors.amber[900]),
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
                        Get.to(UserProfile());
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
                              'assets/images/setting.png',
                              height: 100,
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Text(
                              "Profile",
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.amber[900]),
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
