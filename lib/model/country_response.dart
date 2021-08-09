// To parse this JSON data, do
//
//     final countryResponse = countryResponseFromMap(jsonString);

import 'dart:convert';

class CountryResponse {
  CountryResponse({
    this.countryId,
    this.countryName,
  });

  final int countryId;
  final String countryName;



    factory CountryResponse.fromJson(Map<String, dynamic> json) => CountryResponse(
      countryId: json["CountryID"] == null ? null : json["CountryID"],
      countryName: json["CountryName"] == null ? null : json["CountryName"],
    );

    Map<String, dynamic> toJson() => {
      "CountryID": countryId == null ? null : countryId,
      "CountryName": countryName == null ? null : countryName,
    };
  }


