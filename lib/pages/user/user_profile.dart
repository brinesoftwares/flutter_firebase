import 'package:flutter/material.dart';
import 'package:flutter_starter/pages/sign_up_as.dart';
import 'package:flutter_starter/pages/user/user_profile_update.dart';
import 'package:flutter_starter/widgets/profile_widget.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class UserProfile extends StatefulWidget {
  @override
  _UserProfileState createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {

  final box = GetStorage();

  @override
  void initState() {
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("My Profile"),
        centerTitle: true,
        backgroundColor: Colors.amber[700],
        actions: [ ],
      ),
      body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "First Name",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey),
                            ),
                            SizedBox(
                      height: 2,
                    ),
                            Text(
                              box.read("user")["first_name"],
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        FlatButton(
                            onPressed: () {
                              Get.to(UserProfileUpdate());
                            },
                            child: Text(
                              "Update",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green[400]),
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ProfileWidget("Last Name",  box.read("user")["last_name"]),
                    SizedBox(
                      height: 20,
                    ),
                    ProfileWidget("ID Number",  box.read("user")["id_no"]),
                    
                    SizedBox(
                      height: 20,
                    ),
                    ProfileWidget("Email", box.read("user")["email"]),
                    SizedBox(
                      height: 20,
                    ),
                    ProfileWidget("Phone Number", box.read("user")["phone_no"]),
                    SizedBox(
                      height: 20,
                    ),
                    ProfileWidget("Category", box.read("user")["category"]),
                     SizedBox(
                      height: 40,
                    ),
                     Align(
                          alignment: Alignment.center,
                          child: SizedBox(
                            height: 35,
                            width: 180,
                            child: RaisedButton(
                              color: Colors.pink,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              onPressed: () {
                                Get.offAll(SignUpAs());
                                box.erase();
                              },
                              child: Text(
                                "Logout",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                   ],
                ),
              ),
            ),
    );
  }
}
