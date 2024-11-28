import 'package:flutter/material.dart';
import 'movie_model.dart';

class SearchList extends StatefulWidget {
  final MovieModel movie;

  SearchList({super.key, required this.movie});

  @override
  State<SearchList> createState() => _SearchListState();
}

class _SearchListState extends State<SearchList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 700,
      width: MediaQuery.of(context).size.width,
      child: Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Stack(
              children: [
                Positioned(
                  top: 100,
                  child:  Card(
                    child: Container(
                      height: 150,
                      width: MediaQuery.of(context).size.width * 0.97,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(22.5),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(200, 16, 16, 16),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                widget.movie.title,
                                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold,fontFamily: 'Montserrat'),
                              ),

                              Text("${widget.movie.year}",style: const TextStyle(color: Colors.black54,fontFamily: 'Montserrat')),
                              const SizedBox(height: 5,),
                              Container(
                                  margin: EdgeInsets.all(5),
                                  padding: EdgeInsets.only(left: 6,top: 1),
                                  height: 25,
                                  width: 80,
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all()
                                  ),
                                  child: Text("${widget.movie.rank} IMDB",style: const TextStyle(color: Colors.white,fontFamily: 'Montserrat'),)),

                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 15),
                  width: 185,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(22.5),
                    child: Image.network(
                      widget.movie.imgUrl, // Use the correct property for the image
                      fit: BoxFit.cover,
                      height: 248,
                      width: 180,
                    ),
                  ),
                ),
              ],
            ),
          )
    );
  }
}