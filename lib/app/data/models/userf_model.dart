class Userf {
  String? id;
  String? email;
  String? verify;
  String? createdAt;

  Userf({this.id, this.email, this.verify, this.createdAt});

  Userf.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    verify = json['verify'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['email'] = email;
    data['verify'] = verify;
    data['created_at'] = createdAt;
    return data;
  }
}
