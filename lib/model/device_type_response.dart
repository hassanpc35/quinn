class DeviceTypeResponse {
  int deviceID;
  String deviceName;
  int noPort;

  DeviceTypeResponse({this.deviceID, this.deviceName, this.noPort});

  DeviceTypeResponse.fromJson(Map<String, dynamic> json) {
    deviceID = json['DeviceID'];
    deviceName = json['DeviceName'];
    noPort = json['NoPort'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['DeviceID'] = this.deviceID;
    data['DeviceName'] = this.deviceName;
    data['NoPort'] = this.noPort;
    return data;
  }
}

