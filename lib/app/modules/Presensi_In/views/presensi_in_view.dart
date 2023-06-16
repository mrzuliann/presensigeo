import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:presensimob/app/components/custom_dropdown_mandatory.dart';
import 'package:presensimob/app/routes/app_pages.dart';

import '../controllers/presensi_in_controller.dart';

class PresensiInView extends GetView<PresensiInController> {
  const PresensiInView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Presensi Masuk'),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.offAllNamed(Routes.MAIN_MENU); // Kembali ke halaman sebelumnya
          },
        ),
      ),
      body: Stack(
        children: [
          ValueListenableBuilder(
            valueListenable: controller.mapInitialPosition,
            builder: (context, value, child) {
              if (value != null) {
                return GoogleMap(
                  mapType: MapType.normal,
                  // markers: markers,
                  myLocationEnabled: true,
                  myLocationButtonEnabled: false,
                  // polylines: polylines,
                  initialCameraPosition: value,
                  onMapCreated: (GoogleMapController ctrl) {
                    controller.mapsController.complete(ctrl);
                  },
                );
              }

              return Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: IntrinsicHeight(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
                child: Form(
                  key: controller.formKey,
                  child: Column(
                    children: [
                      CustomDropdownMandatory(
                        title: 'Status',
                        hint: 'Pilih Status',
                        dropdownValue: controller.dropdownStatusValue.value,
                        items: controller.statusAbsensi
                            .map<DropdownMenuItem<String>>((item) {
                          return DropdownMenuItem<String>(
                            value: item.id,
                            child: Text(item.text),
                          );
                        }).toList(),
                        onChanged: (newValue) {
                          controller.dropdownStatusValue.value = newValue;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Obx(() {
                        if (controller.isLoadingRequest.value) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        return SizedBox(
                          width: double.infinity,
                          child: TextButton(
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.green,
                            ),
                            onPressed: () => controller.submitForm(),
                            child: Text(
                              "Check In",
                              style: TextStyle(
                                color: Color(0xffffffff),
                              ),
                            ),
                          ),
                        );
                      })
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
