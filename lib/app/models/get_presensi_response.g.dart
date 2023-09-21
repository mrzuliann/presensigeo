// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_presensi_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetPresensiResponse _$GetPresensiResponseFromJson(Map<String, dynamic> json) =>
    GetPresensiResponse(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : (json['data'] as List<dynamic>)
              .map((e) => DataPresensi.fromMap(e as Map<String, dynamic>))
              .toList(),
    );
