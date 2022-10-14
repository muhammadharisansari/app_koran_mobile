import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/koran_model.dart';

class BaseURL {
  //untuk restful API localhost real device (nyalakan dengan gitbase)
  final baseurl = 'http://192.168.100.5:8080';

//Transaksi koran
  void delKoran(id) async {
    final response = await http.delete(
      Uri.parse(baseurl + '/setoran/$id'),
    );
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }

  void addKoran(nama, tanggal, jumlah) async {
    final body = {
      "nama_koran": nama,
      "tanggal": tanggal,
      "jumlah": jumlah,
      // "created_at": DateTime.now().toString(),
      // "updated_at": '0',
    };

    final response = await http.post(
      Uri.parse(baseurl + '/setoran'),
      body: body,
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/x-www-form-urlencoded"
      },
    );
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }

  void upKoran(id, nama, tanggal, jumlah) async {
    final body = {
      "nama_koran": nama,
      "tanggal": tanggal,
      "jumlah": jumlah,
      // "updated_at": DateTime.now().toString(),
    };

    final response = await http.patch(
      Uri.parse(baseurl + '/setoran/$id'),
      body: body,
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/x-www-form-urlencoded"
      },
    );
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }

//Mitra koran
  void upMitraKoran(id, koran) async {
    final body = {
      "koran": koran,
      "updated_at": DateTime.now().toString(),
    };

    final response = await http.patch(
      Uri.parse(baseurl + '/koran/$id'),
      body: body,
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/x-www-form-urlencoded"
      },
    );
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }

  void delMitraKoran(id) async {
    final response = await http.delete(
      Uri.parse(baseurl + '/koran/$id'),
    );
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }

  void addMitraKoran(namaMKoran) async {
    final body = {
      "koran": namaMKoran,
    };

    final response = await http.post(
      Uri.parse(baseurl + '/koran'),
      body: body,
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/x-www-form-urlencoded"
      },
    );
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }
}
