import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:presensimob/app/components/custom_dropdown_mandatory.dart';
import 'package:presensimob/app/components/custom_input_text.dart';
import 'package:presensimob/app/routes/app_pages.dart';

import '../controllers/presensi_out_controller.dart';

class PresensiOutView extends GetView<PresensiOutController> {
  const PresensiOutView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Presensi Keluar'),
          backgroundColor: Colors.teal,
          centerTitle: true,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Get.offAllNamed(
                  Routes.MAIN_MENU); // Kembali ke halaman sebelumnya
            },
          ),
        ),
        body: ValueListenableBuilder(
          valueListenable: controller.mapInitialPosition,
          builder: (context, value, child) {
            if (value != null) {
              return Stack(
                children: [
                  Obx(() => GoogleMap(
                        mapType: MapType.satellite,
                        markers: Set<Marker>.of(controller.markers),
                        myLocationEnabled: true,
                        myLocationButtonEnabled: false,
                        zoomGesturesEnabled: true,
                        tiltGesturesEnabled: false,
                        initialCameraPosition: value,
                        circles: Set<Circle>.of(controller.circles),
                        onMapCreated: (GoogleMapController ctrl) {
                          controller.mapsController.complete(ctrl);
                          controller.setMapPins();
                          controller.setCircles();
                          controller.setSourceIcons();
                        },
                      )),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: IntrinsicHeight(
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 254, 255, 255),
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                        ),
                        child: Form(
                          key: controller.formKey,
                          child: Column(
                            children: [
                              CustomDropdownMandatory(
                                title: 'Status :',
                                hint: 'Pilih Status',
                                dropdownValue:
                                    controller.dropdownStatusValue.value,
                                items: controller.statusAbsensi
                                    .map<DropdownMenuItem<String>>((item) {
                                  return DropdownMenuItem<String>(
                                    value: item.id,
                                    child: Text(item.text),
                                  );
                                }).toList(),
                                onChanged: (newValue) {
                                  controller.dropdownStatusValue.value =
                                      newValue;
                                },
                              ),
                              Obx(() {
                                return Visibility(
                                  visible:
                                      controller.dropdownStatusValue.value !=
                                                  '1' &&
                                              controller.dropdownStatusValue
                                                      .value !=
                                                  '2' &&
                                              controller.dropdownStatusValue
                                                      .value !=
                                                  ''
                                          ? true
                                          : false,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: CustomInputText(
                                      title: 'Keterangan',
                                      controller:
                                          controller.keteranganController,
                                      isValidator: false,
                                    ),
                                  ),
                                );
                              }),
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
                                      "Check Out",
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
                  ),
                ],
              );
            }

            return Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }
}
