// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventResponse _$EventResponseFromJson(Map<String, dynamic> json) =>
    EventResponse(
      success: json['success'] as bool?,
      data: json['data'] == null
          ? null
          : (json['data'] as List<dynamic>)
              .map((e) => EventDTO.fromMap(e as Map<String, dynamic>))
              .toList(),
    );
