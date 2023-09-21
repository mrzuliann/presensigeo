import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'get_presensi_response.g.dart';

@JsonSerializable(explicitToJson: true)
class GetPresensiResponse {
  @JsonKey(name: 'success')
  bool? success;

  @JsonKey(name: 'message')
  String? message;

  @JsonKey(name: 'data')
  List<DataPresensi>? data;

  GetPresensiResponse({
    this.success,
    this.message,
    this.data,
  });

  factory GetPresensiResponse.fromJson(Map<String, dynamic> json) =>
      _$GetPresensiResponseFromJson(json);
}

class DataPresensi {
  int? id;
  int? userId;
  String? latitude;
  String? longitude;
  String? tanggal;
  String? masuk;
  int? phId;
  int? psId;
  String? createdAt;
  String? updatedAt;
  bool? isHariIni;
  String? pulang;

  DataPresensi(
      {this.id,
      this.userId,
      this.latitude,
      this.longitude,
      this.tanggal,
      this.masuk,
      this.phId,
      this.psId,
      this.createdAt,
      this.updatedAt,
      this.isHariIni,
      this.pulang});

  factory DataPresensi.fromMap(Map<String, dynamic> map) {
    return DataPresensi(
      id: map['id'],
      userId: map['user_id'],
      latitude: map['latitude'],
      longitude: map['longitude'],
      tanggal: map['tanggal'],
      masuk: map['masuk'],
      phId: map['ph_id'],
      psId: map['ps_id'],
      createdAt: map['created_at'],
      updatedAt: map['updated_at'],
      isHariIni: map['is_hari_ini'],
      pulang: map['pulang'],
    );
  }

  factory DataPresensi.fromJson(String source) =>
      DataPresensi.fromMap(json.decode(source));
}
