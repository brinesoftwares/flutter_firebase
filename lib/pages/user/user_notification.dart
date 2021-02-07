import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserNotification extends StatefulWidget {
  @override
  _UserNotificationState createState() => _UserNotificationState();
}

class _UserNotificationState extends State<UserNotification> {
  List shops = [
    {
      "stall_name": "Stall 1",
      "stall_img":
          "https://media.cntraveler.com/photos/58f8eefed3e4d55528e77660/16:9/w_2560%2Cc_limit/GettyImages-588348686.jpg"
    },
    {
      "stall_name": "Stall 2",
      "stall_img": "https://i.ytimg.com/vi/EK-zTchrRvA/hqdefault.jpg"
    },
    {
      "stall_name": "Stall 3",
      "stall_img":
          "https://thumbs.dreamstime.com/z/food-stall-street-yellow-red-seat-putting-enjoying-open-air-meal-31363276.jpg"
    },
  ];
  bool _loading = false;


  @override
  void initState() {
    super.initState();
    // fetchShops();
  }

  // void fetchShops() async {
  //   await ApiService().fetchAllShop().then((value) {
  //     setState(() {
  //       _loading = false;
  //       shops = value;
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Notifications"),
        centerTitle: true,
        backgroundColor: Colors.amber[700],
      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child:
        
         ListView.builder(
          itemCount: 5,
          physics: ScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, i) {
            return FadeIn(
                delay: Duration(milliseconds: 180 * i),
                child: ListTile(
                  title: Text("ListTile $i"),
                  subtitle: Text("Sample Subtitle $i"),
                  trailing: Text("3 jun - 11:32",style: TextStyle(fontSize: 12, color: Colors.grey),),
                ));
          },
        ),
      ),
    );
  }
}
