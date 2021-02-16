import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_starter/pages/user/user_order_success.dart';
import 'package:flutter_starter/services/api_services/fireDB.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

class FoodMenu extends StatefulWidget {
  @override
  _FoodMenuState createState() => _FoodMenuState();
}

class _FoodMenuState extends State<FoodMenu> {
  List foods = [
    // {
    //   "food": "Burger",
    //   "price": 5.6,
    //   "describtion": "This is the veg burger",
    //   "imag":
    //       "https://media.cntraveler.com/photos/58f8eefed3e4d55528e77660/16:9/w_2560%2Cc_limit/GettyImages-588348686.jpg"
    // },
    // {
    //   "food": "Pizza",
    //   "price": 2.8,
    //   "describtion": "This is the veg Pizza",
    //   "imag": "https://i.ytimg.com/vi/EK-zTchrRvA/hqdefault.jpg"
    // },
    // {
    //   "food": "Pepsi",
    //   "price": 1.8,
    //   "describtion": "This is the pepsi",
    //   "imag":
    //       "https://thumbs.dreamstime.com/z/food-stall-street-yellow-red-seat-putting-enjoying-open-air-meal-31363276.jpg"
    // },
  ];
  var stall_data;
  bool _loading = true;
  int selectedRadioTile = 0;

  int qty = 1;

  var product_url =
      "https://s3.eu-west-2.amazonaws.com/www.grocy.shop/products/images/3f6ec1e6-f062-42f8-ac38-67d2dc87e031.jpg";
  List my_cart = [];
  final box = GetStorage();

  @override
  void initState() {
    super.initState();
    setState(() {
      stall_data = Get.arguments;
    });
    print(stall_data);
    fetchFoods();
  }

  void fetchFoods() async {
    print(stall_data["shop_id"]);
    await Database.fetchFoods(stall_data["shop_id"]).then((value) {
      setState(() {
        _loading = false;
        foods = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Menu"),
        centerTitle: true,
        backgroundColor: Colors.amber[700],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              "${stall_data['first_name']} ${stall_data['last_name']}",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          Container(
            height: 220,
            width: Get.width,
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: new BorderRadius.all(new Radius.circular(10)),
              // border: new Border.all(
              //   color: Colors.grey[700],
              //   width: 2.0,
              // ),
              image: DecorationImage(
                  image: NetworkImage(stall_data['shop_image']),
                  fit: BoxFit.fill),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          _loading
              ? Center(
                  child: SizedBox(
                    height: 30,
                    child: SpinKitThreeBounce(
                      color: Colors.green,
                      size: 25.0,
                    ),
                  ),
                )
              : foods.length == 0
                  ? Center(
                      child: Text(
                        "No food available",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                    )
                  : ListView.builder(
                      itemCount: foods.length,
                      physics: ScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, i) {
                        return ZoomIn(
                            delay: Duration(milliseconds: 150 * i),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: (my_cart
                                          .where((element) =>
                                              element["food"] ==
                                              foods[i]["food"])
                                          .isNotEmpty)
                                      ? Colors.amber[100]
                                      : Colors.transparent,
                                  borderRadius: new BorderRadius.all(
                                      new Radius.circular(10)),
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 8,
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(3.0),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            child: FadeInImage(
                                                fit: BoxFit.cover,
                                                width: 80,
                                                height: 80,
                                                fadeOutDuration:
                                                    Duration(milliseconds: 2),
                                                image: product_url != null
                                                    ? NetworkImage(
                                                        foods[i]["imag"])
                                                    : new AssetImage(
                                                        'assets/images/app_icon/icon.jpg'),
                                                placeholder: AssetImage(
                                                    'assets/images/app_icon/icon.jpg')),
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            if (my_cart
                                                .where((element) =>
                                                    element["food"] ==
                                                    foods[i]["food"])
                                                .isEmpty) {
                                              setState(() {
                                                my_cart.add(foods[i]);
                                                my_cart[my_cart.indexWhere(
                                                        (element) =>
                                                            element["food"] ==
                                                            foods[i]["food"])]
                                                    ["qty"] = 1;
                                                my_cart[my_cart.indexWhere(
                                                        (element) =>
                                                            element["food"] ==
                                                            foods[i]["food"])]
                                                    ["user_add_ons"] = "";
                                              });
                                            } else {
                                              setState(() {
                                                // my_cart.removeAt(my_cart.indexWhere(
                                                //     (element) =>
                                                //         element["food"] ==
                                                //         foods[i]["food"]));
                                              });
                                            }
                                            print(my_cart);
                                          },
                                          child: Container(
                                              margin: EdgeInsets.only(
                                                left: 5,
                                              ),
                                              child: Container(
                                                width: Get.width / 1.55,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      width: Get.width / 2,
                                                      margin: EdgeInsets.only(
                                                          top: 7, bottom: 7),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Container(
                                                            child: Text(
                                                              foods[i]["food"],
                                                              maxLines: 2,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              style: TextStyle(
                                                                  fontSize: 13,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 5,
                                                          ),
                                                          Text(
                                                            foods[i]
                                                                ["describtion"],
                                                            maxLines: 4,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: TextStyle(
                                                                fontSize: 12,
                                                                color: Colors
                                                                    .grey[700]),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              top: 9),
                                                      child: Text(
                                                        "RM ${foods[i]["price"]}",
                                                        style: TextStyle(
                                                            fontSize: 13,
                                                            fontWeight:
                                                                FontWeight.w700,
                                                            color: Colors
                                                                .brown[700]),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              )),
                                        ),
                                      ],
                                    ),
                                    (my_cart
                                            .where((element) =>
                                                element["food"] ==
                                                foods[i]["food"])
                                            .isNotEmpty)
                                        ? Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 10),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                // DropdownButtonHideUnderline(
                                                //   child: new DropdownButton<
                                                //       String>(
                                                //     hint: Text(
                                                //       "Add-Ons",
                                                //       style: TextStyle(
                                                //           fontSize: 15),
                                                //     ),
                                                //     value: my_cart[
                                                //             my_cart.indexWhere(
                                                //                 (element) =>
                                                //                     element[
                                                //                         "food"] ==
                                                //                     foods[i][
                                                //                         "food"])]
                                                //         ["add_on"],
                                                //     items: <String>[
                                                //       'add_on1',
                                                //       'add_on2',
                                                //       'add_on3',
                                                //       'add_on4'
                                                //     ].map((String value) {
                                                //       return new DropdownMenuItem<
                                                //           String>(
                                                //         value: value,
                                                //         child: new Text(value),
                                                //       );
                                                //     }).toList(),
                                                //     onChanged: (data) {
                                                //       print(data);
                                                //       setState(() {
                                                //         my_cart[my_cart.indexWhere(
                                                //                 (element) =>
                                                //                     element[
                                                //                         "food"] ==
                                                //                     foods[i][
                                                //                         "food"])]
                                                //             ["add_on"] = data;
                                                //       });
                                                //     },
                                                //   ),
                                                // ),

                                                FlatButton(
                                                  onPressed: () {
                                                    int _index = my_cart.indexWhere(
                                                        (element) =>
                                                            element["food"] ==
                                                            foods[i]["food"]);
                                                    Get.dialog(
                                                        addOnWidget(
                                                          my_cart[_index]["add_ons"],
                                                          my_cart[_index]
                                                              ["user_add_ons"],_index
                                                        ),
                                                        barrierDismissible:
                                                            false);

                                                   
                                                  },
                                                  child: Text(
                                                    "Add ons",
                                                    style: TextStyle(
                                                        color: Colors.pink,
                                                        fontSize: 15),
                                                  ),
                                                ),

                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      "Qty",
                                                      style: TextStyle(
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    SizedBox(
                                                      width: 20,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: <Widget>[
                                                        GestureDetector(
                                                          onTap: () {
                                                            if (my_cart[my_cart.indexWhere(
                                                                    (element) =>
                                                                        element[
                                                                            "food"] ==
                                                                        foods[i]
                                                                            [
                                                                            "food"])]["qty"] >
                                                                1) {
                                                              setState(() {
                                                                my_cart[my_cart.indexWhere(
                                                                    (element) =>
                                                                        element[
                                                                            "food"] ==
                                                                        foods[i]
                                                                            [
                                                                            "food"])]["qty"]--;
                                                              });
                                                            } else {
                                                              setState(() {
                                                                my_cart.removeAt(my_cart.indexWhere(
                                                                    (element) =>
                                                                        element[
                                                                            "food"] ==
                                                                        foods[i]
                                                                            [
                                                                            "food"]));
                                                              });
                                                            }
                                                          },
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        4),
                                                            child: Container(
                                                              width: 25,
                                                              height: 25,
                                                              decoration:
                                                                  BoxDecoration(
                                                                border: Border.all(
                                                                    color: Colors
                                                                        .pinkAccent),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            4),
                                                              ),
                                                              child: Center(
                                                                child: Text(
                                                                  "-",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .pinkAccent),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .only(
                                                                  right: 10,
                                                                  left: 10),
                                                          child: Text(
                                                            my_cart[my_cart.indexWhere(
                                                                    (element) =>
                                                                        element[
                                                                            "food"] ==
                                                                        foods[i]
                                                                            [
                                                                            "food"])]["qty"]
                                                                .toString(),
                                                            style: TextStyle(
                                                                fontSize: 15,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600),
                                                          ),
                                                        ),
                                                        GestureDetector(
                                                          onTap: () {
                                                            setState(() {
                                                              my_cart[my_cart.indexWhere(
                                                                  (element) =>
                                                                      element[
                                                                          "food"] ==
                                                                      foods[i][
                                                                          "food"])]["qty"]++;
                                                              // qty++;
                                                            });
                                                          },
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        4),
                                                            child: Container(
                                                              width: 25,
                                                              height: 25,
                                                              decoration:
                                                                  BoxDecoration(
                                                                border: Border.all(
                                                                    color: Colors
                                                                        .green),
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            4),
                                                              ),
                                                              child: Center(
                                                                child: Text(
                                                                  "+",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .green),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          )
                                        : Container(),
                                  ],
                                ),
                              ),
                            ));

                        //  RadioListTile(
                        //   value: i,
                        //   groupValue: selectedRadioTile,
                        //   title: Text(
                        //     "Food $i",
                        //     maxLines: 1,
                        //     overflow: TextOverflow.ellipsis,
                        //     style: TextStyle(
                        //         fontSize: 16,
                        //         fontWeight: i == selectedRadioTile
                        //             ? FontWeight.bold
                        //             : FontWeight.normal,
                        //         color: i == selectedRadioTile
                        //             ? Colors.amber[600]
                        //             : Colors.black),
                        //   ),
                        //   onChanged: (val) {
                        //     setState(() {
                        //       selectedRadioTile = val;
                        //     });
                        //   },
                        //   activeColor: Colors.amber[600],
                        //   secondary: Text(
                        //     "RM ${i + 1}.00",
                        //     style: TextStyle(
                        //         fontWeight: i == selectedRadioTile
                        //             ? FontWeight.bold
                        //             : FontWeight.normal,
                        //         color: i == selectedRadioTile
                        //             ? Colors.amber[600]
                        //             : Colors.black),
                        //   ),
                        //   selected: false,
                        // ),
                      },
                    ),
        ]),
      ),
      bottomNavigationBar: my_cart.length == 0 ? null : FadeInUp(
        duration: Duration(milliseconds : 500),
        child: Container(
          color: Colors.red[50],
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Text(
                      "Total : ",
                      style: TextStyle(color: Colors.brown[700], fontSize: 16),
                    ),
                    Text(
                      // "fgfg",
                      my_cart.length > 0
                          ? my_cart
                              .map((e) => e["qty"] * e["price"])
                              .reduce((sum, element) => sum + element)
                              .toStringAsFixed(2)
                          : "0.0",
                      style: TextStyle(
                          color: Colors.brown[700],
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40,
                  width: 120,
                  child: RaisedButton(
                    color: Colors.amber[700],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    onPressed: () {
                      // Get.to(OrderConfirm());
                      // _sendToServer();

                      var _order_data ={
                        "total" : my_cart.length > 0
                          ? my_cart
                              .map((e) => e["qty"] * e["price"])
                              .reduce((sum, element) => sum + element)
                              .toStringAsFixed(2)
                          : "0.0",
                          "shop_id" : stall_data["shop_id"],
                          "user_id" : box.read("my_id"),
                        "foods" :my_cart,
                        "review":0,
                        "status" : 0,
                        "user_cancel_reason":"",
                        "owner_cancel_reason":"",
                        "name":box.read("user")["first_name"],
                        "user_id_no":box.read("user")["id_no"],
                        "date" : new DateFormat("dd/MM/yyyy HH:mm").format(new DateTime.now()).toString(),
                        "order_id" : box.read("user")["first_name"][0] + new DateFormat("ddHHss").format(new DateTime.now()).toString()

                      };
                      print(_order_data);

                      Database.addOrder(_order_data);
       Database.getOwnerToken( stall_data["shop_id"],"New Order", "Your got new order");

                    },
                    child: Text(
                      "Add Order",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget addOnWidget(String addon, String myaddon, int index) {
    print(addon);
    print(addon);
    print(index);
    List _addons = addon.split(",") ?? [];
    String _myaddon = myaddon;

    return StatefulBuilder(// StatefulBuilder
        builder: (context, setState) {
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
                  Container(
                    height: 200,
                    child: new ListView.builder(
                        itemCount: _addons.length,
                        itemBuilder: (BuildContext context, int index) {
                          return new CheckboxListTile(
                              activeColor: Colors.pink[300],
                              dense: true,
                              //font change
                              title: new Text(
                                _addons[index],
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 0.5),
                              ),
                              value: _myaddon.contains(_addons[index]),
                              // secondary: Container(
                              //   height: 50,
                              //   width: 50,

                              // ),
                              onChanged: (bool val) {
                                print(val);
                                print(index);
                                if (val) {
                                  setState(() {
                                    _myaddon += "${_addons[index]},";
                                  });
                                } else {
                                   setState(() {
                                    _myaddon= _myaddon.replaceAll("${_addons[index]},","");
                                  });
                                }

                                print(_myaddon);
                              });
                        }),
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
                            "Close",
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
                            // _inputValidate();
                            print(_myaddon);
                            my_cart[index]["user_add_ons"] = _myaddon;
                            Get.back();
                          },
                          child: Text(
                            "Submit",
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
    });
  }
}
