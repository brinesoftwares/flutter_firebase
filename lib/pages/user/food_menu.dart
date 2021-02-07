import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_starter/pages/user/user_order_success.dart';
import 'package:get/get.dart';

class FoodMenu extends StatefulWidget {
  @override
  _FoodMenuState createState() => _FoodMenuState();
}

class _FoodMenuState extends State<FoodMenu> {
  List foods = [
    {
      "food": "Burger",
      "price": 5.6,
      "describtion": "This is the veg burger",
      "imag":
          "https://media.cntraveler.com/photos/58f8eefed3e4d55528e77660/16:9/w_2560%2Cc_limit/GettyImages-588348686.jpg"
    },
    {
      "food": "Pizza",
      "price": 2.8,
      "describtion": "This is the veg Pizza",
      "imag": "https://i.ytimg.com/vi/EK-zTchrRvA/hqdefault.jpg"
    },
    {
      "food": "Pepsi",
      "price": 1.8,
      "describtion": "This is the pepsi",
      "imag":
          "https://thumbs.dreamstime.com/z/food-stall-street-yellow-red-seat-putting-enjoying-open-air-meal-31363276.jpg"
    },
  ];
  bool _loading = false;
  int selectedRadioTile = 0;

  int qty = 1;

  var product_url =
      "https://s3.eu-west-2.amazonaws.com/www.grocy.shop/products/images/3f6ec1e6-f062-42f8-ac38-67d2dc87e031.jpg";
  List my_cart = [];

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
              "Stall 2",
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
                  image: NetworkImage(
                      "https://i.ytimg.com/vi/EK-zTchrRvA/hqdefault.jpg"),
                  fit: BoxFit.fill),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ListView.builder(
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
                                    element["food"] == foods[i]["food"])
                                .isNotEmpty)
                            ? Colors.amber[100]
                            : Colors.transparent,
                        borderRadius:
                            new BorderRadius.all(new Radius.circular(10)),
                      ),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: FadeInImage(
                                      fit: BoxFit.cover,
                                      width: 80,
                                      height: 80,
                                      fadeOutDuration:
                                          Duration(milliseconds: 2),
                                      image: product_url != null
                                          ? NetworkImage(foods[i]["imag"])
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
                                          element["food"] == foods[i]["food"])
                                      .isEmpty) {
                                    setState(() {
                                      my_cart.add(foods[i]);
                                      my_cart[my_cart.indexWhere((element) =>
                                          element["food"] ==
                                          foods[i]["food"])]["qty"] = 1;
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
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: Get.width / 2,
                                            margin: EdgeInsets.only(
                                                top: 7, bottom: 7),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  child: Text(
                                                    foods[i]["food"],
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                        fontSize: 13,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  foods[i]["describtion"],
                                                  maxLines: 4,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: Colors.grey[700]),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 9),
                                            child: Text(
                                              "RM ${foods[i]["price"]}",
                                              style: TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.brown[700]),
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
                                      element["food"] == foods[i]["food"])
                                  .isNotEmpty)
                              ? Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      DropdownButtonHideUnderline(
                                        child: new DropdownButton<String>(
                                          hint: Text(
                                            "Add-Ons",
                                            style: TextStyle(fontSize: 15),
                                          ),
                                          value: my_cart[my_cart.indexWhere(
                                              (element) =>
                                                  element["food"] ==
                                                  foods[i]["food"])]["add_on"],
                                          items: <String>[
                                            'add_on1',
                                            'add_on2',
                                            'add_on3',
                                            'add_on4'
                                          ].map((String value) {
                                            return new DropdownMenuItem<String>(
                                              value: value,
                                              child: new Text(value),
                                            );
                                          }).toList(),
                                          onChanged: (data) {
                                            print(data);
                                            setState(() {
                                              my_cart[my_cart.indexWhere(
                                                      (element) =>
                                                          element["food"] ==
                                                          foods[i]["food"])]
                                                  ["add_on"] = data;
                                            });
                                          },
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
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            width: 20,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              GestureDetector(
                                                onTap: () {
                                                  if (my_cart[my_cart.indexWhere(
                                                              (element) =>
                                                                  element[
                                                                      "food"] ==
                                                                  foods[
                                                                          i]
                                                                      ["food"])]
                                                          ["qty"] >
                                                      1) {
                                                    setState(() {
                                                      my_cart[my_cart.indexWhere(
                                                              (element) =>
                                                                  element[
                                                                      "food"] ==
                                                                  foods[
                                                                          i]
                                                                      ["food"])]
                                                          ["qty"]--;
                                                    });
                                                  } else {
                                                    setState(() {
                                                      my_cart.removeAt(
                                                          my_cart.indexWhere(
                                                              (element) =>
                                                                  element[
                                                                      "food"] ==
                                                                  foods[i][
                                                                      "food"]));
                                                    });
                                                  }
                                                },
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                  child: Container(
                                                    width: 25,
                                                    height: 25,
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors
                                                              .pinkAccent),
                                                      borderRadius:
                                                          BorderRadius.circular(
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
                                                padding: const EdgeInsets.only(
                                                    right: 10, left: 10),
                                                child: Text(
                                                  my_cart[my_cart.indexWhere(
                                                              (element) =>
                                                                  element[
                                                                      "food"] ==
                                                                  foods[
                                                                          i]
                                                                      ["food"])]
                                                          ["qty"]
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    my_cart[my_cart.indexWhere(
                                                            (element) =>
                                                                element[
                                                                    "food"] ==
                                                                foods[
                                                                    i]["food"])]
                                                        ["qty"]++;
                                                    // qty++;
                                                  });
                                                },
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(4),
                                                  child: Container(
                                                    width: 25,
                                                    height: 25,
                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Colors.green),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4),
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        "+",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.green),
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
      bottomNavigationBar: FadeInUp(
        duration: Duration(seconds: 1),
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
                      Get.to(OrderConfirm());
                      // _sendToServer();
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
}