class Koran {
  String? idKoran;
  String? koran;
  String? createdAt;
  String? updatedAt;

  Koran({this.idKoran, this.koran, this.createdAt, this.updatedAt});

  Koran.fromJson(Map<String, dynamic> json) {
    idKoran = json['id_koran'];
    koran = json['koran'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id_koran'] = idKoran;
    data['koran'] = koran;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }

  //modifikasi untuk getAllKoran di file setoran_provider
  static List<Koran> fromJsonList(List? data) {
    if (data == null || data.length == 0) return [];
    return data.map((e) => Koran.fromJson(e)).toList();
  }
}
