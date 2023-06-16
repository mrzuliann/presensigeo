import 'package:json_annotation/json_annotation.dart';

part 'presensi_response.g.dart';

@JsonSerializable(explicitToJson: true)
class PresensiResponse {
  @JsonKey(name: 'id')
  int? id;

  @JsonKey(name: 'user_id')
  String? userId;

  @JsonKey(name: 'latitude')
  String? latitude;

  @JsonKey(name: 'longitude')
  String? longitude;

  @JsonKey(name: 'tanggal')
  String? tanggal;

  @JsonKey(name: 'masuk')
  String? masuk;

  @JsonKey(name: 'pulang')
  String? pulang;

  @JsonKey(name: 'ph_id')
  String? phId;

  @JsonKey(name: 'ps_id')
  String? psId;

  PresensiResponse({
    this.id,
    this.userId,
    this.latitude,
    this.longitude,
    this.tanggal,
    this.masuk,
    this.pulang,
    this.phId,
    this.psId,
  });

  factory PresensiResponse.fromJson(Map<String, dynamic> json) =>
      _$PresensiResponseFromJson(json);
}
