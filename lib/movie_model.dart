class MovieModel
{
  late final String imgUrl;
  late final String title;
  late final String rank;
  late final String s;
  late final String year;
  MovieModel({
   required this.imgUrl,
    required this.title,
    required this.year,
    required this.rank,
    required this.s
});
  MovieModel.fromJson(Map<String,dynamic> data){
    imgUrl=data['i']['imageUrl'].toString();
    title=data['l'].toString();
    rank=data['rank'].toString();
    s=data['s'].toString();
    year=data['y'].toString();
  }
}