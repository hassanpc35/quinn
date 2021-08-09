// To parse this JSON data, do
//
//     final scheduleDataResponse = scheduleDataResponseFromJson(jsonString);

import 'dart:convert';

ScheduleDataResponse scheduleDataResponseFromJson(String str) => ScheduleDataResponse.fromJson(json.decode(str));

String scheduleDataResponseToJson(ScheduleDataResponse data) => json.encode(data.toJson());

class ScheduleDataResponse {
  ScheduleDataResponse({
    this.schedules,
  });

  final List<Schedule> schedules;

  factory ScheduleDataResponse.fromJson(Map<String, dynamic> json) => ScheduleDataResponse(
    schedules: List<Schedule>.from(json["Schedules"].map((x) => Schedule.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Schedules": List<dynamic>.from(schedules.map((x) => x.toJson())),
  };
}

class Schedule {
  Schedule({
    this.id,
    this.roomName,
    this.scheduleTime,
    this.action,
  });

  final int id;
  final String roomName;
  final DateTime scheduleTime;
  final bool action;

  factory Schedule.fromJson(Map<String, dynamic> json) => Schedule(
    id: json["ID"],
    roomName: json["RoomName"],
    scheduleTime: DateTime.parse(json["ScheduleTime"]),
    action: json["Action"],
  );

  Map<String, dynamic> toJson() => {
    "ID": id,
    "RoomName": roomName,
    "ScheduleTime": scheduleTime.toIso8601String(),
    "Action": action,
  };
}
