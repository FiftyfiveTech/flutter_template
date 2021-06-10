class UserProfile {
  String? name;
  String? email;
  String? picture;

  UserProfile({required this.name, required this.email, required this.picture});

  UserProfile.fromJson(Map<dynamic, dynamic> json) {
    name = json['name'];
    picture = json['picture'];
    email = json['email'];
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = new Map<dynamic, dynamic>();
    data['name'] = this.name;
    data['picture'] = this.picture;
    data['email'] = this.email;
    return data;
  }
}
