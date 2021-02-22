import 'dart:io';

import 'package:animate_do/animate_do.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_starter/model/food_model.dart';
import 'package:flutter_starter/pages/home.dart';
import 'package:flutter_starter/pages/stall_owner/add_food.dart';
import 'package:flutter_starter/pages/stall_owner/edit_food.dart';
import 'package:flutter_starter/services/api_services/fireDB.dart';
import 'package:flutter_starter/styles/widgets_style.dart';
import 'package:flutter_starter/utils/form_validator.dart';
import 'package:flutter_starter/widgets/loading_widget.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';

class OwnerFoodMenu extends StatefulWidget {
  @override
  _OwnerFoodMenuState createState() => _OwnerFoodMenuState();
}

class _OwnerFoodMenuState extends State<OwnerFoodMenu> {
  GlobalKey<FormState> _key = new GlobalKey();
  bool _validate = false;
  bool image_selected = false;
  bool image_updated = false;
  String food_name = "";
  String food_price = "";
  String shop_image;
  bool loading = true;

  // List<FoodModel> foods = [
  //   FoodModel(food: "Burger", price: "43.2"),
  //   FoodModel(food: "Sandwich", price: "4.5"),
  // ];
  List foods = [];

  File _image;
  final picker = ImagePicker();

  Future gotoAdd() async {
    Map details = await Get.to(AddFood());
    if (details != null)
      setState(() {
        foods.add(details);
      });
  }

  Future gotoEdit(index, _arg) async {
    Map details = await Get.to(EditFood(), arguments: _arg);
    if (details != null)
      setState(() {
        foods[index] = details;
      });
  }

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        image_selected = true;
        image_updated = true;
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
    Database.uploadShopImage(File(pickedFile.path));
  }

  getShopImage() async {
    var image = await Database.shopImage();
    print(image);
    setState(() {
      shop_image = image["shop_image"];
    });
  }

  @override
  void initState() {
    getShopImage();
    fetchfoods();
    super.initState();
  }

  void fetchfoods() async {
    // Get.dialog(LoadingWidget(), barrierDismissible: false);
    await Database.fetchOwnerFood().then((value) {
      print(value);
      setState(() {
        loading = false;
        foods = value;
      });
    });
  }

  // void addfoods() async {
  //   try {
  //     Response response = await Dio().post(ENV.awsBaseUrl + "user/create",
  //         data: {
  //           "event": {
  //             "data": {
  //               "new": {
  //                 "id": box.read("shop_id"),
  //                 "contact": {
  //                   "name": name,
  //                   "number": mobileNumber,
  //                   "role": "staff"
  //                 },
  //                 "shopName": box.read("shop_name")
  //               }
  //             }
  //           }
  //         },
  //         options: Options(headers: {"x-api-key": ENV.awsApiKey}));
  //     if (Get.isDialogOpen) {
  //       Get.back();
  //     }

  //     if (response.data["UserConfirmed"] != null ||
  //         response.data["UserConfirmed"] != false) {
  //       setState(() {
  //         foods.add(foodsModel(
  //             name: name, phone: mobileNumber, id: response.data["UserSub"]));
  //       });

  //       Get.snackbar(
  //           "Info",
  //           (response.data["UserConfirmed"] != null ||
  //                   response.data["UserConfirmed"] != false)
  //               ? "Staff Added Successfully"
  //               : "Unable to Add. Try Again...",
  //           colorText: Colors.white,
  //           animationDuration: Duration(milliseconds: 600),
  //           duration: Duration(milliseconds: 2000),
  //           barBlur: 100,
  //           snackPosition: SnackPosition.BOTTOM,
  //           backgroundColor: (response.data["UserConfirmed"] != null ||
  //                   response.data["UserConfirmed"] != false)
  //               ? Colors.green
  //               : Colors.red,
  //           dismissDirection: SnackDismissDirection.HORIZONTAL,
  //           borderRadius: 8,
  //           margin: EdgeInsets.all(15));
  //     }
  //   } catch (e) {
  //     if (Get.isDialogOpen) {
  //       Get.back();
  //     }
  //     Get.snackbar("Info", "Unable to Add. Try Again...",
  //         colorText: Colors.white,
  //         animationDuration: Duration(milliseconds: 600),
  //         duration: Duration(milliseconds: 1500),
  //         barBlur: 100,
  //         snackPosition: SnackPosition.BOTTOM,
  //         backgroundColor: Colors.red,
  //         dismissDirection: SnackDismissDirection.HORIZONTAL,
  //         borderRadius: 8,
  //         margin: EdgeInsets.all(15));
  //   }
  // }

  // void deteteStaff(id, index) async {
  //   await ApiService().deleteStaff(id).then((value) {
  //     Get.back();
  //     setState(() {
  //       foods.removeAt(index);
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("My Product"),
        centerTitle: true,
        backgroundColor: Color(0xff701504),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                height: 220,
                width: Get.width,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: new BorderRadius.all(new Radius.circular(5)),
                  border: new Border.all(
                    color: Colors.grey[700],
                    width: 1.0,
                  ),
                  image: DecorationImage(
                      image: image_selected
                          ? FileImage(_image)
                          : shop_image != null
                              ? NetworkImage(shop_image)
                              : new AssetImage(
                                  'assets/images/app_icon/icon.jpg'),
                      fit: BoxFit.fill),
                ),
              ),
            ),
            image_updated
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      SizedBox(
                        width: Get.width / 3,
                        height: 40,
                        child: RaisedButton(
                          onPressed: () {
                            setState(() {
                              image_selected = false;
                            });
                          },
                          child: Text(
                            "Cancel",
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w700),
                          ),
                          color: Colors.pink,
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
                            setState(() {
                              image_updated = false;
                            });
                          },
                          child: Text(
                            "Update",
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
                  )
                : Align(
                    alignment: Alignment.centerRight,
                    child: SizedBox(
                      height: 40,
                      width: 160,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: RaisedButton(
                          color: Colors.blue,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          onPressed: () {
                            // _sendToServer();
                            getImage();
                          },
                          child: Text(
                            "Change Image",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
            SizedBox(
              height: 20,
            ),
            foods.length == 0
                ? Center(
                    child: loading
                        ? SizedBox(
                            height: 30,
                            child: SpinKitThreeBounce(
                              color: Colors.green,
                              size: 25.0,
                            ),
                          )
                        : Container(
                            height: 100,
                            child: Text(
                              "No foods available",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w700),
                            ),
                          ),
                  )
                : Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: ListView.builder(
                      itemCount: foods.length,
                      padding: const EdgeInsets.only(
                          bottom: kFloatingActionButtonMargin + 48),
                      physics: ScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, i) {
                        return ZoomIn(
                            delay: Duration(milliseconds: 150 * i),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  // color: Colors.red,
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
                                                image: foods[i]["imag"] != null
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
                                            //   if (my_cart
                                            //       .where((element) =>
                                            //           element["food"] == foods[i]["food"])
                                            //       .isEmpty) {
                                            //     setState(() {
                                            //       my_cart.add(foods[i]);
                                            //       my_cart[my_cart.indexWhere((element) =>
                                            //           element["food"] ==
                                            //           foods[i]["food"])]["qty"] = 1;
                                            //     });
                                            //   } else {
                                            //     setState(() {
                                            //       // my_cart.removeAt(my_cart.indexWhere(
                                            //       //     (element) =>
                                            //       //         element["food"] ==
                                            //       //         foods[i]["food"]));
                                            //     });
                                            //   }
                                            //   print(my_cart);
                                          },
                                          child: Container(
                                              margin: EdgeInsets.only(
                                                left: 5,
                                              ),
                                              child: Container(
                                                // color: Colors.yellow,
                                                // width: Get.width / 1.55,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      width: Get.width / 2.2,
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
                                                                    .black),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                        .only(
                                                                    top: 9),
                                                            child: Text(
                                                              "RM ${foods[i]["price"].toStringAsFixed(2)}",
                                                              style: TextStyle(
                                                                  fontSize: 13,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                  color: Colors
                                                                          .amber[
                                                                      700]),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 5,
                                                          ),
                                                          Text(
                                                            foods[i]["add_ons"],
                                                            maxLines: 4,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            style: TextStyle(
                                                                fontSize: 12,
                                                                color: Colors
                                                                    .grey[600]),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Row(
                                                      children: [
                                                        IconButton(
                                                            icon: Icon(
                                                              Icons.delete,
                                                              color: Colors.red,
                                                            ),
                                                            onPressed: () {
                                                              // print(foods[i].id);
                                                              Get.dialog(
                                                                  alertWidget(
                                                                      foods[i][
                                                                          "food"],
                                                                      "id",
                                                                      i));
                                                            }),
                                                        IconButton(
                                                            icon: Icon(
                                                              Icons.edit,
                                                              color:
                                                                  Colors.blue,
                                                            ),
                                                            onPressed: () {
                                                              gotoEdit(
                                                                  i, foods[i]);
                                                              // Get.dialog(
                                                              //     addFoodWidget(
                                                              //         foods[i][
                                                              //             "food"],
                                                              //         foods[i][
                                                              //             "price"],
                                                              //         false,
                                                              //         i),
                                                              //     barrierDismissible:
                                                              //         false);
                                                            }),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              )),
                                        ),
                                      ],
                                    ),
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
                  ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Get.dialog(addFoodWidget("", "", true, 0), barrierDismissible: false);
          gotoAdd();
        },
        backgroundColor: Color(0xff701504),
        icon: Icon(Icons.food_bank),
        label: Text("Add Food"),
      ),
    );
  }

  Widget FormUI(String name, String price) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: new TextFormField(
              initialValue: name,
              decoration: new InputDecoration(
                  prefixIcon: Icon(
                    Icons.fastfood,
                    color: Color(0xFFC4290E),
                  ),
                  hintText: 'Food Name',
                  contentPadding: new EdgeInsets.all(12),
                  border: customBorder,
                  focusedBorder: customFocusedBorder,
                  enabledBorder: customEnabledBorder),
              keyboardType: TextInputType.text,
              validator: validateName,
              onSaved: (String val) {
                food_name = val;
              }),
        ),
        // SizedBox(
        //   height: 15,
        // ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: new TextFormField(
              initialValue: price,
              decoration: new InputDecoration(
                  prefixIcon: Icon(
                    Icons.money,
                    color: Color(0xFFC4290E),
                  ),
                  hintText: 'Price',
                  contentPadding: new EdgeInsets.all(12),
                  border: customBorder,
                  focusedBorder: customFocusedBorder,
                  enabledBorder: customEnabledBorder),
              keyboardType: TextInputType.number,
              validator: (value) => validateRequired(value, "Price"),
              onSaved: (String val) {
                food_price = val;
              }),
        ),
        SizedBox(
          height: 15,
        ),
      ],
    );
  }

  _inputValidate(isAdd, index) {
    if (_key.currentState.validate()) {
      _key.currentState.save();
      if (isAdd) {
        setState(() {
          foods.add(FoodModel(food: food_name, price: food_price));
        });
      } else {
        setState(() {
          foods[index].food = food_name;
          foods[index].price = food_price;
        });
      }

      Get.back();
      // Get.dialog(LoadingWidget(), barrierDismissible: false);
      // addfoods();
    } else {
      setState(() {
        _validate = true;
      });
    }
  }

  Widget addFoodWidget(String name, String price, bool isAdd, int index) {
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
                  child: FormUI(name, price),
                ),
                SizedBox(
                  height: 8,
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
                          "Cancel",
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
                          _inputValidate(isAdd, index);
                        },
                        child: Text(
                          isAdd ? "Add" : "Update",
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

  Widget alertWidget(String name, String id, int index) {
    return FadeInDown(
      duration: Duration(milliseconds: 300),
      child: Dialog(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(
                  height: 15,
                ),
                Text(
                  "Want to remove $name?",
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    SizedBox(
                      width: Get.width / 4,
                      height: 40,
                      child: RaisedButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: Text(
                          "Cancel",
                          style: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.w700),
                        ),
                        color: Colors.pink,
                        textColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(8.0),
                        ),
                        padding: EdgeInsets.all(14),
                      ),
                    ),
                    SizedBox(
                      width: Get.width / 4,
                      height: 40,
                      child: RaisedButton(
                        onPressed: () {
                          Get.back();
                          Get.dialog(LoadingWidget(),
                              barrierDismissible: false);
                          Database.deleteOwnerFood(foods[index]["product_id"])
                              .then((value) {
                            if (value) {
                              setState(() {
                                foods.removeAt(index);
                              });
                            }
                          });
                          // Get.dialog(LoadingWidget(), barrierDismissible: false);
                          // deteteStaff(id, index);
                        },
                        child: Text(
                          "Yes",
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
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
