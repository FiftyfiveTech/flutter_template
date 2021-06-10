class Picture {
  Data? data;

  Picture({required this.data});

  Picture.fromJson(Map<dynamic, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data != null ? this.data!.toJson() : null;
    }
    return data;
  }
}

class Data {
  late String url;

  Data({required this.url});

  Data.fromJson(Map<dynamic, dynamic> json) {
    url = json['url'];
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = new Map<dynamic, dynamic>();
    data['url'] = this.url;
    return data;
  }
}
