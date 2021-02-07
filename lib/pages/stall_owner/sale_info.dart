import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_starter/pages/user/user_order_success.dart';
import 'package:get/get.dart';

class SaleInfo extends StatefulWidget {
  @override
  _SaleInfoState createState() => _SaleInfoState();
}

class _SaleInfoState extends State<SaleInfo> {
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
        title: Text("Sale Info"),
        centerTitle: true,
        backgroundColor: Colors.amber[700],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
                  child: Column(children: [
            SizedBox(
              height: 40,
            ),
            ZoomIn(
                          child: Container(
                width: 280,
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  border: new Border.all(
                    color: Colors.grey[700],
                    width: 0.8,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Today's Total Sale ",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 22, color: Colors.black),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "RM 234.54",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.amber[900]),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ListView.builder(
              itemCount: foods.length,
              physics: ScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, i) {
                return SlideInDown(
                    delay: Duration(milliseconds: 150 * i),
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              foods[i]["food"],
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 20, color: Colors.black),
                            ),
                            Text(
                              "RM " + (foods[i]["price"] * 4).toString(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.brown[600]),
                            ),
                          ],
                        )));
              },
            ),
          ]),
        ),
      ),
    );
  }
}
