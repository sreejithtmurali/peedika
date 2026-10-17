import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:peedika/models/LoginResp.dart';
import 'package:peedika/models/SendOtpResp.dart';
class Apiservice {
  final baseurl="https://outmesmart.codeedextechnologies.com";
  final logger=Logger();
  //post
  Future<SendOtpResp?> getOtp(String number) async {
    Uri uri=Uri.parse("$baseurl/api/v1/customer/auth/otp/request");
    try{
      final headers={
        "Accept":"Application/json",
        "Content-Type":"Application/json"
      };
      final body=jsonEncode({"phone": number});
      final response= await http.post(uri,headers: headers,body: body);
      if(response.statusCode>=200&& response.statusCode<=299){
        var json=jsonDecode(response.body);
        return SendOtpResp.fromJson(json);
      }
    }
    catch(e){
      logger.e(e);
    }
  }
  //------------verify
//{"phone": "8111821149","code": "035568", "name": "Jansree Doe","email": "janesree@example.com"}
Future<LoginResp?> verifyOtp(String phone,String code,String name,String email)
async {
  Uri uri=Uri.parse("$baseurl/api/v1/customer/auth/otp/verify");
  try{
    final headers={
      "Accept":"Application/json",
      "Content-Type":"Application/json"
    };
    final body=jsonEncode({"phone": phone,"code": code, "name": name,"email": email});
    final response= await http.post(uri,headers: headers,body: body);
    if(response.statusCode>=200&& response.statusCode<=299){
      var json=jsonDecode(response.body);
      return LoginResp.fromJson(json);
    }
  }
  catch(e){
    logger.e(e);
  }

}






}