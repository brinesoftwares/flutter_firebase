import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter/utils/form_validator.dart';
import 'package:flutter_starter/services/api_services/fireDB.dart';
import 'package:get/get.dart';

class OwnerRegister extends StatefulWidget {
  @override
  _OwnerRegisterState createState() => _OwnerRegisterState();
}

class _OwnerRegisterState extends State<OwnerRegister> {
  double size = 140;
  GlobalKey<FormState> _key = new GlobalKey();
  bool _validate = false;
  String first_name, last_name, id_no, password, email, phone_no, stall_name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: FadeIn(
            duration: Duration(seconds: 1),
            child: new Form(
              key: _key,
              autovalidate: _validate,
              child: FormUI(),
            ),
          ),
        ),
      ),
    );
  }

  Widget FormUI() {
    return new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 50,
          ),
          Center(
            child: CircleAvatar(
              radius: 50,
              backgroundColor: Colors.grey[300],
              child: Icon(
                Icons.add_a_photo,
                size: 30,
                color: Color(0xFFEE2D0B),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 8,
              bottom: 5,
            ),
            child: Text(
              "First Name",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Color(0xff701504),
              ),
            ),
          ),
          Container(
            // height: 40,
            padding: EdgeInsets.only(left: 5),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            child: TextFormField(
              validator: validateName,
              decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
              onChanged: (data) {
                setState(() {
                  first_name = data;
                });
              },
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 8,
              bottom: 5,
            ),
            child: Text(
              "Last Name",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Color(0xff701504),
              ),
            ),
          ),
          Container(
            // height: 40,
            padding: EdgeInsets.only(left: 5),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            child: TextFormField(
              validator: validateName,
              decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
              onChanged: (data) {
                setState(() {
                  last_name = data;
                });
              },
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 8,
              bottom: 5,
            ),
            child: Text(
              "ID Number",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Color(0xff701504),
              ),
            ),
          ),
          Container(
            // height: 40,
            padding: EdgeInsets.only(left: 5),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            child: TextFormField(
              validator: (value) => validateRequired(value, "ID Number"),
              decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
              onChanged: (data) {
                setState(() {
                  id_no = data;
                });
              },
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 8,
              bottom: 5,
            ),
            child: Text(
              "Email",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Color(0xff701504),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 5),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            child: TextFormField(
              validator: validateEmail,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
              onChanged: (data) {
                setState(() {
                  email = data;
                });
              },
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 8,
              bottom: 5,
            ),
            child: Text(
              "Password",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Color(0xff701504),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 5),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            child: TextFormField(
              validator: validatePass,
              decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
              onChanged: (data) {
                setState(() {
                  password = data;
                });
              },
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 8,
              bottom: 5,
            ),
            child: Text(
              "Phone Number",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Color(0xff701504),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 5),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            child: TextFormField(
              validator: (value) => validateRequired(value, "Phone Number"),
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
              onChanged: (data) {
                setState(() {
                  phone_no = data;
                });
              },
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 8,
              bottom: 5,
            ),
            child: Text(
              "Stall Name",
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Color(0xff701504),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 5),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
            ),
            child: TextFormField(
              validator: (value) => validateRequired(value, "User Category"),
              decoration: InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
              onChanged: (data) {
                setState(() {
                  stall_name = data;
                });
              },
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Center(
            child: SizedBox(
              height: 40,
              width: MediaQuery.of(context).size.width / 1.6,
              child: RaisedButton(
                color: Color(0xff701504),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                onPressed: () {
                  _sendToServer();
                },
                child: Text(
                  "Register",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
        ]);
  }

  _sendToServer() {
    if (_key.currentState.validate()) {
      _key.currentState.save();
      // Get.to(GotoPage());
      print(first_name);
      print(last_name);
      print(id_no);
      print(password);
      print(email);
      print(phone_no);
      print(stall_name);
      var _owner = {
        "first_name": first_name,
        "last_name": last_name,
        "id_no": id_no,
        "password": password,
        "email": email,
        "phone_no": phone_no,
        "category": stall_name,
        "shop_image":
            "https://firebasestorage.googleapis.com/v0/b/chumon-ebe18.appspot.com/o/coming-soon-300x221.jpg?alt=media&token=4892b5a7-ffc4-4c07-b83e-615bdaa8a5fb"
      };
      // Get.back();
      Database.ownerCheckMail(_owner);
    } else {
      setState(() {
        _validate = true;
      });
    }
  }
}
