import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:http/http.dart' as http;
import '../controllers/tambah_koran_controller.dart';

class TambahKoranView extends GetView<TambahKoranController> {
  @override
  Widget build(BuildContext context) {
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
        title: Text('Tambah Data Koran'),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          SizedBox(height: 20),
          DropdownSearch<String>(
            onChanged: (value) {
              controller.namakoran.value = value.toString();
            },
            // selectedItem: set.namaKoran,
            dropdownDecoratorProps: DropDownDecoratorProps(
              dropdownSearchDecoration: InputDecoration(hintText: 'Nama koran'),
            ),
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
          Obx(() => TextButton(
                onPressed: () {
                  showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2010),
                    lastDate: DateTime(2110),
                  ).then((value) {
                    if (value != null) {
                      return controller.dataTanggal.value = value.toString();
                    }
                  });
                },
                child: Row(
                  children: [
                    Text(
                      (controller.dataTanggal.value == '')
                          ? 'Tanggal'
                          : DateFormat().add_yMd().format(
                                DateTime.parse(controller.dataTanggal.string),
                              ),
                      style: TextStyle(
                          fontSize: 15,
                          color: Color.fromARGB(255, 102, 95, 95)),
                    ),
                  ],
                ),
              )),
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
              controller.tambahKoran();
            },
            child: Text('Tambah data'),
          ),
        ],
      ),
    );
  }
}
