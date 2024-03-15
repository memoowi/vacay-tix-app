class TourModel {
  String? status;
  TourData? data;

  TourModel({this.status, this.data});

  TourModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? TourData.fromJson(json['data']) : null;
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

class TourData {
  int? id;
  String? name;
  String? description;
  List<String>? imageUrls;
  String? location;
  int? price;
  String? createdAt;
  String? updatedAt;

  TourData(
      {this.id,
      this.name,
      this.description,
      this.imageUrls,
      this.location,
      this.price,
      this.createdAt,
      this.updatedAt});

  TourData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    imageUrls = json['image_urls'].cast<String>();
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
