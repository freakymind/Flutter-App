import 'dart:convert';
import 'package:flutter_app/models/user_register_model.dart';
import 'package:http/http.dart' as http;

class RestApis {
  static final CREATE_USER_URL =
      'http://192.168.3.162:9092/service/registercompany';

  dynamic jsonReqResdata;

  Future<dynamic> createUser(UserRegister userReg) async {
    try {
      final headers = {'Content-Type': 'application/json'};
      Map<dynamic, dynamic> mapData = toMap(userReg);
      String newjson = json.encode(mapData);
      var response = await http.post(Uri.encodeFull(CREATE_USER_URL),
          headers: headers, body: newjson);
      Map<String, dynamic> mapResponse = json.decode(response.body);
      jsonReqResdata = mapResponse;
      if (response.statusCode == 200 && mapResponse['status'] == "0") {
        return jsonReqResdata;
      } else if (mapResponse['status'] == "1") {
        return jsonReqResdata;
      }
    } catch (e) {
      throw e.toString();
    }
  }

  Map toMap(UserRegister userReg) {
    Map map = new Map<dynamic, dynamic>();
    map['company_name'] = userReg.companyname;
    map['company_email'] = userReg.companyemail;
    map['company_address'] = userReg.companyaddress;
    map['company_mobile'] = userReg.companymobile;
    map['user_name'] = userReg.username;
    map['user_email'] = userReg.useremail;
    map['user_address'] = userReg.useremail;
    map['user_mobile'] = userReg.usermobile;
    map['user_password'] = userReg.userpassword;
    map['user_country'] = userReg.usercountry;
    return map;
  }
}
