import 'dart:convert';

class PresensiRequest {
  String? latitude;
  String? longitude;
  String? phId;
  String? psId;
  String? pdDesc;

  PresensiRequest({
    this.latitude,
    this.longitude,
    this.phId,
    this.psId,
    this.pdDesc,
  });

  Map<String, dynamic> toMap() {
    return {
      'latitude': latitude,
      'longitude': longitude,
      'ph_id': phId,
      'ps_id': psId,
      'pd_desc': pdDesc,
    };
  }

  String toJson() => json.encode(toMap());
}
