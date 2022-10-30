import 'package:app_koran/app/data/models/userf_model.dart';
import 'package:get/get.dart';

import '../models/koran_model.dart';
import '../models/setoran_model.dart';

class SetoranProvider extends GetConnect {
  //untuk restful API online
  // final baseurl = 'http://localhost/api_koran/public';

  //untuk restful API localhost emulator (192.168.100.5 adalah IPV4)
  // final baseurl = 'http://192.168.100.5/api_koran/public';

  //untuk restful API localhost real device/emulator (nyalakan dengan gitbase)
  final baseurl = 'http://192.168.100.5:8080';

  Future<List<Setoran>> getAllSetoran() async {
    final response = await get(baseurl + '/setoran');
    // print(response.statusCode);
    // print(response.body["massages"]);
    return Setoran.fromJsonList(response.body["data"]);
  }

  Future<Setoran?> getKoran(id) async {
    final response = await get(baseurl + '/setoran/$id');
    print(response.statusCode);
    print(response.body["data"]);
    return Setoran.fromJson(response.body["data"]);
  }

  Future<List<Userf>> getUser(email) async {
    final response = await get(baseurl + '/user/$email');
    print(response.statusCode);
    print(response.body["data"]);
    // return Userf.fromJson(response.body['data']);
    return (response.body['data'] as List)
        .map((e) => Userf.fromJson(e))
        .toList();
  }

  Future<List<Koran>> getAllKoran() async {
    final response = await get(baseurl + '/koran');
    // print(response.statusCode);
    // print(response.body["data"]);
    return Koran.fromJsonList(response.body["data"]);
  }
}
