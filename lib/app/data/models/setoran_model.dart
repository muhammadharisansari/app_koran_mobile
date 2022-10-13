class Setoran {
  String? id;
  String? namaKoran;
  String? bulan;
  String? tanggal;
  String? jumlah;
  String? createdAt;
  String? updatedAt;

  Setoran(
      {this.id,
      this.namaKoran,
      this.bulan,
      this.tanggal,
      this.jumlah,
      this.createdAt,
      this.updatedAt});

  Setoran.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    namaKoran = json['nama_koran'];
    bulan = json['bulan'];
    tanggal = json['tanggal'];
    jumlah = json['jumlah'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['nama_koran'] = namaKoran;
    data['bulan'] = bulan;
    data['tanggal'] = tanggal;
    data['jumlah'] = jumlah;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }

  //modifikasi untuk getAllSetoran di file setoran_provider
  static List<Setoran> fromJsonList(List? data) {
    if (data == null || data.length == 0) return [];
    return data.map((e) => Setoran.fromJson(e)).toList();
  }
}
