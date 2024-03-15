class QRCodeModel {
  String? status;
  Data? data;

  QRCodeModel({this.status, this.data});

  QRCodeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
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

class Data {
  int? id;
  int? bookingId;
  String? qrCode;
  String? isUsed;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
      this.bookingId,
      this.qrCode,
      this.isUsed,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    bookingId = json['booking_id'];
    qrCode = json['qr_code'];
    isUsed = json['is_used'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['booking_id'] = this.bookingId;
    data['qr_code'] = this.qrCode;
    data['is_used'] = this.isUsed;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
