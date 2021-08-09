// To parse this JSON data, do
//
//     final roomListResponse = roomListResponseFromJson(jsonString);

import 'dart:convert';

RoomListResponse roomListResponseFromJson(String str) => RoomListResponse.fromJson(json.decode(str));

String roomListResponseToJson(RoomListResponse data) => json.encode(data.toJson());

class RoomListResponse {
  RoomListResponse({
    this.details,
    this.rooms,
  });

  final List<Detail> details;
  final List<Room> rooms;

  factory RoomListResponse.fromJson(Map<String, dynamic> json) => RoomListResponse(
    details: List<Detail>.from(json["Details"].map((x) => Detail.fromJson(x))),
    rooms: List<Room>.from(json["Rooms"].map((x) => Room.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Details": List<dynamic>.from(details.map((x) => x.toJson())),
    "Rooms": List<dynamic>.from(rooms.map((x) => x.toJson())),
  };
}

class Detail {
  Detail({
    this.maxRomms,
    this.maxAppliances,
    this.maxSchedules,
  });

  final int maxRomms;
  final int maxAppliances;
  final int maxSchedules;

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
    maxRomms: json["MaxRomms"],
    maxAppliances: json["MaxAppliances"],
    maxSchedules: json["MaxSchedules"],
  );

  Map<String, dynamic> toJson() => {
    "MaxRomms": maxRomms,
    "MaxAppliances": maxAppliances,
    "MaxSchedules": maxSchedules,
  };
}

class Room {
  Room({
    this.roomId,
    this.roomName,
    this.macId,
    this.deviceName,
    this.totalAppliance,
  });

  final int roomId;
  final String roomName;
  final String macId;
  final String deviceName;
  final int totalAppliance;

  factory Room.fromJson(Map<String, dynamic> json) => Room(
    roomId: json["roomID"],
    roomName: json["RoomName"],
    macId: json["MacID"],
    deviceName: json["DeviceName"],
    totalAppliance: json["Total Appliance"],
  );

  Map<String, dynamic> toJson() => {
    "roomID": roomId,
    "RoomName": roomName,
    "MacID": macId,
    "DeviceName": deviceName,
    "Total Appliance": totalAppliance,
  };
}
