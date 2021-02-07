import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter/pages/user/User_Register.dart';
import 'package:flutter_starter/pages/user/forget_password.dart';
import 'package:flutter_starter/pages/user/user_dashboard.dart';
import 'package:flutter_starter/services/api_services/fireDB.dart';
import 'package:flutter_starter/utils/form_validator.dart';
import 'package:get/get.dart';

class UserLogin extends StatefulWidget {
  @override
  _UserLoginState createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  
  double size = 140;
  GlobalKey<FormState> _key = new GlobalKey();
  bool _validate = false;
  String email, password;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: FadeIn(
            duration: Duration(seconds: 1),
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 100,
                ),
                Image.asset(
                  'assets/images/app_icon/icon.jpg',
                  height: 160,
                ),
                SizedBox(
                  height: 20,
                ),
                new Form(
                  key: _key,
                  autovalidate: _validate,
                  child: FormUI(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget FormUI() {
    return new Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
        Widget>[
      SizedBox(
        height: 15,
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
          "Email",
          style:
              TextStyle(fontWeight: FontWeight.w600, color: Colors.amber[800]),
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
          onSaved: (data){
            email = data;
          },
          decoration: InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
          ),
        ),
      ),
      SizedBox(
        height: 25,
      ),
      Padding(
        padding: const EdgeInsets.only(
          left: 8,
          bottom: 5,
        ),
        child: Text(
          "Password",
          style:
              TextStyle(fontWeight: FontWeight.w600, color: Colors.amber[800]),
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
          onSaved: (data){
            password = data;
          },
          decoration: InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
          ),
        ),
      ),
      SizedBox(
        height: 40,
      ),
      Center(
        child: SizedBox(
          height: 40,
          width: MediaQuery.of(context).size.width / 1.5,
          child: RaisedButton(
            color: Color(0xfff36f3e),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            onPressed: () {
              _sendToServer();
            },
            child: Text(
              "Login",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(15.0),
        child: InkWell(
          onTap: (){
            Get.to(ForgetPassword());
          },
                  child: Center(
              child: Text(
            "Forget Password",
            style: TextStyle(color: Colors.blueAccent, fontSize: 12),
          )),
        ),
      ),
      SizedBox(
          height: 20,),
        Center(
        child: SizedBox(
          height: 40,
          width: MediaQuery.of(context).size.width / 1.5,
          child: RaisedButton(
            color: Color(0xfff36f3e),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            onPressed: () {
              Get.to(UserRegister());
            },
            child: Text(
              "Register",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    ]);
  }

  _sendToServer() {

    if (_key.currentState.validate()) {
      _key.currentState.save();
      Database.userLogin(email, password);
        
      // Get.to(UserDashboard());
    } else {
      setState(() {
        _validate = true;
      });
    }
  }
}
