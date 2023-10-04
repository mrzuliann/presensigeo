// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'laporan_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LaporanResponse _$LaporanResponseFromJson(Map<String, dynamic> json) =>
    LaporanResponse(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : (json['data'] as List<dynamic>)
              .map((e) => DataLaporan.fromMap(e as Map<String, dynamic>))
              .toList(),
    );
