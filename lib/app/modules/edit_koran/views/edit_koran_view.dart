import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import '../../../data/models/setoran_model.dart';
import '../controllers/edit_koran_controller.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:http/http.dart' as http;

class EditKoranView extends GetView<EditKoranController> {
  Setoran set = Get.arguments;
  @override
  Widget build(BuildContext context) {
    controller.jumlahC.text = set.jumlah!;
    // controller.dataTanggal.value = set.tanggal!;
    // controller.namakoran.value = set.namaKoran!;
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Colors.purpleAccent,
              Colors.blue,
              // Colors.greenAccent
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
        ),
        title: Text('Edit Koran'),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          SizedBox(height: 20),
          DropdownSearch<String>(
            onChanged: (value) {
              controller.nameOfKoran.value = value.toString();
            },
            dropdownDecoratorProps: DropDownDecoratorProps(
              dropdownSearchDecoration: InputDecoration(hintText: 'Nama koran'),
            ),
            selectedItem: set.namaKoran,
            asyncItems: (String filter) async {
              var response =
                  await http.get(Uri.parse("http://192.168.100.5:8080/koran"));
              if (response.statusCode != 200) return [];

              List allKoran =
                  (jsonDecode(response.body) as Map<String, dynamic>)["data"];
              List<String> allNameKoran = [];

              allKoran.forEach((element) {
                allNameKoran.add(element["koran"]);
              });

              return allNameKoran;
            },
          ),
          SizedBox(height: 20),
          Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  (controller.dataTanggal.value == '')
                      ? set.tanggal!
                      : DateFormat().add_yMd().format(
                            DateTime.parse(controller.dataTanggal.string),
                          ),
                  style: TextStyle(fontSize: 15),
                ),
                IconButton(
                  alignment: Alignment.centerRight,
                  onPressed: () {
                    showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2010),
                      lastDate: DateTime(2110),
                    ).then(
                      (value) {
                        if (value != null) {
                          controller.dataTanggal.value = value.toString();
                        } else {
                          controller.dataTanggal.value = set.tanggal!;
                        }
                        // print(value);
                        // print('---------');
                        print(controller.dataTanggal.value);
                      },
                    );
                  },
                  icon: Icon(Icons.date_range_rounded),
                ),
              ],
            ),
          ),
          Divider(
            thickness: 1,
            height: 10,
            color: Colors.black54,
          ),
          SizedBox(height: 20),
          TextField(
            controller: controller.jumlahC,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              // border:  OutlineInputBorder(),
              labelText: "Jumlah",
            ),
          ),
          SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              controller.updateKoran(set.id!);
            },
            child: Text("Simpan"),
          ),
        ],
      ),
    );
  }
}
