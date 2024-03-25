import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'laporan_response.g.dart';

@JsonSerializable(explicitToJson: true)
class LaporanResponse {
  @JsonKey(name: 'success')
  bool? success;

  @JsonKey(name: 'message')
  String? message;

  @JsonKey(name: 'data')
  List<DataLaporan>? data;

  LaporanResponse({
    this.success,
    this.message,
    this.data,
  });

  factory LaporanResponse.fromJson(Map<String, dynamic> json) =>
      _$LaporanResponseFromJson(json);
}

class DataLaporan {
  String? name;
  int? bulan;
  int? tahun;
  int? hadir;
  int? tidakHadir;
  int? izin;
  int? sakit;
  int? cuti;
  int? tugas;
  int? izinTerlambat;
  int? izinPulangCepat;

  DataLaporan({
    this.name,
    this.bulan,
    this.tahun,
    this.hadir,
    this.tidakHadir,
    this.izin,
    this.sakit,
    this.cuti,
    this.tugas,
    this.izinTerlambat,
    this.izinPulangCepat,
  });

  factory DataLaporan.fromMap(Map<String, dynamic> map) {
    return DataLaporan(
      name: map['name'],
      bulan: map['bulan'],
      tahun: map['tahun'],
      hadir: map['hadir'],
      tidakHadir: map['tidak_hadir'],
      izin: map['izin'],
      sakit: map['sakit'],
      cuti: map['cuti'],
      tugas: map['tugas'],
      izinTerlambat: map['izin_terlambat'],
      izinPulangCepat: map['izin_pulang_cepat'],
    );
  }

  factory DataLaporan.fromJson(String source) =>
      DataLaporan.fromMap(json.decode(source));
}
