import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_starter/styles/widgets_style.dart';
import 'package:flutter_starter/utils/form_validator.dart';
import 'package:flutter_starter/widgets/orders.dart';
import 'package:get/get.dart';

class UserOrders extends StatefulWidget {
  @override
  _UserOrdersState createState() => _UserOrdersState();
}

class _UserOrdersState extends State<UserOrders> {
  List<Color> appbar_color = [Colors.amber[700], Colors.red, Colors.green];
  int index = 0;
  GlobalKey<FormState> _key = new GlobalKey();
  bool _validate = false;
  String reason;
  int selected_reason;
  var rated_food = [];
  List<String> _dynamicChips = [
    'Reason 1',
    'Reason 2',
    'Reason 3',
    'Reason 4',
    'Reason 5',
  ];
  TextEditingController reasonController = TextEditingController();
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
                        Align(
                          alignment: Alignment.centerRight,
                          child: SizedBox(
                            height: 35,
                            width: 120,
                            child: RaisedButton(
                              color: Colors.red[400],
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              onPressed: () {
                                // Get.to(FoodMenu(),transition: Transition.downToUp);
                                Get.dialog(cancelWidget(),
                                    barrierDismissible: false);
                              },
                              child: Text(
                                "Cancel",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
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
                          child: rated_food.contains(i) ?
                           RatingBar.builder(
                          initialRating: 3,
                          minRating: 1,
                          itemSize: 30,
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
                        ) :
                       
                           SizedBox(
                            height: 35,
                            width: 120,
                            child: RaisedButton(
                              color: Colors.amber[400],
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              onPressed: () {
                                setState(() {
                                  rated_food.add(i);
                                });
                              },
                              child: Text(
                                "Rate",
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
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

            // ListView.builder(
            //   itemCount: 9,
            //   physics: ScrollPhysics(),
            //   shrinkWrap: true,
            //   itemBuilder: (context, i) {
            //     return FadeIn(
            //         delay: Duration(milliseconds: 160 * i),
            //         child: OrderWidget(
            //             "667565",
            //             "Spicy Chicken Pizza",
            //             "3.87",
            //             "Lokesh",
            //             "USR0031",
            //             3.toString(),
            //             "03/03/1997 11:45",
            //             Colors.green[50]));
            //   },
            // ),
          ],
        ),
      ),
    );
  }

  Widget cancelWidget() {
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
                          _inputValidate();
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

  _inputValidate() {
    if (_key.currentState.validate()) {
      _key.currentState.save();
      print(reason);
    } else {
      setState(() {
        _validate = true;
      });
    }
  }
}
