class ApplianceResponse {
  int applianceID;
  String applianceName;
  String imagePath;

  ApplianceResponse({this.applianceID, this.applianceName, this.imagePath});

  ApplianceResponse.fromJson(Map<String, dynamic> json) {
    applianceID = json['ApplianceID'];
    applianceName = json['ApplianceName'];
    imagePath = json['ImagePath'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ApplianceID'] = this.applianceID;
    data['ApplianceName'] = this.applianceName;
    data['ImagePath'] = this.imagePath;
    return data;
  }
}

