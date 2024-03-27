import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'event_response.g.dart';

@JsonSerializable(explicitToJson: true)
class EventResponse {
  @JsonKey(name: 'success')
  bool? success;

  @JsonKey(name: 'data')
  List<EventDTO>? data;

  EventResponse({this.success, this.data});

  factory EventResponse.fromJson(Map<String, dynamic> json) =>
      _$EventResponseFromJson(json);
}

class EventDTO {
  int? eventId;
  int? schoolId;
  int? phId;
  String? eventName;
  String? eventDesc;
  String? eventImage;
  int? eventRadius;
  String? eventLocationName;
  double? eventLat;
  double? eventLng;
  String? eventDate;
  String? eventStartTime;
  String? eventEndTime;
  int? eventRutin;
  int? eventCreateBy;
  int? eventTipePeserta;
  String? eventCreateAt;
  String? eventCreateUpdateAt;
  String? eventDeletedAt;
  String? updatedAt;
  String? createdAt;

  EventDTO(
      {this.eventId,
      this.schoolId,
      this.phId,
      this.eventName,
      this.eventDesc,
      this.eventImage,
      this.eventRadius,
      this.eventLocationName,
      this.eventLat,
      this.eventLng,
      this.eventDate,
      this.eventStartTime,
      this.eventEndTime,
      this.eventRutin,
      this.eventCreateBy,
      this.eventTipePeserta,
      this.eventCreateAt,
      this.eventCreateUpdateAt,
      this.eventDeletedAt,
      this.updatedAt,
      this.createdAt});

  factory EventDTO.fromMap(Map<String, dynamic> map) {
    return EventDTO(
      eventId: map['event_id'],
      schoolId: map['school_id'],
      phId: map['ph_id'],
      eventName: map['event_name'],
      eventDesc: map['event_desc'],
      eventImage: map['event_image'],
      eventRadius: map['event_radius'],
      eventLocationName: map['event_location_name'],
      eventLat: map['event_lat'],
      eventLng: map['event_lng'],
      eventDate: map['event_date'],
      eventStartTime: map['event_start_time'],
      eventEndTime: map['event_end_time'],
      eventRutin: map['event_rutin'],
      eventCreateBy: map['event_create_by'],
      eventTipePeserta: map['event_tipe_peserta'],
      eventCreateAt: map['event_create_at'],
      eventCreateUpdateAt: map['event_create_update_at'],
      eventDeletedAt: map['event_deleted_at'],
      updatedAt: map['updated_at'],
      createdAt: map['created_at'],
    );
  }

  factory EventDTO.fromJson(String source) =>
      EventDTO.fromMap(json.decode(source));
}
