// To parse this JSON data, do
//
//     final cityResponse = cityResponseFromMap(jsonString);

import 'dart:convert';

class CityResponse {
  CityResponse({
    this.cityId,
    this.cityName,
  });

  final int cityId;
  final String cityName;


  factory CityResponse.fromJson(Map<String, dynamic> json) => CityResponse(
    cityId: json["CityID"] == null ? null : json["CityID"],
    cityName: json["CityName"] == null ? null : json["CityName"],
  );

  Map<String, dynamic> toJson() => {
    "CityID": cityId == null ? null : cityId,
    "CityName": cityName == null ? null : cityName,
  };
}
