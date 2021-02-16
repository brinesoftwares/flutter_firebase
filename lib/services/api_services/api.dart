import 'package:dio/dio.dart';

class ApiServices {
  Response response;
  Dio dio = new Dio();
  final url = "http://testapi.inst.link/";

  Future<Map> get(String _endPoint) async {
    try {
      response = await dio.post(url + _endPoint);
      return response.data;
    } catch (e) {
      return {"status":false,"message":"Server/URL error","data":[]};
    }
  }



  Future<Map> post(String _endPoint, Map _data) async {
    try {
      response = await dio.post(url + _endPoint, data: _data);
      return response.data;
    } catch (e) {
      print(e);
      return {"status":false,"message":"Server/URL error","data":[]};
    }
  }

  Future<Map> sendNotification(String title, String sub_title, String to) async {
     dio.options.headers["Authorization"] = "key=AAAAWqYlNnI:APA91bEVLvprA0dA2z0GuUn6Yoe_hbmZiuVjsRgJ6XAFgg2MQXDf1kSmUWkXG5RjxVh7z1UOYqe6hlxQAPfAj4IWC8nuImeh7VcTTbZAdIkdMSMsZP_nVgKas2zO_oUfvaVcs1t9W1uI";
    try {
      response = await dio.post("https://fcm.googleapis.com/fcm/send", data:
      {
  "notification": {
      "title": title,
      "body": sub_title,
      "mutable_content": true,
      "sound": "Tri-tone"
      },
  "to": to
});
      return response.data;
    } catch (e) {
      print(e);
      return {"status":false,"message":"Server/URL error","data":[]};
    }
  }


}
