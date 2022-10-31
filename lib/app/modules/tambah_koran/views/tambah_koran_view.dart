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
String tahun = DateFormat().add_y().format(DateTime.now());
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 55, 52, 245),
              // Colors.purpleAccent,
              Colors.lightBlueAccent,
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
          TextField(
            controller: controller.tanggal,
            keyboardType: TextInputType.datetime,
            onTap: () {
              showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2010),
                lastDate: DateTime(int.parse(tahun) + 1),
              ).then(
                (value) {
                  if (value != null) {
                    return controller.tanggal.text =
                        DateFormat('y-M-dd').format(
                      DateTime.parse(value.toString()),
                    );
                  }
                },
              );
            },
            decoration: InputDecoration(
              suffixIcon: Icon(Icons.date_range_outlined),
              // border:  OutlineInputBorder(),
              labelText: "Tanggal",
            ),
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
