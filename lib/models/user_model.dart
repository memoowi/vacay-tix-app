class UserModel {
  int? id;
  String? name;
  String? username;
  String? email;
  DateTime? emailVerifiedAt;
  String? gender;
  int? age;
  String? phone;
  String? role;
  String? createdAt;
  String? updatedAt;

  UserModel(
      {this.id,
      this.name,
      this.username,
      this.email,
      this.emailVerifiedAt,
      this.gender,
      this.age,
      this.phone,
      this.role,
      this.createdAt,
      this.updatedAt});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    gender = json['gender'];
    age = json['age'];
    phone = json['phone'];
    role = json['role'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['username'] = username;
    data['email'] = email;
    data['email_verified_at'] = emailVerifiedAt;
    data['gender'] = gender;
    data['age'] = age;
    data['phone'] = phone;
    data['role'] = role;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
