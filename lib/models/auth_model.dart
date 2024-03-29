class AuthModel {
  String? status;
  String? accessToken;
  String? tokenType;
  String? message;

  AuthModel({this.status, this.accessToken, this.tokenType, this.message});

  AuthModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    accessToken = json['access_token'];
    tokenType = json['token_type'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = status;
    data['access_token'] = accessToken;
    data['token_type'] = tokenType;
    data['message'] = message;
    return data;
  }
}
