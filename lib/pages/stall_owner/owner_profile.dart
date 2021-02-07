import 'package:flutter/material.dart';
import 'package:flutter_starter/pages/sign_up_as.dart';
import 'package:flutter_starter/widgets/profile_widget.dart';
import 'package:get/get.dart';

class OwnerProfile extends StatefulWidget {
  @override
  _OwnerProfileState createState() => _OwnerProfileState();
}

class _OwnerProfileState extends State<OwnerProfile> {

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
        backgroundColor:  Color(0xff701504),
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
                              "Lokeshwaran",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        FlatButton(
                            onPressed: () {
                             
                              Get.offAll(SignUpAs());
                            },
                            child: Text(
                              "Logout",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red),
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ProfileWidget("Last Name", "Ramasamy"),
                    SizedBox(
                      height: 20,
                    ),
                    ProfileWidget("ID Number", "12345567"),
                    
                    SizedBox(
                      height: 20,
                    ),
                    ProfileWidget("Email", "logesh123@gmail.com"),
                    SizedBox(
                      height: 20,
                    ),
                    ProfileWidget("Phone Number", "+60165052995"),
                    SizedBox(
                      height: 20,
                    ),
                    ProfileWidget("Stall Name", "Pizza stall"),
                   ],
                ),
              ),
            ),
    );
  }
}
