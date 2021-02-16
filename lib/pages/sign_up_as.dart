import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter/pages/stall_owner/owner_login.dart';
import 'package:flutter_starter/pages/user/user_login.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SignUpAs extends StatefulWidget {
  @override
  _SignUpAsState createState() => _SignUpAsState();
}

class _SignUpAsState extends State<SignUpAs> {
  double size = 140;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 100,
          ),
          FadeInDown(
            child: Image.asset(
              'assets/images/app_icon/icon.jpg',
              height: 180,
            ),
          ),
          SizedBox(
            height: 80,
          ),
          FadeIn(
            duration: Duration(seconds: 2),
            child: Text(
              "Sign in as",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.amber[800]),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              FadeInLeft(
                child: InkWell(
                  onTap: () {
                    GetStorage().write("isOwner", false);
                    Get.to(UserLogin());
                  },
                  child: Column(
                    children: [
                      Container(
                        width: size,
                        height: size,
                        decoration: BoxDecoration(
                          color: const Color(0xff7c94b6),
                          borderRadius: new BorderRadius.all(
                              new Radius.circular(size / 2)),
                          border: new Border.all(
                            color: Colors.white,
                            width: 4.0,
                          ),
                        ),
                        child: ClipOval(
                            child: Image.asset('assets/images/users.png')),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text(
                          "Users",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              FadeInRight(
                child: InkWell(
                  onTap: (){
                    GetStorage().write("isOwner", true);

                    Get.to(OwnerLogin());
                  },
                                  child: Column(
                    children: [
                      Container(
                        width: size,
                        height: size,
                        decoration: BoxDecoration(
                          color: const Color(0xFFB6CAE7),
                          borderRadius:
                              new BorderRadius.all(new Radius.circular(size / 2)),
                          border: new Border.all(
                            color: Colors.black,
                            width: 2.4,
                          ),
                        ),
                        child: ClipOval(
                            child: Image.asset('assets/images/stall_owner.png')),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Stall Owner",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
