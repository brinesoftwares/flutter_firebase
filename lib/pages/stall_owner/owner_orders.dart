import 'dart:math';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_starter/widgets/orders.dart';

class OwnerOrders extends StatefulWidget {
  @override
  _OwnerOrdersState createState() => _OwnerOrdersState();
}

class _OwnerOrdersState extends State<OwnerOrders> {
  List<Color> appbar_color = [Color(0xff701504), Colors.red, Colors.green];
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            onTap: (i) {
              setState(() {
                index = i;
              });
            },
            tabs: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text("Pending"),
              ),
              Text("Cancelled"),
              Text("Completed"),
            ],
          ),
          title: Text('Orders'),
          centerTitle: true,
          backgroundColor: appbar_color[index],
        ),
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            ListView.builder(
              itemCount: 9,
              physics: ScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, i) {
                return Padding(
                  padding: const EdgeInsets.only(
                      right: 15, left: 15, top: 8, bottom: 8),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.amber[50],
                      borderRadius: BorderRadius.circular(8.0),
                      border: new Border.all(
                        color: Colors.grey[700],
                        width: 0.2,
                      ),
                    ),
                    padding: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text(
                              "# 667565",
                              style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.pink[700]),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                        Divider(
                          color: Colors.grey,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Veg Pizza",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "RM 2.65",
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8, bottom: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "Logeshwaran (USR00034)",
                                style: TextStyle(
                                    fontSize: 12, color: Colors.grey[600]),
                              ),
                              Row(
                                children: <Widget>[
                                  Text(
                                    "Qty: ",
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.grey),
                                  ),
                                  Text(
                                    "4",
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Text(
                          "12/06/2020 12:34",
                          style:
                              TextStyle(fontSize: 12, color: Colors.grey[800]),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SizedBox(
                              height: 35,
                              width: 120,
                              child: RaisedButton(
                                color: Colors.red[400],
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                onPressed: () {
                                  // Get.to(FoodMenu(),transition: Transition.downToUp);
                                },
                                child: Text(
                                  "Cancel",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 35,
                              width: 120,
                              child: RaisedButton(
                                color: Colors.green[400],
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                onPressed: () {
                                  // Get.to(FoodMenu(),transition: Transition.downToUp);
                                },
                                child: Text(
                                  "Accept",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                          SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            ListView.builder(
              itemCount: 9,
              physics: ScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, i) {
                return FadeIn(
                    delay: Duration(milliseconds: 160 * i),
                    child: OrderWidget(
                        "667565",
                        "Spicy Chicken Pizza",
                        "3.87",
                        "Ramasamy",
                        "USR0031",
                        3.toString(),
                        "03/03/1997 11:45",
                        Colors.red[50]));
              },
            ),
              ListView.builder(
              itemCount: 9,
              physics: ScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, i) {
                return Padding(
                  padding: const EdgeInsets.only(
                      right: 15, left: 15, top: 8, bottom: 8),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.amber[50],
                      borderRadius: BorderRadius.circular(8.0),
                      border: new Border.all(
                        color: Colors.grey[700],
                        width: 0.2,
                      ),
                    ),
                    padding: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text(
                              "# 667565",
                              style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.pink[700]),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                          ],
                        ),
                        Divider(
                          color: Colors.grey,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "Veg Pizza",
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "RM 2.65",
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8, bottom: 8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "Logeshwaran (USR00034)",
                                style: TextStyle(
                                    fontSize: 12, color: Colors.grey[600]),
                              ),
                              Row(
                                children: <Widget>[
                                  Text(
                                    "Qty: ",
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.grey),
                                  ),
                                  Text(
                                    "4",
                                    style: TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Text(
                          "12/06/2020 12:34",
                          style:
                              TextStyle(fontSize: 12, color: Colors.grey[800]),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                          child:
                           RatingBar.builder(
                          initialRating: Random().nextDouble() *5,
                          minRating: 1,
                          itemSize: 30,
                          ignoreGestures: true,
                          direction: Axis.horizontal,
                          allowHalfRating: false,
                          itemCount: 5,
                          itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                          itemBuilder: (context, _) => Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          onRatingUpdate: (rating) {
                            print(rating);
                          },
                        )
                          
                          
                        ),
                       // SizedBox(
                        //   height: 5,
                        // ),
                      ],
                    ),
                  ),
                );
              },
            ),

          //   ListView.builder(
          //     itemCount: 9,
          //     physics: ScrollPhysics(),
          //     shrinkWrap: true,
          //     itemBuilder: (context, i) {
          //       return FadeIn(
          //           delay: Duration(milliseconds: 160 * i),
          //           child: OrderWidget(
          //               "667565",
          //               "Spicy Chicken Pizza",
          //               "3.87",
          //               "Lokesh",
          //               "USR0031",
          //               3.toString(),
          //               "03/03/1997 11:45",
          //               Colors.green[50]));
          //     },
          //   ),
          ],
        ),
      ),
    );
  }
}
