import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_starter/pages/user/user_order_success.dart';
import 'package:flutter_starter/services/api_services/fireDB.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class SaleInfo extends StatefulWidget {
  @override
  _SaleInfoState createState() => _SaleInfoState();
}

class _SaleInfoState extends State<SaleInfo> {
  bool _loading = true;
  double today_income = 0;
  double month_income = 0;
  double overall_income = 0;
  @override
  void initState() {
    super.initState();
    fetchSales();
  }

  void fetchSales() async {
    await Database.fetchSales().then((value) {
     

      var temp_today = value.where((e) =>
        e["date"].toString().contains(new DateFormat("dd/MM/yyyy").format(new DateTime.now()).toString()) )
        ?.map((e) => double.parse(e["total"] ))
        ?.toList();

        // print(temp_today);

      var temp_month = value.where((e) =>
        e["date"].toString().contains(new DateFormat("MM/yyyy").format(new DateTime.now()).toString()))
        .map((e) => double.parse(e["total"]))
        .toList();

      var temp_all = value.where((e) =>
        e["date"].toString().contains(new DateFormat("yyyy").format(new DateTime.now()).toString()))
        .map((e) => double.parse(e["total"]))
        .toList();

        setState(() {
          _loading = false;
          today_income = temp_today.length == 0 ? 0 : temp_today.reduce((double sum, element) => sum + element);
          month_income = temp_month.length == 0 ? 0 : temp_month.reduce((double sum, element) => sum + element);
          overall_income = temp_all.length == 0 ? 0 : temp_all.reduce((double sum, element) => sum + element);
        });

     
    });
  }

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
          child: _loading
              ? Center(
                  child: SizedBox(
                    height: 30,
                    child: SpinKitThreeBounce(
                      color: Colors.green,
                      size: 25.0,
                    ),
                  ),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                      SizedBox(
                        height: 80,
                      ),
                      ZoomIn(
                        child: Center(
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
                                  style: TextStyle(
                                      fontSize: 22, color: Colors.black),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  "RM ${today_income.toStringAsFixed(2)}",
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
                      ),
                      SizedBox(
                        height: 50,
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
                                "This Month's Sale ",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 22, color: Colors.black),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "RM ${month_income.toStringAsFixed(2)}",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.pink[900]),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
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
                                "Overall Sale ",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 22, color: Colors.black),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                "RM ${overall_income.toStringAsFixed(2)}",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red[900]),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),

                      // ListView.builder(
                      //   itemCount: foods.length,
                      //   physics: ScrollPhysics(),
                      //   shrinkWrap: true,
                      //   itemBuilder: (context, i) {
                      //     return SlideInDown(
                      //         delay: Duration(milliseconds: 150 * i),
                      //         child: Padding(
                      //             padding: const EdgeInsets.all(8.0),
                      //             child: Row(
                      //               mainAxisAlignment: MainAxisAlignment.spaceAround,
                      //               crossAxisAlignment: CrossAxisAlignment.start,
                      //               children: [
                      //                 Text(
                      //                   foods[i]["food"],
                      //                   textAlign: TextAlign.center,
                      //                   style: TextStyle(fontSize: 20, color: Colors.black),
                      //                 ),
                      //                 Text(
                      //                   "RM " + (foods[i]["price"] * 4).toString(),
                      //                   textAlign: TextAlign.center,
                      //                   style: TextStyle(
                      //                       fontSize: 20,
                      //                       fontWeight: FontWeight.bold,
                      //                       color: Colors.brown[600]),
                      //                 ),
                      //               ],
                      //             )));
                      //   },
                      // ),
                    ]),
        ),
      ),
    );
  }
}
