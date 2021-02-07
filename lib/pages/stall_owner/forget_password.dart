import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter/utils/form_validator.dart';
import 'package:get/get.dart';

class OwnerForgetPassword extends StatefulWidget {
  @override
  _OwnerForgetPasswordState createState() => _OwnerForgetPasswordState();
}

class _OwnerForgetPasswordState extends State<OwnerForgetPassword> {
 
  
  double size = 140;
  GlobalKey<FormState> _key = new GlobalKey();
  bool _validate = false;
  String email;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forget Password"),
        centerTitle: true,
         backgroundColor:  Color(0xff701504),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: FadeIn(
            duration: Duration(seconds: 1),
            child: Column(
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
          "Enter Registered Email",
          style:
              TextStyle(fontWeight: FontWeight.w600, color: Color(0xFF961D08)),
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
          decoration: InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
          ),
          onChanged: (data){
            setState(() {
              email = data;
            });
          },
        ),
      ),
      SizedBox(
        height: 30,
      ),
      Center(
        child: SizedBox(
          height: 40,
          width: MediaQuery.of(context).size.width / 1.8,
          child: RaisedButton(
            color: Color(0xff701504),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            onPressed: () {
              _sendToServer();
            },
            child: Text(
              "Submit",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),]);
  }

  _sendToServer() {
    if (_key.currentState.validate()) {
      _key.currentState.save();
      // Get.to(UserDashboard());
      Get.back();
      Get.snackbar("Sent Mail", "Password is sent to Your Email",
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,barBlur: 50,backgroundColor: Color(0xFF961D08),margin: EdgeInsets.all(5),);

    } else {
      setState(() {
        _validate = true;
      });
    }
  }
}
