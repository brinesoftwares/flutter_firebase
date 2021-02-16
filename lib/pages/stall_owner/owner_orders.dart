// import 'dart:math';

// import 'package:animate_do/animate_do.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:flutter_starter/widgets/orders.dart';

// class OwnerOrders extends StatefulWidget {
//   @override
//   _OwnerOrdersState createState() => _OwnerOrdersState();
// }

// class _OwnerOrdersState extends State<OwnerOrders> {
//   List<Color> appbar_color = [Color(0xff701504), Colors.red, Colors.green];
//   int index = 0;
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 3,
//       child: Scaffold(
//         appBar: AppBar(
//           bottom: TabBar(
//             onTap: (i) {
//               setState(() {
//                 index = i;
//               });
//             },
//             tabs: [
//               Padding(
//                 padding: const EdgeInsets.all(12.0),
//                 child: Text("Pending"),
//               ),
//               Text("Cancelled"),
//               Text("Completed"),
//             ],
//           ),
//           title: Text('Orders'),
//           centerTitle: true,
//           backgroundColor: appbar_color[index],
//         ),
//         body: TabBarView(
//           physics: NeverScrollableScrollPhysics(),
//           children: [
//             ListView.builder(
//               itemCount: 9,
//               physics: ScrollPhysics(),
//               shrinkWrap: true,
//               itemBuilder: (context, i) {
//                 return Padding(
//                   padding: const EdgeInsets.only(
//                       right: 15, left: 15, top: 8, bottom: 8),
//                   child: Container(
//                     decoration: BoxDecoration(
//                       color: Colors.amber[50],
//                       borderRadius: BorderRadius.circular(8.0),
//                       border: new Border.all(
//                         color: Colors.grey[700],
//                         width: 0.2,
//                       ),
//                     ),
//                     padding: EdgeInsets.all(10),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: <Widget>[
//                         Row(
//                           children: <Widget>[
//                             Text(
//                               "# 667565",
//                               style: TextStyle(
//                                   fontSize: 13,
//                                   fontWeight: FontWeight.w700,
//                                   color: Colors.pink[700]),
//                             ),
//                             SizedBox(
//                               width: 10,
//                             ),
//                           ],
//                         ),
//                         Divider(
//                           color: Colors.grey,
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: <Widget>[
//                             Text(
//                               "Veg Pizza",
//                               style: TextStyle(
//                                 fontSize: 15,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             Text(
//                               "RM 2.65",
//                               style: TextStyle(
//                                 fontSize: 16,
//                               ),
//                             ),
//                           ],
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(top: 8, bottom: 8),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: <Widget>[
//                               Text(
//                                 "Logeshwaran (USR00034)",
//                                 style: TextStyle(
//                                     fontSize: 12, color: Colors.grey[600]),
//                               ),
//                               Row(
//                                 children: <Widget>[
//                                   Text(
//                                     "Qty: ",
//                                     style: TextStyle(
//                                         fontSize: 12, color: Colors.grey),
//                                   ),
//                                   Text(
//                                     "4",
//                                     style: TextStyle(
//                                       fontSize: 14,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                         Text(
//                           "12/06/2020 12:34",
//                           style:
//                               TextStyle(fontSize: 12, color: Colors.grey[800]),
//                         ),
//                         SizedBox(
//                           height: 10,
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           children: [
//                             SizedBox(
//                               height: 35,
//                               width: 120,
//                               child: RaisedButton(
//                                 color: Colors.red[400],
//                                 shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(8)),
//                                 onPressed: () {
//                                   // Get.to(FoodMenu(),transition: Transition.downToUp);
//                                 },
//                                 child: Text(
//                                   "Cancel",
//                                   style: TextStyle(color: Colors.white),
//                                 ),
//                               ),
//                             ),
//                             SizedBox(
//                               height: 35,
//                               width: 120,
//                               child: RaisedButton(
//                                 color: Colors.green[400],
//                                 shape: RoundedRectangleBorder(
//                                     borderRadius: BorderRadius.circular(8)),
//                                 onPressed: () {
//                                   // Get.to(FoodMenu(),transition: Transition.downToUp);
//                                 },
//                                 child: Text(
//                                   "Accept",
//                                   style: TextStyle(color: Colors.white),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                           SizedBox(
//                           height: 5,
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             ),
//             ListView.builder(
//               itemCount: 9,
//               physics: ScrollPhysics(),
//               shrinkWrap: true,
//               itemBuilder: (context, i) {
//                 return FadeIn(
//                     delay: Duration(milliseconds: 160 * i),
//                     child: OrderWidget(
//                         "667565",
//                         "Spicy Chicken Pizza",
//                         "3.87",
//                         "Ramasamy",
//                         "USR0031",
//                         3.toString(),
//                         "03/03/1997 11:45",
//                         Colors.red[50]));
//               },
//             ),
//               ListView.builder(
//               itemCount: 9,
//               physics: ScrollPhysics(),
//               shrinkWrap: true,
//               itemBuilder: (context, i) {
//                 return Padding(
//                   padding: const EdgeInsets.only(
//                       right: 15, left: 15, top: 8, bottom: 8),
//                   child: Container(
//                     decoration: BoxDecoration(
//                       color: Colors.amber[50],
//                       borderRadius: BorderRadius.circular(8.0),
//                       border: new Border.all(
//                         color: Colors.grey[700],
//                         width: 0.2,
//                       ),
//                     ),
//                     padding: EdgeInsets.all(10),
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: <Widget>[
//                         Row(
//                           children: <Widget>[
//                             Text(
//                               "# 667565",
//                               style: TextStyle(
//                                   fontSize: 13,
//                                   fontWeight: FontWeight.w700,
//                                   color: Colors.pink[700]),
//                             ),
//                             SizedBox(
//                               width: 10,
//                             ),
//                           ],
//                         ),
//                         Divider(
//                           color: Colors.grey,
//                         ),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: <Widget>[
//                             Text(
//                               "Veg Pizza",
//                               style: TextStyle(
//                                 fontSize: 15,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             Text(
//                               "RM 2.65",
//                               style: TextStyle(
//                                 fontSize: 16,
//                               ),
//                             ),
//                           ],
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.only(top: 8, bottom: 8),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: <Widget>[
//                               Text(
//                                 "Logeshwaran (USR00034)",
//                                 style: TextStyle(
//                                     fontSize: 12, color: Colors.grey[600]),
//                               ),
//                               Row(
//                                 children: <Widget>[
//                                   Text(
//                                     "Qty: ",
//                                     style: TextStyle(
//                                         fontSize: 12, color: Colors.grey),
//                                   ),
//                                   Text(
//                                     "4",
//                                     style: TextStyle(
//                                       fontSize: 14,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                         Text(
//                           "12/06/2020 12:34",
//                           style:
//                               TextStyle(fontSize: 12, color: Colors.grey[800]),
//                         ),
//                         SizedBox(
//                           height: 10,
//                         ),
//                         Center(
//                           child:
//                            RatingBar.builder(
//                           initialRating: Random().nextDouble() *5,
//                           minRating: 1,
//                           itemSize: 30,
//                           ignoreGestures: true,
//                           direction: Axis.horizontal,
//                           allowHalfRating: false,
//                           itemCount: 5,
//                           itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
//                           itemBuilder: (context, _) => Icon(
//                             Icons.star,
//                             color: Colors.amber,
//                           ),
//                           onRatingUpdate: (rating) {
//                             print(rating);
//                           },
//                         )
                          
                          
//                         ),
//                        // SizedBox(
//                         //   height: 5,
//                         // ),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             ),

//           //   ListView.builder(
//           //     itemCount: 9,
//           //     physics: ScrollPhysics(),
//           //     shrinkWrap: true,
//           //     itemBuilder: (context, i) {
//           //       return FadeIn(
//           //           delay: Duration(milliseconds: 160 * i),
//           //           child: OrderWidget(
//           //               "667565",
//           //               "Spicy Chicken Pizza",
//           //               "3.87",
//           //               "Lokesh",
//           //               "USR0031",
//           //               3.toString(),
//           //               "03/03/1997 11:45",
//           //               Colors.green[50]));
//           //     },
//           //   ),
//           ],
//         ),
//       ),
//     );
//   }
// }








import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_starter/services/api_services/fireDB.dart';
import 'package:flutter_starter/styles/widgets_style.dart';
import 'package:flutter_starter/utils/form_validator.dart';
import 'package:flutter_starter/widgets/orders.dart';
import 'package:get/get.dart';

class OwnerOrders extends StatefulWidget {
  @override
  _OwnerOrdersState createState() => _OwnerOrdersState();
}

class _OwnerOrdersState extends State<OwnerOrders> {
  List<Color> appbar_color = [Colors.brown[700], Colors.red, Colors.green];
  int index = 0;
  GlobalKey<FormState> _key = new GlobalKey();
  bool _validate = false;
  String reason;
  int selected_reason;
  var rated_food = [];
  bool loading = true;
  List<String> _dynamicChips = [
    'Reason 1',
    'Reason 2',
    'Reason 3',
    'Reason 4',
    'Reason 5',
  ];

  var pending_orders = [];
  var cancelled_orders = [];
  var completed_orders = [];

  TextEditingController reasonController = TextEditingController();

  fetchOredrs() async {
    await Database.fetchOwnerOrders(0).then((value) {
      setState(() {
        pending_orders = value;
        loading = false;
      });
    });
    await Database.fetchOwnerOrders(1).then((value) {
      print(value);
      setState(() {
        cancelled_orders = value;
      });
    });
    await Database.fetchOwnerOrders(2).then((value) {
      setState(() {
        completed_orders = value;
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    fetchOredrs();
    super.initState();
  }

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
            loading
                ? Center(
                    child: SizedBox(
                      height: 30,
                      child: SpinKitThreeBounce(
                        color: Colors.green,
                        size: 25.0,
                      ),
                    ),
                  )
                :  pending_orders.length == 0 ? Center(
                      child: Text(
                        "No pending orders",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                    ) :  ListView.builder(
                    itemCount: pending_orders.length,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    "# ${pending_orders[i]['order_id']}",
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.pink[700]),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    pending_orders[i]['date'],
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.grey[800]),
                                  ),
                                ],
                              ),
                              Divider(
                                color: Colors.grey,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "${pending_orders[i]['name']} (${pending_orders[i]['user_id_no']})",
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.grey[600]),
                                  ),
                                  Row(
                                    children: <Widget>[
                                      Text(
                                        "Total",
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 12,
                                      ),
                                      Text(
                                        "RM ${pending_orders[i]['total']}",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              // Padding(
                              //   padding: const EdgeInsets.only(top: 8, bottom: 8),
                              //   child: Row(
                              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              //     children: <Widget>[
                              //       Text(
                              //         "Logeshwaran (USR00034)",
                              //         style: TextStyle(
                              //             fontSize: 12, color: Colors.grey[600]),
                              //       ),
                              //       Row(
                              //         children: <Widget>[
                              //           Text(
                              //             "Qty: ",
                              //             style: TextStyle(
                              //                 fontSize: 12, color: Colors.grey),
                              //           ),
                              //           Text(
                              //             "4",
                              //             style: TextStyle(
                              //               fontSize: 14,
                              //             ),
                              //           ),
                              //         ],
                              //       ),
                              //     ],
                              //   ),
                              // ),
                              // // Text(
                              //   "12/06/2020 12:34",style:TextStyle(fontSize: 12, color: Colors.grey[800]),
                              // ),
                              SizedBox(
                                height: 10,
                              ),

                              ListView.builder(
                                  itemCount: pending_orders[i]["foods"].length,
                                  physics: ScrollPhysics(),
                                  shrinkWrap: true,
                                  itemBuilder: (context, _i) {
                                    return Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                              flex: 3,
                                              child: Text(
                                                  pending_orders[i]['foods'][_i]
                                                      ['food'],
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.bold))),
                                          Expanded(
                                              flex: 2,
                                              child: Text(
                                                  "${pending_orders[i]['foods'][_i]['qty']} X RM ${pending_orders[i]['foods'][_i]['price']}",
                                                  style: TextStyle(
                                                      fontSize: 10,
                                                      color:
                                                          Colors.grey[800]))),
                                          Expanded(
                                              flex: 4,
                                              child: pending_orders[i]['foods']
                                                          [_i]['user_add_ons']
                                                      .toString()
                                                      .isEmpty
                                                  ? Text("---",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color:
                                                              Colors.grey[600]))
                                                  : Text(
                                                      pending_orders[i]['foods']
                                                          [_i]['user_add_ons'],
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color: Colors
                                                              .grey[600]))),
                                        ],
                                      ),
                                    );
                                  }),

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
                                  Get.dialog(cancelWidget(i),
                                          barrierDismissible: false);
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
                                  setState(() {
                                    loading = true;
                                  });
                                  Database.updateOwnerAccept(pending_orders[i]["_id"]).then((value) {
                                      fetchOredrs();
                                  Database.getUserToken(pending_orders[i]["user_id"],"Order Accepted", "Your order (${pending_orders[i]["user_id"]}) Accepted");

                                  });


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




          cancelled_orders.length == 0 ? Center(
                      child: Text(
                        "No cancelled orders",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                    ) :  ListView.builder(
              itemCount: cancelled_orders.length,
              physics: ScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, i) {
                return Padding(
                  padding: const EdgeInsets.only(
                      right: 15, left: 15, top: 8, bottom: 8),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.red[50],
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "# ${cancelled_orders[i]['order_id']}",
                              style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.pink[700]),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              cancelled_orders[i]['date'],
                              style: TextStyle(
                                  fontSize: 12, color: Colors.grey[800]),
                            ),
                          ],
                        ),
                        Divider(
                          color: Colors.grey,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${cancelled_orders[i]['name']} (${cancelled_orders[i]['user_id_no']})",
                              style: TextStyle(
                                  fontSize: 12, color: Colors.grey[600]),
                            ),
                            Row(
                              children: <Widget>[
                                Text(
                                  "Total",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  width: 12,
                                ),
                                Text(
                                  "RM ${cancelled_orders[i]['total']}",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ListView.builder(
                            itemCount: cancelled_orders[i]["foods"].length,
                            physics: ScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, _i) {
                              return Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                        flex: 3,
                                        child: Text(
                                            cancelled_orders[i]['foods'][_i]
                                                ['food'],
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold))),
                                    Expanded(
                                        flex: 2,
                                        child: Text(
                                            "${cancelled_orders[i]['foods'][_i]['qty']} X RM ${cancelled_orders[i]['foods'][_i]['price']}",
                                            style: TextStyle(
                                                fontSize: 10,
                                                color: Colors.grey[800]))),
                                    Expanded(
                                        flex: 4,
                                        child: cancelled_orders[i]['foods'][_i]
                                                    ['user_add_ons']
                                                .toString()
                                                .isEmpty
                                            ? Text("---",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.grey[600]))
                                            : Text(
                                                cancelled_orders[i]['foods'][_i]
                                                    ['user_add_ons'],
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.grey[600]))),
                                  ],
                                ),
                              );
                            }),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text("Cancelled by : ",
                                style: TextStyle(
                                    fontSize: 12, color: Colors.grey[600])),
                                     Text( cancelled_orders[i]['user_cancel_reason'].toString().isEmpty ? "You" :"Shop",
                                style: TextStyle(
                                    fontSize: 11, fontWeight: FontWeight.bold)),
                          ],
                        ),
                          SizedBox(
                          height: 5,
                        ),
                         Row(
                          children: [
                            Text("Reason : ",
                                style: TextStyle(
                                    fontSize: 12, color: Colors.grey[600])),
                                     Text( cancelled_orders[i]['owner_cancel_reason'].toString().isEmpty ? cancelled_orders[i]['user_cancel_reason'].toString() :cancelled_orders[i]['owner_cancel_reason'].toString(),
                                style: TextStyle(
                                    fontSize: 11, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),




           completed_orders.length == 0 ? Center(
                      child: Text(
                        "No Completed orders",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                    ) :   ListView.builder(
              itemCount: completed_orders.length,
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              "# ${completed_orders[i]['order_id']}",
                              style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.pink[700]),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              completed_orders[i]['date'],
                              style: TextStyle(
                                  fontSize: 12, color: Colors.grey[800]),
                            ),
                          ],
                        ),
                        Divider(
                          color: Colors.grey,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${completed_orders[i]['name']} (${completed_orders[i]['user_id_no']})",
                              style: TextStyle(
                                  fontSize: 12, color: Colors.grey[600]),
                            ),
                            Row(
                              children: <Widget>[
                                Text(
                                  "Total",
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  width: 12,
                                ),
                                Text(
                                  "RM ${completed_orders[i]['total']}",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ListView.builder(
                            itemCount: completed_orders[i]["foods"].length,
                            physics: ScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, _i) {
                              return Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                        flex: 3,
                                        child: Text(
                                            completed_orders[i]['foods'][_i]
                                                ['food'],
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold))),
                                    Expanded(
                                        flex: 2,
                                        child: Text(
                                            "${completed_orders[i]['foods'][_i]['qty']} X RM ${completed_orders[i]['foods'][_i]['price']}",
                                            style: TextStyle(
                                                fontSize: 10,
                                                color: Colors.grey[800]))),
                                    Expanded(
                                        flex: 4,
                                        child: completed_orders[i]['foods'][_i]
                                                    ['user_add_ons']
                                                .toString()
                                                .isEmpty
                                            ? Text("---",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.grey[600]))
                                            : Text(
                                                completed_orders[i]['foods'][_i]
                                                    ['user_add_ons'],
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: Colors.grey[600]))),
                                  ],
                                ),
                              );
                            }),
                        
                      
                      
                        SizedBox(
                          height: 10,
                        ),
                        Center(
                            child:completed_orders[i]["review"] > 0 ?  RatingBar.builder(
                                    initialRating: 3,
                                    minRating: 1,
                                    itemSize: 30,
                                    direction: Axis.horizontal,
                                    allowHalfRating: false,
                                    itemCount: 5,
                                    itemPadding:
                                        EdgeInsets.symmetric(horizontal: 2.0),
                                    itemBuilder: (context, _) => Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                    ),
                                    onRatingUpdate: (rating) {
                                      print(rating.toInt());
                                      Database.updateUserRating(rating.toInt(), completed_orders[i]["_id"]);
                                    },
                                  )
                                : Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                          "Not Rated",
                                          style: TextStyle(color: Colors.grey,fontSize: 16),
                                        ),
                                ),
                        )
                        // SizedBox(
                        //   height: 5,
                        // ),
                      ],
                    ),
                  ),
                );
              },
            ),

          ],
        ),
      ),
    );
  }

  Widget cancelWidget(int index) {
    return FadeInDown(
      duration: Duration(milliseconds: 300),
      child: Dialog(
        insetPadding: EdgeInsets.all(25),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(
                  height: 5,
                ),
                new Form(
                  key: _key,
                  autovalidate: _validate,
                  child: FormUI(),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    SizedBox(
                      width: Get.width / 3,
                      height: 40,
                      child: RaisedButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: Text(
                          "Dismiss",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w700),
                        ),
                        color: Colors.red,
                        textColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(8.0),
                        ),
                        padding: EdgeInsets.all(14),
                      ),
                    ),
                    SizedBox(
                      width: Get.width / 3,
                      height: 40,
                      child: RaisedButton(
                        onPressed: () {
                          _inputValidate(index);
                        },
                        child: Text(
                          "Proceed",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w700),
                        ),
                        color: Colors.green,
                        textColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(8.0),
                        ),
                        padding: EdgeInsets.all(14),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget FormUI() {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Reason for Cancel?",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: Colors.amber[900])),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: new TextFormField(
              controller: reasonController,
              maxLines: 3,
              decoration: new InputDecoration(
                  hintText: 'Reason',
                  contentPadding: new EdgeInsets.all(12),
                  border: customBorder,
                  focusedBorder: customFocusedBorder,
                  enabledBorder: customEnabledBorder),
              keyboardType: TextInputType.text,
              validator: (value) => validateRequired(value, "Reason"),
              onSaved: (String val) {
                reason = val;
              }),
        ),
        Wrap(
          spacing: 5.0,
          runSpacing: 1.0,
          children: List<Widget>.generate(_dynamicChips.length, (int index) {
            return InkWell(
              onTap: () {
                reasonController.text = _dynamicChips[index];
                setState(() {
                  selected_reason = index;
                  reason = _dynamicChips[index];
                });
              },
              child: Chip(
                label: Text(_dynamicChips[index]),
                backgroundColor: Colors.grey[300],
              ),
            );
          }),
        )
      ],
    );
  }

  _inputValidate(int index) {
    if (_key.currentState.validate()) {
      _key.currentState.save();
      print(reason);
      print(pending_orders[index]);
      Get.back();
      setState(() {
        loading = true;
      });
      Database.updateOwnerCancel(reason,pending_orders[index]["_id"]).then((value) {
        fetchOredrs();
       Database.getUserToken(pending_orders[index]["user_id"],"Order Cancelled", "Your order (${pending_orders[index]["user_id"]}) Cancelled");

        reasonController.text = "";
      });

    } else {
      setState(() {
        _validate = true;
      });
    }
  }
}

