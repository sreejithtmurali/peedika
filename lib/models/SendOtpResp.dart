import 'dart:convert';
SendOtpResp sendOtpRespFromJson(String str) => SendOtpResp.fromJson(json.decode(str));
String sendOtpRespToJson(SendOtpResp data) => json.encode(data.toJson());
class SendOtpResp {
  SendOtpResp({
      this.success, 
      this.data, 
      this.message,});

  SendOtpResp.fromJson(dynamic json) {
    success = json['success'];
    data = json['data'];
    message = json['message'];
  }
  bool? success;
  dynamic data;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['data'] = data;
    map['message'] = message;
    return map;
  }

}