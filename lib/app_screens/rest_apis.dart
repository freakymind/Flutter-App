import 'dart:convert';
import 'package:flutter_app/models/user_register_model.dart';
import 'package:http/http.dart' as http;

class RestApis {
  static final CREATE_USER_URL =
      'http://192.168.3.162:9092/service/registercompany';

  Future<UserRegister> createUser(UserRegister userReg) async {
    final headers = {'Content-Type': 'application/json'};
    Map<dynamic, dynamic> mapData = toMap(userReg);
    String newjson = json.encode(mapData);
    var response = await http.post(Uri.encodeFull(CREATE_USER_URL),
        headers: headers, body: newjson);
    Map<String, dynamic> mapResponse = json.decode(response.body);
    print('Response mapping data1 : ' + mapResponse.toString());
    print('Response response data2 : ' + mapResponse['status']);

    if (response.statusCode == 200 && mapResponse['status'] == "0") {
      print('inside if condition : ' + mapResponse['status']);
      return UserRegister.formJson(mapResponse);
    } else {
      throw Exception('Registration is Failed');
    }
  }

  Map toMap(UserRegister userReg) {
    Map map = new Map<dynamic, dynamic>();
    map['company_name'] = userReg.company_name;
    map['company_email'] = userReg.company_email;
    map['company_address'] = userReg.company_address;
    map['company_mobile'] = userReg.company_mobile;
    map['user_name'] = userReg.user_name;
    map['user_email'] = userReg.user_email;
    map['user_address'] = userReg.user_email;
    map['user_mobile'] = userReg.user_mobile;
    map['user_password'] = userReg.user_password;
    map['user_country'] = userReg.user_country;

    return map;
  }
}
