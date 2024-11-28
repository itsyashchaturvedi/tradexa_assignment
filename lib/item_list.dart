import 'package:flutter/material.dart';
import 'package:tradexa_assignment/movie_list_model.dart';
import 'package:tradexa_assignment/movie_model.dart';

class ItemList extends StatefulWidget {
  final List<MovieListModel> model;

  ItemList({super.key, required this.model});

  @override
  State<ItemList> createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 700,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        itemCount: widget.model.length,
        itemBuilder: (context, index) {
          final movie = widget.model[index];

          return Container(
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
                                    movie.title,
                                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold,fontFamily: 'Montserrat'),
                                  ),
                      
                                  Text("${movie.year}",style: const TextStyle(color: Colors.black54,fontFamily: 'Montserrat')),
                                  const SizedBox(height: 5,),
                                  Container(
                                    margin: EdgeInsets.all(5),
                                    padding: EdgeInsets.only(left: 6,top: 1),
                                    height: 25,
                                      width: 80,
                                      decoration: BoxDecoration(
                                        color: double.parse(movie.rating)>=7.5? Colors.green:Colors.blue,
                                        borderRadius: BorderRadius.circular(12),
                                        border: Border.all()
                                      ),
                                      child: Text("${movie.rating} IMDB",style: const TextStyle(color: Colors.white,fontFamily: 'Montserrat'),)),
                      
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
                      movie.bigImage, // Use the correct property for the image
                      fit: BoxFit.cover,
                      height: 248,
                      width: 180,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}