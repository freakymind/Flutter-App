import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PostRequest {
  final String name;
  final String email;
  final String mobile;
  final String country;
  final String address;
  final String referenceBy;
  PostRequest(
      {this.name,
      this.email,
      this.mobile,
      this.country,
      this.address,
      this.referenceBy});
  factory PostRequest.createResponse(Map<String, dynamic> json) {
    return PostRequest(
      name: json["data"]['name'],
    );
  }
  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map["name"] = name;
    map["email"] = email;
    map["mobile"] = mobile;
    map["country"] = country;
    map["address"] = address;
    map["reference_by"] = referenceBy;
    return map;
  }

  static Future<dynamic> createRequest({Map body}) async {
    final String url =
        'http://192.168.2.189:3000/service/distributor/addDistributor';
    // Map<String, String> dataBody = {"name": name, "salary": salary, "age": age};
    var jsonData = json.encode(body);
    print(body);
    var apiResult = await http.post(url,
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonData);
    var jsonObject = json.decode(apiResult.body);
    // print(jsonObject);
    if (jsonObject["status"] == 0) {
      //return PostRequest.createResponse(jsonObject);
      return jsonObject;
    } else if (jsonObject["status"] == 1) {
      return jsonObject;
    } else {
      throw Exception('Failed to load post');
    }
    //return PostRequest.createResponse(jsonObject);
  }
}
