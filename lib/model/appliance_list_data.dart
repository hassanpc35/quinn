// To parse this JSON data, do
//
//     final applianceListResponse = applianceListResponseFromJson(jsonString);

import 'dart:convert';

ApplianceListResponse applianceListResponseFromJson(String str) => ApplianceListResponse.fromJson(json.decode(str));

String applianceListResponseToJson(ApplianceListResponse data) => json.encode(data.toJson());

class ApplianceListResponse {
  ApplianceListResponse({
    this.appliances,
  });

  final List<Appliance> appliances;

  factory ApplianceListResponse.fromJson(Map<String, dynamic> json) => ApplianceListResponse(
    appliances: List<Appliance>.from(json["Appliances"].map((x) => Appliance.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "Appliances": List<dynamic>.from(appliances.map((x) => x.toJson())),
  };
}

class Appliance {
  Appliance({
    this.applianceId,
    this.name,
    this.type,
    this.port,
    this.status,
    this.voltage,
    this.mode,
    this.lastAction,
    this.transactioDt,
  });

  final int applianceId;
  final String name;
  final String type;
  final int port;
  final bool status;
  final String voltage;
  final String mode;
  final bool lastAction;
  final DateTime transactioDt;

  factory Appliance.fromJson(Map<String, dynamic> json) => Appliance(
    applianceId: json["ApplianceID"],
    name: json["Name"],
    type: json["Type"],
    port: json["port"],
    status: json["Status"],
    voltage: json["Voltage"],
    mode: json["Mode"],
    lastAction: json["LastAction"],
    transactioDt: DateTime.parse(json["TransactioDT"]),
  );

  Map<String, dynamic> toJson() => {
    "ApplianceID": applianceId,
    "Name": name,
    "Type": type,
    "port": port,
    "Status": status,
    "Voltage": voltage,
    "Mode": mode,
    "LastAction": lastAction,
    "TransactioDT": transactioDt.toIso8601String(),
  };
}
