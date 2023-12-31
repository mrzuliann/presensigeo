import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:presensimob/app/data/presensi_provider.dart';
import 'package:presensimob/app/models/general_data_hardcode_value.dart';
import 'package:presensimob/app/models/presensi_request.dart';
import 'package:presensimob/app/utils/get_bytes.dart';
import 'package:presensimob/app/utils/get_location.dart';
import 'package:presensimob/app/utils/hardcode_data.dart';
import 'package:sp_util/sp_util.dart';

class PresensiOutController extends GetxController {
  final Completer<GoogleMapController> mapsController = Completer();
  final TextEditingController keteranganController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  RxDouble latitude = 0.0.obs;
  RxDouble longitude = 0.0.obs;

  RxDouble latitudeDestination = 0.0.obs;
  RxDouble longitudeDestination = 0.0.obs;
  RxDouble radius = 0.0.obs;

  RxBool isLoadingRequest = false.obs;
  LatLng? center;
  BitmapDescriptor? originIcon;

  List<Marker> markers = <Marker>[].obs;
  List<Circle> circles = <Circle>[].obs;
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
    setCircles();
    setSourceIcons();
    latitudeDestination.value =
        double.parse('${SpUtil.getString('school_latitude', defValue: '0')}');
    longitudeDestination.value =
        double.parse('${SpUtil.getString('school_longitude', defValue: '0')}');
    radius.value = SpUtil.getDouble('radius', defValue: 0)!;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void setSourceIcons() async {
    final Uint8List imageData =
        await GetBytes.getBytesFromAsset('images/ic_marker_edu.png', 120);

    originIcon = BitmapDescriptor.fromBytes(imageData);
  }

  void setMapPins() {
    markers.add(Marker(
        markerId: const MarkerId('1'),
        position: LatLng(latitudeDestination.value, longitudeDestination.value),
        icon: originIcon!));

    update();
  }

  void setCircles() {
    circles.add(
      Circle(
        circleId: CircleId('1'),
        center: LatLng(latitudeDestination.value, longitudeDestination.value),
        radius: radius.value,
        fillColor: const Color.fromARGB(0, 20, 20, 20),
        strokeColor: Color.fromARGB(255, 255, 34, 34),
        strokeWidth: 3,
      ),
    );
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
          zoom: 14.0,
        );

        latitude.value = locationData.latitude;
        longitude.value = locationData.longitude;
      }
    }
  }

  Future<void> submitForm() async {
    try {
      double distance = Geolocator.distanceBetween(
        latitude.value,
        longitude.value,
        latitudeDestination.value,
        longitudeDestination.value,
      );

      // bool canMockLocation = await SafeDevice.canMockLocation;
      var request = PresensiRequest(
        latitude: latitude.value.toString(),
        longitude: longitude.toString(),
        phId: "2",
        psId: dropdownStatusValue.value,
        pdDesc: keteranganController.text,
      );

      // debugPrint('ini distance $distance $canMockLocation');

      if (formKey.currentState?.validate() ?? false) {
        if (dropdownStatusValue.value != '1' &&
            dropdownStatusValue.value != '2' &&
            dropdownStatusValue.value != '') {
          isLoadingRequest(true);

          var response =
              await PresensiProvider().sentPresensiLocation(data: request);

          if (response?.success == false) {
            Get.snackbar(
              "Error",
              response?.message ?? '',
              backgroundColor: Colors.red,
              colorText: Colors.white,
            );
          } else {
            Get.back(result: true);
          }
        } else if (distance <= radius.value) {
          isLoadingRequest(true);

          var response =
              await PresensiProvider().sentPresensiLocation(data: request);

          if (response?.success == false) {
            Get.snackbar(
              "Error",
              response?.message ?? '',
              backgroundColor: Colors.red,
              colorText: Colors.white,
            );
          } else {
            Get.back(result: true);
          }
        } else {
          Get.snackbar(
            "Error",
            "Anda harus berada di dalam radius sekolah agar bisa melakukan Presensi",
            backgroundColor: Color.fromARGB(255, 255, 119, 109),
            colorText: Colors.white,
          );
        }
      }
    } finally {
      isLoadingRequest(false);
    }
  }
}
