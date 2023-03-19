class WebtoonDetailModel {
  final String thumb, about, genre, age;

  WebtoonDetailModel.fromJson(Map<String, dynamic> json)
      : thumb = json['thumb'],
        about = json['about'],
        genre = json['genre'],
        age = json['age'];
}
