import 'dart:core';
import 'package:flutter/material.dart';
import 'package:movies/reusable_widgets/text.dart';
import 'package:movies/screens/description.dart';

class trendingMovies extends StatelessWidget {

  final List trending;

  const trendingMovies({Key? key, required this.trending}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          myText(text: "Trending", size: 15.0, color: Colors.white),
          SizedBox(height: 7,),
          Container(
            height: 250,
            child: ListView.builder(itemCount: trending.length, scrollDirection: Axis.horizontal, itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute
                    (builder: (context)=>descriptionPage(
                    name: trending[index]['title'],
                    bannerurl: trending[index]['backdrop_path']!=null?
                    'https://image.tmdb.org/t/p/w500'+trending[index]['backdrop_path']:
                    'https://via.placeholder.com/150',
                    stars: trending[index]['vote_average'].toString(),
                    overview: trending[index]['overview'],
                    posterurl: 'https://image.tmdb.org/t/p/w500'+trending[index]['poster_path'],
                    releasedate: trending[index]['release_date'],
                    status: trending[index]['status'] ?? 'Null',
                    originalLang: trending[index]['original_language'],
                    adult: trending[index]['adult'].toString(),
                  )));
                },
                child: Container(
                  width: 140,
                  child: Column(
                    children: [
                      Container(
                        height: 200,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage('https://image.tmdb.org/t/p/w500'+trending[index]['poster_path'])
                          )
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(5),
                        child: myText(text: trending[index]['title']!=null?
                          trending[index]['title']: 'loading', color: Colors.white, size: 9,),
                      )
                    ],
                  ),
                ),
              );
            },),
          ),
        ],
      ),
    );
  }
}
