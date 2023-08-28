// To parse this JSON data, do
//
//     final login = loginFromJson(jsonString);

import 'dart:convert';

Login loginFromJson(String str) => Login.fromJson(json.decode(str));

String loginToJson(Login data) => json.encode(data.toJson());

class Login {
    bool status;
    String codeStatus;
    String message;
    dynamic data;
    int count;

    Login({
        required this.status,
        required this.codeStatus,
        required this.message,
        required this.data,
        required this.count,
    });

    factory Login.fromJson(Map<String, dynamic> json) => Login(
        status: json["status"],
        codeStatus: json["codeStatus"],
        message: json["message"],
        data: json["data"],
        count: json["count"],
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "codeStatus": codeStatus,
        "message": message,
        "data": data,
        "count": count,
    };
}
