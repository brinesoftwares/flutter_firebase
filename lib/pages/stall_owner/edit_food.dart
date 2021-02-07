import 'dart:convert';
import 'dart:io';
import 'dart:io' as Io;

import 'package:flutter/material.dart';
import 'package:flutter_starter/styles/widgets_style.dart';
import 'package:flutter_starter/utils/form_validator.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

class EditFood extends StatefulWidget {
  @override
  _EditFoodState createState() => _EditFoodState();
}

class _EditFoodState extends State<EditFood> {
  GlobalKey<FormState> _key = new GlobalKey();
  bool _validate = false;
  String food, price, desc, add_ons, base64;
  File imageFile;
  bool picked = false;
  var food_info ={};

  _getFromGallery(bool camera) async {
    PickedFile pickedFile = await ImagePicker().getImage(
      source: camera ? ImageSource.camera : ImageSource.gallery,
      maxWidth: 1500,
      maxHeight: 1500,
    );
    _cropImage(pickedFile.path);
  }

  /// Crop Image
  _cropImage(filePath) async {
    File croppedImage = await ImageCropper.cropImage(
      sourcePath: filePath,
      compressFormat: ImageCompressFormat.png,
      maxWidth: 1080,
      maxHeight: 1080,
      aspectRatio: CropAspectRatio(ratioX: 1.0, ratioY: 1.0),
    );
    if (croppedImage != null) {
      imageFile = croppedImage;
      final bytes = Io.File(imageFile.path).readAsBytesSync();
      String img64 = base64Encode(bytes);

      print(img64);

      setState(() {
        base64 = img64;
        picked = true;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      food_info = Get.arguments;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Food"),
        centerTitle: true,
        backgroundColor: Color(0xff701504),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Product Image", style: TextStyle(fontSize: 15)),
                  SizedBox(
                    width: 100,
                    height: 40,
                    child: RaisedButton(
                      onPressed: () {
                        Get.bottomSheet(
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                height: 120,
                                decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                child: Center(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      ButtonTheme(
                                        minWidth: Get.width,
                                        child: FlatButton(
                                            onPressed: () {
                                              _getFromGallery(true);
                                              if (Get.isBottomSheetOpen) {
                                                Get.back();
                                              }
                                            },
                                            child: Text(
                                              "Camera",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w700),
                                            )),
                                      ),
                                      ButtonTheme(
                                        minWidth: Get.width,
                                        child: FlatButton(
                                            onPressed: () {
                                              _getFromGallery(false);
                                              if (Get.isBottomSheetOpen) {
                                                Get.back();
                                              }
                                            },
                                            child: Text(
                                              "Gallery",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w700),
                                            )),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            // elevation: 12,
                            barrierColor: Color(0x66bbbbbb),
                            backgroundColor: Colors.transparent);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Icon(
                            Icons.photo_library,
                            color: Colors.white,
                            size: 15,
                          ),
                          // SizedBox(width: 5,),
                          Text(
                            "Change",
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ],
                      ),
                      // Text(
                      //   picked ? "Change" : "Select",
                      //   style: TextStyle(
                      //       fontSize: 12, fontWeight: FontWeight.w700),
                      // ),
                      color: Colors.green,
                      textColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(8.0),
                      ),
                      padding: EdgeInsets.all(14),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: 200,
              child: picked
                  ? Image.file(
                      imageFile,
                      fit: BoxFit.cover,
                    )
                  : Image.network(
                      food_info["imag"],
                      fit: BoxFit.cover,
                    ),
            ),
            picked
                ? SizedBox(
                    height: 20,
                  )
                : Container(),
            new Form(
              key: _key,
              autovalidate: _validate,
              child: FormUI(),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: SizedBox(
                height: 40,
                width: MediaQuery.of(context).size.width / 1.8,
                child: RaisedButton(
                  color: Color(0xff701504),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  onPressed: () {
                    _inputValidate();
                  },
                  child: Text(
                    "Submit",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }

  Widget FormUI() {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: new TextFormField(
                initialValue: food_info["food"],
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
                  food = val;
                }),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: new TextFormField(
                initialValue: food_info["price"].toString(),
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
                  price = val;
                }),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: new TextFormField(
                initialValue: food_info["describtion"],
                maxLines: 3,
                decoration: new InputDecoration(
                    prefixIcon: Icon(
                      Icons.info,
                      color: Color(0xFFC4290E),
                    ),
                    hintText: 'Description',
                    contentPadding: new EdgeInsets.all(12),
                    border: customBorder,
                    focusedBorder: customFocusedBorder,
                    enabledBorder: customEnabledBorder),
                // keyboardType: TextInputType.number,
                validator: (value) => validateRequired(value, "Description"),
                onSaved: (String val) {
                  desc = val;
                }),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: new TextFormField(
                // initialValue: food_info[""],
                decoration: new InputDecoration(
                    prefixIcon: Icon(
                      Icons.add_box,
                      color: Color(0xFFC4290E),
                    ),
                    hintText: 'Add ons',
                    contentPadding: new EdgeInsets.all(12),
                    border: customBorder,
                    focusedBorder: customFocusedBorder,
                    enabledBorder: customEnabledBorder),
                // keyboardType: TextInputType.number,
                validator: (value) => validateRequired(value, "Add ons"),
                onSaved: (String val) {
                  add_ons = val;
                }),
          ),
        ],
      ),
    );
  }

  _inputValidate() {
    // if (picked) {
      if (_key.currentState.validate()) {
        _key.currentState.save();

        Get.back(result:  {
      "food": food,
      "price": double.parse(price),
      "describtion": desc,
      "imag":
          "https://media.cntraveler.com/photos/58f8eefed3e4d55528e77660/16:9/w_2560%2Cc_limit/GettyImages-588348686.jpg"
    });

      } else {
        setState(() {
          _validate = true;
        });
      }
    // } else {
    //   Get.snackbar("Food Image Required", "",
    //       colorText: Colors.white,
    //       barBlur: 100,
    //       snackPosition: SnackPosition.BOTTOM,
    //       backgroundColor: Colors.red,
    //       dismissDirection: SnackDismissDirection.HORIZONTAL,
    //       borderRadius: 8,
    //       margin: EdgeInsets.all(15),
    //       isDismissible: true);
    // }
  }
}
