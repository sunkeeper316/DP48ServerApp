// To parse this JSON data, do
//
//     final welcome10 = welcome10FromJson(jsonString);

import 'dart:convert';

ResponseCommon responseCommonFromJson(String str) => ResponseCommon.fromJson(json.decode(str));

String responseCommonToJson(ResponseCommon data) => json.encode(data.toJson());

class ResponseCommon {
  ResponseCommon({
    this.error,
    this.id,
    this.insertId,
    this.data,
    this.message,
  });

  int? error;
  int? id;
  int? insertId;
  String? data;
  String? message;

  factory ResponseCommon.fromJson(Map<String, dynamic> json) => ResponseCommon(
    error: json["error"],
    id: json["id"],
    insertId: json["insertId"],
    data: json["data"],
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "error": error,
    "id": id,
    "insertId": insertId,
    "data": data,
    "message": message,
  };
}
