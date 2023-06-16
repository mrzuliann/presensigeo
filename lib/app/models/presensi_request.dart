import 'dart:convert';

class PresensiRequest {
  String? latitude;
  String? longitude;
  String? phId;
  String? psId;

  PresensiRequest({
    this.latitude,
    this.longitude,
    this.phId,
    this.psId,
  });

  Map<String, dynamic> toMap() {
    return {
      'latitude': latitude,
      'longitude': longitude,
      'ph_id': phId,
      'ps_id': psId,
    };
  }

  String toJson() => json.encode(toMap());
}
