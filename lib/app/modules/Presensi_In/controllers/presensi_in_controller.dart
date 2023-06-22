import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:presensimob/app/data/presensi_provider.dart';
import 'package:presensimob/app/models/general_data_hardcode_value.dart';
import 'package:presensimob/app/models/presensi_request.dart';
import 'package:presensimob/app/utils/get_location.dart';
import 'package:presensimob/app/utils/hardcode_data.dart';
import 'package:sp_util/sp_util.dart';

class PresensiInController extends GetxController {
  final Completer<GoogleMapController> mapsController = Completer();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  RxDouble latitude = 0.0.obs;
  RxDouble longitude = 0.0.obs;
  RxBool isLoadingRequest = false.obs;
  LatLng? center;

  ValueNotifier<CameraPosition?> mapInitialPosition =
      ValueNotifier<CameraPosition?>(null);

  RxString dropdownStatusValue = ''.obs;

  RxList<GeneralHardCodeDataValue> statusAbsensi =
      (List<GeneralHardCodeDataValue>.of(
              ListGeneralHardCodeDataValue.fromMap(HardCodeData.statusAbsensi)
                  .data))
          .obs;

  @override
  void onInit() {
    super.onInit();
    setupPermissionandLocation();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void setupPermissionandLocation() async {
    GetLocation locationService = GetLocation();

    LocationPermission permissionStatus =
        await locationService.checkPermissionGetLocation();

    if (permissionStatus == LocationPermission.always) {
      var checkLocationEnable = await locationService.checkLocationEnable();

      if (checkLocationEnable) {
        var locationData = await locationService.getLocationData();
        debugPrint(
            "ini lokasi ${locationData.latitude}, ${locationData.longitude}");

        mapInitialPosition.value = CameraPosition(
          target: LatLng(locationData.latitude, locationData.longitude),
          zoom: 17.0,
        );

        latitude.value = locationData.latitude;
        longitude.value = locationData.longitude;
      }
    }
  }

  Future<void> submitForm() async {
    try {
      if (formKey.currentState?.validate() ?? false) {
        isLoadingRequest(true);
        var request = PresensiRequest(
            latitude: latitude.value.toString(),
            longitude: longitude.toString(),
            phId: "1",
            psId: dropdownStatusValue.value);

        var response =
            await PresensiProvider().sentPresensiLocation(data: request);

        if (response != null) {
          SpUtil.putString('jam_masuk', response.masuk ?? '');
          SpUtil.putString('status_presensi', response.psId ?? '');

          Get.back(result: true);
        } else {
          Get.snackbar(
            "Error",
            "Silahkan Coba Lagi",
            backgroundColor: Colors.red,
            colorText: Colors.white,
          );
        }
      }
    } finally {
      isLoadingRequest(false);
    }
  }
}
