import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_starter/services/api_services/fireDB.dart';
import 'package:get/get.dart';

class UserNotification extends StatefulWidget {
  @override
  _UserNotificationState createState() => _UserNotificationState();
}

class _UserNotificationState extends State<UserNotification> {
var notifications =[];
  bool _loading = true;


  @override
  void initState() {
    super.initState();
    fetchNotification();
  }

  void fetchNotification() async {
    await Database.userNotification().then((value) {
      setState(() {
        _loading = false;
        notifications = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Notifications"),
        centerTitle: true,
        backgroundColor: Color(0xff701504),
      ),
      body: _loading
             ? Center(
                 child: SizedBox(
                   height: 30,
                   child: SpinKitThreeBounce(
                     color: Colors.green,
                     size: 25.0,
                   ),
                 ),
               )
             : notifications.length == 0 ? Center(
                   child: Text(
                     "No Notifications",
                     style: TextStyle(
                         fontSize: 16, fontWeight: FontWeight.w700),
                   ),
                 ) :  ListView.builder(
       itemCount: notifications.length,
       physics: ScrollPhysics(),
       shrinkWrap: true,
       itemBuilder: (context, i) {
         return FadeIn(
             delay: Duration(milliseconds: 180 * i),
             child: ListTile(
               title: Text( notifications[i]["status"] == 1 ? "Order Cancelled" : "Order Accepted"),
               subtitle: Text( notifications[i]["status"] == 1 ? "Your Order - ${notifications[i]["order_id"]} cancelled" : "Your order ${notifications[i]["order_id"]} accepted"),
               trailing: Text(notifications[i]["date"],style: TextStyle(fontSize: 10, color: Colors.black87),),
             ));
       },
        ),
    );
  }
}
