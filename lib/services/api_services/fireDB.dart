import 'dart:async';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_starter/pages/stall_owner/owner_dashboard.dart';
import 'package:flutter_starter/pages/user/user_dashboard.dart';
import 'package:flutter_starter/widgets/loading_widget.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:firebase_storage/firebase_storage.dart';

class Database {
  static final Firestore _db = Firestore.instance;
  static final box = GetStorage();

  static server_error() {
    Get.snackbar("Server Error", "Try Again",
        colorText: Colors.white,
        barBlur: 100,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        dismissDirection: SnackDismissDirection.HORIZONTAL,
        borderRadius: 8,
        margin: EdgeInsets.all(15),
        isDismissible: true);
  }

  static failure_msg(title, sub_title) {
    Get.snackbar(title, sub_title,
        colorText: Colors.white,
        barBlur: 100,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        dismissDirection: SnackDismissDirection.HORIZONTAL,
        borderRadius: 8,
        margin: EdgeInsets.all(15),
        isDismissible: true);
  }

  static success_mgs(title, sub_title) {
    Get.snackbar(title, sub_title,
        colorText: Colors.white,
        barBlur: 100,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        dismissDirection: SnackDismissDirection.HORIZONTAL,
        borderRadius: 8,
        margin: EdgeInsets.all(15),
        isDismissible: true);
  }

  static Future<void> userCheckMail(Map<String, dynamic> user) async {
    Get.dialog(LoadingWidget(), barrierDismissible: false);
    var data = await _db
        .collection('users')
        .where("email", isEqualTo: user["email"])
        .getDocuments();
    print(data.documents.length);
    if (data.documents.length == 0) {
      userRegister(user);
    } else {
      if (Get.isDialogOpen) {
        Get.back();
      }
      failure_msg("Email already Exist", "Try with another Email");
    }
  }

  static Future<Map> userRegister(Map<String, dynamic> data) async {
    // data["id"] = _db.collection('users').document().documentID;
    await _db.collection('users').document().setData(data).then((value) {
      if (Get.isDialogOpen) {
        Get.back();
      }
      Get.back();
      success_mgs("Registration Successful", "Now you can Login");
    }).catchError(() {
      server_error();
      if (Get.isDialogOpen) {
        Get.back();
      }
    });
  }

  static Future<void> userLogin(String email, String password) async {
    Get.dialog(LoadingWidget(), barrierDismissible: false);
    var data = await _db
        .collection('users')
        .where("password", isEqualTo: password)
        .where("email", isEqualTo: email)
        .getDocuments();
    if (Get.isDialogOpen) {
      Get.back();
    }
    if (data.documents.length == 1) {
      box.write('user', data.documents[0].data);
      box.write('my_id', data.documents[0].documentID);
      Get.to(UserDashboard());
    } else {
      failure_msg("Invalide Email/Password", "Try again");
    }
  }

  static Future<void> ownerCheckMail(Map<String, dynamic> owner) async {
    Get.dialog(LoadingWidget(), barrierDismissible: false);
    var data = await _db
        .collection('owners')
        .where("email", isEqualTo: owner["email"])
        .getDocuments();
    print(data.documents.length);
    if (data.documents.length == 0) {
      ownerRegister(owner);
    } else {
      if (Get.isDialogOpen) {
        Get.back();
      }
      failure_msg("Email already Exist", "Try with another Email");
    }
  }

  static Future<Map> ownerRegister(Map<String, dynamic> data) async {
    // data["id"] = _db.collection('owners').document().documentID;
    await _db.collection('owners').add(data).then((value) {
      print(value.toString());
      if (Get.isDialogOpen) {
        Get.back();
      }
      Get.back();
      success_mgs("Registration Successful", "Now you can Login as Owner");
    }).catchError(() {
      server_error();
      if (Get.isDialogOpen) {
        Get.back();
      }
    });
  }

  static Future<void> ownerLogin(String email, String password) async {
    Get.dialog(LoadingWidget(), barrierDismissible: false);
    var data = await _db
        .collection('owners')
        .where("password", isEqualTo: password)
        .where("email", isEqualTo: email)
        .getDocuments();
    if (Get.isDialogOpen) {
      Get.back();
    }
    if (data.documents.length == 1) {
      box.write('user', data.documents[0].data);
      box.write('my_id', data.documents[0].documentID);

      Get.to(OwnerDashboard());
    } else {
      failure_msg("Invalide Email/Password", "Try again");
    }
  }

  static Future shopImage() async {
    var data = await _db
        .collection('owners')
        .where("email", isEqualTo: box.read("user")["email"])
        .getDocuments();
    if (Get.isDialogOpen) {
      Get.back();
    }
    if (data.documents.length == 1) {
      return data.documents[0].data;
    } else {
      return null;
    }
  }

  static Future<void> uploadShopImage(File file) async {
    StorageReference storageReference;
    storageReference = FirebaseStorage.instance
        .ref()
        .child("shop_img/${box.read("user")["id_no"]}");
    final StorageUploadTask uploadTask = storageReference.putFile(file);
    final StorageTaskSnapshot downloadUrl = (await uploadTask.onComplete);
    final String url = (await downloadUrl.ref.getDownloadURL());
    print("URL is $url");
    updateshopImage({"shop_image": url});
  }

  static Future updateshopImage(Map<String, dynamic> data) async {
    await _db
        .collection('owners')
        .document(box.read("my_id"))
        .updateData(data)
        .catchError((e) {
      print(e);
    });
  }

  static Future<Map> addFood(Map<String, dynamic> data) async {
    // data["id"] = _db.collection('owners').document().documentID;
    Get.dialog(LoadingWidget(), barrierDismissible: false);
    await _db.collection('foods').add(data).then((value) {
      print(value.toString());
      if (Get.isDialogOpen) {
        Get.back();
      }
      Get.back(result: data);
      success_mgs("Info", "Food added Successful!");
    }).catchError(() {
      server_error();
      if (Get.isDialogOpen) {
        Get.back();
      }
    });
  }

  static Future fetchOwnerFood() async {
    try {
      var data = await _db
          .collection('foods')
          .where("owner_id", isEqualTo: box.read("my_id"))
          .getDocuments();
      if (Get.isDialogOpen) {
        Get.back();
      }

      List filter_data = data.documents.map((e) {
        var temp = e.data;
        temp["product_id"] = e.documentID;
        return temp;
      }).toList();

      return filter_data;
    } catch (e) {
      if (Get.isDialogOpen) {
        Get.back();
      }
      failure_msg("Server Error", "Try Again");

      return [];
    }

    // print(data.documents.length);
    // if (data.documents.length == 0) {
    //   ownerRegister(owner);
    // } else {
    //   if (Get.isDialogOpen) {
    //     Get.back();
    //   }
    //   failure_msg("Email already Exist", "Try with another Email");
    // }
  }

  static Future deleteOwnerFood(id) async {
    try {
      await _db.collection('foods').document(id).delete();
      if (Get.isDialogOpen) {
        Get.back();
      }
      success_mgs("Info", "Food Deleted Successfully!");
      return true;
    } catch (e) {
      if (Get.isDialogOpen) {
        Get.back();
      }
      failure_msg("Server Error", "Try Again");
      return false;
    }
  }

 static Future updateOwnerFood(String id, Map<String, dynamic> data) async {
    Get.dialog(LoadingWidget(), barrierDismissible: false);
   try {
      await _db
        .collection('foods')
        .document(id)
        .updateData(data)
        .catchError((e) {
      print(e);
    });
     if (Get.isDialogOpen) {
        Get.back();
      }
       Get.back(result: data);
      success_mgs("Info", "Food Updated Successfully!");
    return true;
   } catch (e) {
      if (Get.isDialogOpen) {
        Get.back();
      }
      failure_msg("Server Error", "Try Again");
      return false;
   }
   
  }

 static Future fetchStalls() async {
    try {
      var data = await _db
          .collection('owners')
          .getDocuments();
      if (Get.isDialogOpen) {
        Get.back();
      }

      List filter_data = data.documents.map((e) {
        var temp = e.data;
        temp["shop_id"] = e.documentID;
        return temp;
      }).toList();

      return filter_data;
    } catch (e) {
      if (Get.isDialogOpen) {
        Get.back();
      }
      failure_msg("Server Error", "Try Again");

      return [];
    }

  }
 
 static Future fetchFoods(id) async {
    try {
      var data = await _db
          .collection('foods')
          .where("owner_id", isEqualTo: id)
          .getDocuments();
      if (Get.isDialogOpen) {
        Get.back();
      }

      List filter_data = data.documents.map((e) {
        var temp = e.data;
        temp["product_id"] = e.documentID;
        return temp;
      }).toList();

      return filter_data;
    } catch (e) {
      if (Get.isDialogOpen) {
        Get.back();
      }
      failure_msg("Server Error", "Try Again");

      return [];
    }

  }

  // static Future<void> ownerRegister(Map<String, dynamic> task) async {
  //   await _db.collection('owners').document().setData(task).catchError((e) {
  //     print(e);
  //   });
  // }

  static Future<void> updateTask(String id, Map<String, dynamic> task) async {
    await _db.collection('tasks').document(id).updateData(task).catchError((e) {
      print(e);
    });
  }

  static Future<void> deleteTask(String id) async {
    await _db.collection('tasks').document(id).delete().catchError((e) {
      print(e);
    });
  }
}

//  https://s3.eu-west-2.amazonaws.com/www.grocy.shop/products/images/3f6ec1e6-f062-42f8-ac38-67d2dc87e031.jpg
