import 'package:flutter/material.dart';
import 'package:movies/reusable_widgets/text.dart';

import '../screens/description.dart';

class topRated extends StatelessWidget {

  final List top;
  const topRated({Key? key, required this.top}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          myText(text: "Top Rated", size: 15.0, color: Colors.white),
          SizedBox(height: 7,),
          Container(
            height: 270,
            child: ListView.builder(itemCount: top.length, scrollDirection: Axis.horizontal, itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> descriptionPage(
                    name: top[index]['title'],
                    bannerurl: top[index]['backdrop_path']!=null?
                    'https://image.tmdb.org/t/p/w500'+top[index]['backdrop_path']: 'https://via.placeholder.com/150',
                    stars: top[index]['vote_average'].toString(),
                    overview: top[index]['overview'],
                    posterurl: 'https://image.tmdb.org/t/p/w500'+top[index]['poster_path'],
                    releasedate: top[index]['release_date'],
                    adult: top[index]['adult'].toString(),
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
                                image: NetworkImage('https://image.tmdb.org/t/p/w500'+top[index]['poster_path'])
                            )
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(5),
                        child: myText(text: top[index]['title']!=null?
                        top[index]['title']: 'loading', color: Colors.white, size: 9,),
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
