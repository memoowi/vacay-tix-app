class BookingModel {
  String? status;
  BookingData? data;

  BookingModel({this.status, this.data});

  BookingModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? BookingData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class BookingData {
  int? id;
  int? userId;
  int? tourId;
  DateTime? bookingDate;
  String? status;
  int? totalPrice;
  String? createdAt;
  String? updatedAt;
  Tour? tour;
  User? user;
  Payment? payment;
  QrCode? qrCode;

  BookingData(
      {this.id,
      this.userId,
      this.tourId,
      this.bookingDate,
      this.status,
      this.totalPrice,
      this.createdAt,
      this.updatedAt,
      this.tour,
      this.user,
      this.payment,
      this.qrCode});

  BookingData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    tourId = json['tour_id'];
    bookingDate = DateTime.parse(json['booking_date']);
    status = json['status'];
    totalPrice = json['total_price'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    tour = json['tour'] != null ? Tour.fromJson(json['tour']) : null;
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    payment =
        json['payment'] != null ? Payment.fromJson(json['payment']) : null;
    qrCode = json['qr_code'] != null ? QrCode.fromJson(json['qr_code']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['tour_id'] = this.tourId;
    data['booking_date'] = this.bookingDate;
    data['status'] = this.status;
    data['total_price'] = this.totalPrice;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.tour != null) {
      data['tour'] = this.tour!.toJson();
    }
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.payment != null) {
      data['payment'] = this.payment!.toJson();
    }
    if (this.qrCode != null) {
      data['qr_code'] = this.qrCode!.toJson();
    }
    return data;
  }
}

class Tour {
  int? id;
  String? name;
  String? description;
  String? imageUrls;
  String? location;
  int? price;
  String? createdAt;
  String? updatedAt;

  Tour(
      {this.id,
      this.name,
      this.description,
      this.imageUrls,
      this.location,
      this.price,
      this.createdAt,
      this.updatedAt});

  Tour.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    imageUrls = json['image_urls'];
    location = json['location'];
    price = json['price'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['image_urls'] = this.imageUrls;
    data['location'] = this.location;
    data['price'] = this.price;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? username;
  String? email;
  Null? emailVerifiedAt;
  String? gender;
  int? age;
  String? phone;
  String? role;
  String? createdAt;
  String? updatedAt;

  User(
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

  User.fromJson(Map<String, dynamic> json) {
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
    data['id'] = this.id;
    data['name'] = this.name;
    data['username'] = this.username;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['gender'] = this.gender;
    data['age'] = this.age;
    data['phone'] = this.phone;
    data['role'] = this.role;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class Payment {
  int? id;
  int? bookingId;
  String? paymentDate;
  String? paymentMethod;
  int? amount;
  String? createdAt;
  String? updatedAt;

  Payment(
      {this.id,
      this.bookingId,
      this.paymentDate,
      this.paymentMethod,
      this.amount,
      this.createdAt,
      this.updatedAt});

  Payment.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bookingId = json['booking_id'];
    paymentDate = json['payment_date'];
    paymentMethod = json['payment_method'];
    amount = json['amount'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['booking_id'] = this.bookingId;
    data['payment_date'] = this.paymentDate;
    data['payment_method'] = this.paymentMethod;
    data['amount'] = this.amount;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class QrCode {
  int? id;
  int? bookingId;
  String? qrCode;
  String? isUsed;
  String? createdAt;
  String? updatedAt;

  QrCode(
      {this.id,
      this.bookingId,
      this.qrCode,
      this.isUsed,
      this.createdAt,
      this.updatedAt});

  QrCode.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bookingId = json['booking_id'];
    qrCode = json['qr_code'];
    isUsed = json['is_used'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['booking_id'] = this.bookingId;
    data['qr_code'] = this.qrCode;
    data['is_used'] = this.isUsed;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
