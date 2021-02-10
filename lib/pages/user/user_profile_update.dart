import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter/utils/form_validator.dart';
import 'package:flutter_starter/widgets/loading_widget.dart';
import 'package:get/get.dart';
import 'package:flutter_starter/services/api_services/fireDB.dart';
import 'package:get_storage/get_storage.dart';

class UserProfileUpdate extends StatefulWidget {
  @override
  _UserProfileUpdateState createState() => _UserProfileUpdateState();
}

class _UserProfileUpdateState extends State<UserProfileUpdate> {
  double size = 140;
  GlobalKey<FormState> _key = new GlobalKey();
  bool _validate = false;
  String first_name, last_name, id_no, password, email, phone_no, category;
  final box = GetStorage();

  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      first_name =   box.read("user")["first_name"];
      last_name =   box.read("user")["last_name"];
      id_no =   box.read("user")["id_no"];
      password =   box.read("user")["password"];
      email =   box.read("user")["email"];
      phone_no =   box.read("user")["phone_no"];
      category =      box.read("user")["category"];
      });
    super.initState();
  }

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
    return new Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
        Widget>[
      SizedBox(
        height: 50,
      ),
      // Center(
      //   child: CircleAvatar(
      //     radius: 50,
      //     backgroundColor: Colors.grey[300],
      //     child: Icon(
      //       Icons.add_a_photo,
      //       size: 30,
      //     ),
      //   ),
      // ),
       Center(
         child: Image.asset(
                    'assets/images/app_icon/icon.jpg',
                    height: 120,
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
          style:
              TextStyle(fontWeight: FontWeight.w600, color: Colors.amber[800]),
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
          initialValue: box.read("user")["first_name"],
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
          style:
              TextStyle(fontWeight: FontWeight.w600, color: Colors.amber[800]),
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
          initialValue: box.read("user")["last_name"],
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
          style:
              TextStyle(fontWeight: FontWeight.w600, color: Colors.amber[800]),
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
          initialValue: box.read("user")["id_no"],
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
          initialValue: box.read("user")["email"],
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
          initialValue: box.read("user")["password"],
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
          initialValue: box.read("user")["phone_no"],
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
          "User Category",
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
          initialValue: box.read("user")["category"],
          validator: (value) => validateRequired(value, "User Category"),
          decoration: InputDecoration(
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
          ),
          onChanged: (data) {
            setState(() {
              category = data;
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
            color: Color(0xfff36f3e),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            onPressed: () {
              _sendToServer();
            },
            child: Text(
              "Update",
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

  _sendToServer() async{
    if (_key.currentState.validate()) {
      _key.currentState.save();
      // Get.to(GotoPage());
      print(first_name);
      print(last_name);
      print(id_no);
      print(password);
      print(email);
      print(phone_no);
      print(category);

      var _user = {
        "first_name": first_name,
        "last_name": last_name,
        "id_no": id_no,
        "password": password,
        "email": email,
        "phone_no": phone_no,
        "category": category,
      };
      await Database.updateUserProfile(_user);
    } else {
      setState(() {
        _validate = true;
      });
    }
  }
}
