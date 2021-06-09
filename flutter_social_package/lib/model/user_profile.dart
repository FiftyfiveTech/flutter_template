class UserProfile {
  late String id;
  String? name;
  String? email;
  String? picture;

  UserProfile({required this.id, this.name, this.email, this.picture});

  UserProfile.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    picture = json['picture'];
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = new Map<dynamic, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    data['picture'] = this.picture;
    return data;
  }
}
