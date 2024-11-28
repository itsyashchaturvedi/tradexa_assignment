class MovieListModel {
  final String title;
  final String bigImage;
  final String rating;
  final int year;

  MovieListModel({
    required this.title,
    required this.bigImage,
    required this.rating,
    required this.year,
  });

  factory MovieListModel.fromJson(Map<String, dynamic> json) {
    return MovieListModel(
      title: json['title'],
      bigImage: json['big_image'],
      rating: json['rating'],
      year: json['year'],
    );
  }
}