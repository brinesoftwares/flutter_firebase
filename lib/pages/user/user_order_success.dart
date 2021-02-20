import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter/pages/user/user_dashboard.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';

class OrderConfirm extends StatefulWidget {
  @override
  _OrderConfirmState createState() => _OrderConfirmState();
}

class _OrderConfirmState extends State<OrderConfirm> {
var data =[];


  
  @override
void initState(){
  setState(() {
    data= Get.arguments;
  });
  super.initState();
}

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
    onWillPop: () {
                   Get.offAll(UserDashboard());
      
    },
          child:SafeArea(
            
          child: Scaffold(
            backgroundColor: Colors.white,
              body: Padding(
                padding: const EdgeInsets.all(15.0),
                child: ListView(
                  children: [
                     SizedBox(
                      height: 35,
                    ),
                    // Pulse(
                    //   duration: Duration(milliseconds: 800),

                    //                       child: Icon(
                    //     Icons.check_circle,
                    //     size: 200,
                    //     color: Colors.green,
                    //   ),
                    // ),

                     Image.asset(
                  'assets/images/cooking.gif',
                  height: 250,
                ),

                      SizedBox(
                      height: 10,
                    ),
                    FadeInUp(
                      delay:Duration(milliseconds: 300),
                      duration: Duration(milliseconds: 800),
                                          child: Text(
                        "Your Order Confirmed",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                     FadeInUp(
                      delay:Duration(milliseconds: 600),
                      duration: Duration(milliseconds: 800),
                                          child: Text(
                        "We have received your order and getting it ready to be shipped. We will notify you when it's on the way.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),


                    FadeInUp(
                      delay:Duration(milliseconds: 800),
                      duration: Duration(milliseconds: 500),
                                          child: Card(
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 5,
                            ),
                            orderInfo("Order Id", data[0]),
                            // orderInfo("Payment Method",
                            //     orderDetails["paymentMethod"]),
                            // orderInfo("Shopping Method", ""),
                            orderInfo("Total Price", "RM ${data[1]}"),
                            orderInfo( "Ordered Date",data[2]),
                             

                            SizedBox(
                              height: 5,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerFloat,
              floatingActionButton: ButtonTheme(
                height: 50,
                minWidth: 250,
                child: RaisedButton(
                  color: Colors.amber[800],
                  elevation: 2,
                  // color: Colors.amber,
                  shape: new RoundedRectangleBorder(
                    //  side: BorderSide(color: Colors.black),
                    borderRadius: new BorderRadius.circular(8.0),
                  ),

                  onPressed: () {
                   Get.offAll(UserDashboard());
                    
                  },
                  child: Text(
                    "Continue Order",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              )),
      
      ),
    );
  }

  Widget orderInfo(
    key,
    value,
  ) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            flex: 4,
            child: Text(
              '$key',
              style: new TextStyle(fontSize: 12, color: Colors.grey[600]),
              // textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            flex: 5,
            child: Text(
              '$value',
              style: new TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[800]),
              textAlign: TextAlign.start,
            ),
          ),
        ],
      ),
    );
  }

}


