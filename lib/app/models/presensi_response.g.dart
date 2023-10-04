// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'presensi_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PresensiResponse _$PresensiResponseFromJson(Map<String, dynamic> json) =>
    PresensiResponse(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      id: json['id'] as int?,
      userId: json['user_id'] as String?,
      latitude: json['latitude'] as String?,
      longitude: json['longitude'] as String?,
      tanggal: json['tanggal'] as String?,
      masuk: json['masuk'] as String?,
      pulang: json['pulang'] as String?,
      phId: json['ph_id'] as String?,
      psId: json['ps_id'] as String?,
    );
