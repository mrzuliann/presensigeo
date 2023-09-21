import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable(explicitToJson: true)
class LoginResponse {
  @JsonKey(name: 'success')
  bool? success;

  @JsonKey(name: 'message')
  String? message;

  @JsonKey(name: 'data')
  Data? data;

  LoginResponse({
    this.success,
    this.message,
    this.data,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}

class Data {
  int? id;
  String? nip;
  String? name;
  String? email;
  int? schoolId;
  int? roleId;
  String? emailVerifiedAt;
  String? createdAt;
  String? updatedAt;
  int? activeStatus;
  String? avatar;
  int? darkMode;
  String? messengerColor;
  String? token;
  String? tokenType;
  School? school;
  List<PresensiHourDay>? presensihourday;

  Data({
    this.id,
    this.nip,
    this.name,
    this.email,
    this.schoolId,
    this.roleId,
    this.emailVerifiedAt,
    this.createdAt,
    this.updatedAt,
    this.activeStatus,
    this.avatar,
    this.darkMode,
    this.messengerColor,
    this.token,
    this.tokenType,
    this.school,
    this.presensihourday,
  });

  factory Data.fromMap(Map<String, dynamic> map) {
    return Data(
      id: map['id'],
      nip: map['nip'],
      name: map['name'],
      email: map['email'],
      schoolId: map['school_id'],
      roleId: map['role_id'],
      emailVerifiedAt: map['email_verified_at'],
      createdAt: map['created_at'],
      updatedAt: map['updated_at'],
      activeStatus: map['active_status'],
      avatar: map['avatar'],
      darkMode: map['dark_mode'],
      messengerColor: map['messenger_color'],
      token: map['token'],
      tokenType: map['token_type'],
      school: map['school'] != null ? School.fromMap(map['school']) : null,
      presensihourday: map['presensihourday'] == null
          ? null
          : (map['presensihourday'] as List<dynamic>)
              .map((e) => PresensiHourDay.fromMap(e as Map<String, dynamic>))
              .toList(),
    );
  }

  factory Data.fromJson(String source) => Data.fromMap(json.decode(source));
}

class School {
  int? id;
  String? name;
  double? latitude;
  double? longitude;
  int? radius;
  String? createdAt;
  String? updatedAt;
  List<PresensiHourDay>? presensihourday;

  School({
    this.id,
    this.name,
    this.latitude,
    this.longitude,
    this.radius,
    this.createdAt,
    this.updatedAt,
    this.presensihourday,
  });

  factory School.fromMap(Map<String, dynamic> map) {
    return School(
      id: map['id'],
      name: map['name'],
      latitude: map['latitude'],
      longitude: map['longitude'],
      radius: map['radius'],
      createdAt: map['created_at'],
      updatedAt: map['updated_at'],
      presensihourday: map['presensihourday'] == null
          ? null
          : (map['presensihourday'] as List<dynamic>)
              .map((e) => PresensiHourDay.fromMap(e as Map<String, dynamic>))
              .toList(),
    );
  }

  factory School.fromJson(String source) => School.fromMap(json.decode(source));
}

class PresensiHourDay {
  int? phdId;
  int? phId;
  int? schoolId;
  int? shiftId;
  String? phDay;
  String? phTimeStart;
  String? phTimeEnd;
  String? createdAt;
  String? updatedAt;
  Shift? shift;
  PresensiHour? presensihour;

  PresensiHourDay({
    this.phdId,
    this.phId,
    this.schoolId,
    this.shiftId,
    this.phDay,
    this.phTimeStart,
    this.phTimeEnd,
    this.createdAt,
    this.updatedAt,
    this.shift,
    this.presensihour,
  });

  factory PresensiHourDay.fromMap(Map<String, dynamic> map) {
    return PresensiHourDay(
      phdId: map['phd_id'],
      phId: map['ph_id'],
      schoolId: map['school_id'],
      shiftId: map['shift_id'],
      phDay: map['ph_day'],
      phTimeStart: map['ph_time_start'],
      phTimeEnd: map['ph_time_end'],
      createdAt: map['created_at'],
      updatedAt: map['updated_at'],
      shift: map['shift'] != null ? Shift.fromMap(map['shift']) : null,
      presensihour: map['presensihour'] != null
          ? PresensiHour.fromMap(map['presensihour'])
          : null,
    );
  }

  factory PresensiHourDay.fromJson(String source) =>
      PresensiHourDay.fromMap(json.decode(source));
}

class Shift {
  int? shiftId;
  int? schoolId;
  String? shiftName;
  String? createdAt;
  String? updatedAt;

  Shift({
    this.shiftId,
    this.schoolId,
    this.shiftName,
    this.createdAt,
    this.updatedAt,
  });

  factory Shift.fromMap(Map<String, dynamic> map) {
    return Shift(
      shiftId: map['shift_id'],
      schoolId: map['school_id'],
      shiftName: map['shift_name'],
      createdAt: map['created_at'],
      updatedAt: map['updated_at'],
    );
  }

  factory Shift.fromJson(String source) => Shift.fromMap(json.decode(source));
}

class PresensiHour {
  int? id;
  String? phName;
  String? phDesc;
  String? phTimeStart;
  String? phTimeEnd;
  int? ahStatus;
  String? createdAt;
  String? updatedAt;

  PresensiHour({
    this.id,
    this.phName,
    this.phDesc,
    this.phTimeStart,
    this.phTimeEnd,
    this.ahStatus,
    this.createdAt,
    this.updatedAt,
  });

  factory PresensiHour.fromMap(Map<String, dynamic> map) {
    return PresensiHour(
      id: map['id'],
      phName: map['ph_name'],
      phDesc: map['ph_desc'],
      phTimeStart: map['ph_time_start'],
      phTimeEnd: map['ph_time_end'],
      ahStatus: map['ah_status'],
      createdAt: map['created_at'],
      updatedAt: map['updated_at'],
    );
  }

  factory PresensiHour.fromJson(String source) =>
      PresensiHour.fromMap(json.decode(source));
}
