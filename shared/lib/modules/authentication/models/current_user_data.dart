class CurrentUserData {
  late Data data;
  late Ad ad;

  CurrentUserData({required this.data, required this.ad});

  CurrentUserData.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : Data();
    ad = json['ad'] != null ? new Ad.fromJson(json['ad']) : Ad();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    if (this.ad != null) {
      data['ad'] = this.ad.toJson();
    }
    return data;
  }
}

class Data {
  late int id;
  late String email;
  late String firstName;
  late String lastName;
  late String avatar;

  Data(
      {this.id = 0,
      this.email = '',
      this.firstName = '',
      this.lastName = '',
      this.avatar = ''});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['avatar'] = this.avatar;
    return data;
  }
}

class Ad {
  late String company;
  late String url;
  late String text;

  Ad({this.company = '', this.url = '', this.text = ''});

  Ad.fromJson(Map<String, dynamic> json) {
    company = json['company'];
    url = json['url'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['company'] = this.company;
    data['url'] = this.url;
    data['text'] = this.text;
    return data;
  }
}
