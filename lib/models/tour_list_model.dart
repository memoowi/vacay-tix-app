import 'package:vacay_tix/models/tour_model.dart';

class TourListModel {
  String? status;
  List<TourData>? data;

  TourListModel({this.status, this.data});

  TourListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <TourData>[];
      json['data'].forEach((v) {
        data!.add(TourData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}