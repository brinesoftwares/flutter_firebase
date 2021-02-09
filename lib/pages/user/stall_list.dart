import 'package:animate_do/animate_do.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_starter/pages/login.dart';
import 'package:flutter_starter/pages/user/food_menu.dart';
import 'package:flutter_starter/services/api_services/fireDB.dart';
import 'package:get/get.dart';

final String _placeholder = 'assets/images/placeholder.jpeg';

class StallList extends StatefulWidget {
  @override
  _StallListState createState() => _StallListState();
}

class _StallListState extends State<StallList> {
  List shops = [
    // {
    //   "stall_name": "Stall 1",
    //   "stall_img":
    //       "https://media.cntraveler.com/photos/58f8eefed3e4d55528e77660/16:9/w_2560%2Cc_limit/GettyImages-588348686.jpg"
    //  },
    // {
    //   "stall_name": "Stall 2",
    //   "stall_img": "https://i.ytimg.com/vi/EK-zTchrRvA/hqdefault.jpg"
    // },
    // {
    //   "stall_name": "Stall 3",
    //   "stall_img":
    //        "https://thumbs.dreamstime.com/z/food-stall-street-yellow-red-seat-putting-enjoying-open-air-meal-31363276.jpg"
    //   },
  ];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    fetchShops();
  }

  void fetchShops() async {
    await Database.fetchStalls().then((value) {
      setState(() {
        _loading = false;
        shops = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Stalls"),
        centerTitle: true,
         backgroundColor:  Colors.amber[700],
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
          : shops.length == 0
              ? Center(
                  child: Text(
                    "No one Stall available",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                )
              : ListView.builder(
                  itemCount: shops.length,
                  physics: ScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, i) {
                    return Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: FadeIn(
                        delay: Duration(milliseconds: 200 * i),
                                              child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                                height: 220,
                                width: Get.width,
                                 decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: new BorderRadius.all(new Radius.circular(15)),
                            border: new Border.all(
                              color: Colors.grey[700],
                              width: 2.0,
                            ),
                             image: DecorationImage(
            image: NetworkImage(shops[i]["shop_image"]),
            fit:  BoxFit.fill
          ),
                          ),
                                // child:Image.asset(_placeholder)
                                
                                //  FadeInImage(
                                //     fit: BoxFit.fill,
                                //     fadeOutDuration: Duration(milliseconds: 2),
                                //     image: shops[i]["stall_img"] != null
                                //         ? NetworkImage(shops[i]["stall_img"])
                                //         : new AssetImage(_placeholder),
                                //     placeholder: AssetImage(_placeholder))
                                    
                                    ),
                           
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                "${shops[i]['first_name']} ${shops[i]['last_name']}" ,
                                style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.amber[900]),
                              ),
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: 
                              SizedBox(
                                height: 35,
                                width: 120,
                                child: RaisedButton(
                                  color: Color(0xfff36f3e),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                  onPressed: () {
                                    Get.to(FoodMenu(),transition: Transition.downToUp,arguments: shops[i]);
                                  },
                                  child: Text(
                                    "View Menu",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
    );
  }
}
