class UserInfo {
  String? userID;
  String? userName;
  String? employeeID;
  String? employeeName;
  String? sessionKey;
  String? clientCode;
  int? sessionLength;

  UserInfo(
      {this.userID,
      this.userName,
      this.employeeID,
      this.employeeName,
      this.sessionKey,
      this.sessionLength});

  UserInfo.fromJson(Map<String, dynamic> json) {
    userID = json['userID'];
    userName = json['userName'];
    employeeID = json['employeeID'];
    employeeName = json['employeeName'];
    sessionKey = json['sessionKey'];
    sessionLength = json['sessionLength'];
    clientCode = json['clientCode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userID'] = userID;
    data['userName'] = userName;
    data['employeeID'] = employeeID;
    data['employeeName'] = employeeName;
    data['sessionKey'] = sessionKey;
    data['sessionLength'] = sessionLength;
    data['clientCode'] = clientCode;
    return data;
  }
}
