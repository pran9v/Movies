import 'package:flutter/material.dart';
import 'package:movies/reusable_widgets/text.dart';
import 'package:movies/screens/description.dart';

class tv extends StatelessWidget {
  final List shows;

  const tv({Key? key, required this.shows}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15, right: 10, top: 10, bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          myText(text: "TV Shows", size: 15.0, color: Colors.white),
          SizedBox(height: 3,),
          Container(
            height: 182,
            child: ListView.builder(itemCount: shows.length, scrollDirection: Axis.horizontal, itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> descriptionPage(
                    name: shows[index]['original_name'],
                    bannerurl: shows[index]['backdrop_path']!=null?
                    'https://image.tmdb.org/t/p/w500'+shows[index]['backdrop_path']: 'https://via.placeholder.com/150',
                    stars: shows[index]['vote_average'].toString(),
                    overview: shows[index]['overview'],
                    posterurl: 'https://image.tmdb.org/t/p/w500'+shows[index]['poster_path'],
                    releasedate: shows[index]['first_air_date'],
                  )));
                },
                child: Container(
                  width: 250,
                  padding: EdgeInsets.all(5),
                  child: Column(
                    children: [
                      Container(
                        width: 250,
                        height: 140,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: NetworkImage(shows[index]['backdrop_path']!=null?
                                'https://image.tmdb.org/t/p/w500'+shows[index]['backdrop_path']:
                                'https://via.placeholder.com/150'),
                              fit: BoxFit.cover
                            )
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(5),
                        child: myText(text: shows[index]['original_name']!=null?
                        shows[index]['original_name']: 'loading', color: Colors.white, size: 9,),
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
