import 'package:flutter/material.dart';
import 'package:tradexa_assignment/item_list.dart';
import 'package:tradexa_assignment/search_list.dart';
import 'package:tradexa_assignment/movie_model.dart';
import 'package:tradexa_assignment/movie_provider.dart';

import 'movie_list_model.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<MovieModel> searches;
  late Future<List<MovieListModel>> listModel;
  late bool isTrue;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isTrue=false;
    listModel=MovieProvider.getMovie();
  }
  @override
  Widget build(BuildContext context) {

    return  Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text("Home",style: TextStyle(fontFamily: 'Montserrat',fontWeight: FontWeight.bold),),
      ),
      body:SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5,horizontal: 12),
              child: TextField(
                onChanged: (val) async{
                 setState(() {
                   isTrue=!isTrue;
                   searches=MovieProvider.getSearch(val.toString());
                 });
                },
                decoration: const InputDecoration(
                  suffixIcon: Icon(Icons.search,color: Colors.black87,),
                  hintText: "Search",
                  hintStyle: TextStyle(fontFamily: 'Montserrat',fontWeight: FontWeight.w200),
                  border: OutlineInputBorder(borderSide: BorderSide(
                    color: Colors.black87
                  )
                ),
              ),
            )
            ),
        
        
                     isTrue?
                     FutureBuilder(
                         future: searches,
                         builder: (context,snapshots) {
                           if (snapshots.connectionState == ConnectionState.waiting && snapshots.data==null) {
                             return const Center(child: CircularProgressIndicator(),);
                           }
                           else {
                             final movie=snapshots.data;
                             return SearchList(movie: movie!);
                           }
                         })
                         :FutureBuilder(
                  future: listModel,
                  builder: (context,snapshots) {
                    if (snapshots.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator(),);
                    }
                    else {
                      final movie=snapshots.data;
                      return ItemList(model: movie!);
                    }
                  })
        
          ],
        ),
      ),
    );
  }
}
