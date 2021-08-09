// To parse this JSON data, do
//
//     final roomResponse = roomResponseFromMap(jsonString);

import 'dart:convert';



class RoomResponse {
  RoomResponse({
    this.roomId,
    this.roomName,
    this.imagePath,
  });

  final int roomId;
  final String roomName;
  final String imagePath;



  factory RoomResponse.fromJson(Map<dynamic, dynamic> json) => RoomResponse(
    roomId: json["RoomID"] == null ? null : json["RoomID"],
    roomName: json["RoomName"] == null ? null : json["RoomName"],
    imagePath: json["ImagePath"] == null ? null : json["ImagePath"],
  );

  Map<dynamic, dynamic> toJson() => {
    "RoomID": roomId == null ? null : roomId,
    "RoomName": roomName == null ? null : roomName,
    "ImagePath": imagePath == null ? null : imagePath,
  };
}
