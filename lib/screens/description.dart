import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class descriptionPage extends StatelessWidget {
  final name, stars, overview, posterurl, bannerurl, releasedate, status, originalLang, adult;
  const descriptionPage({Key? key, this.name, this.stars, this.overview, this.posterurl, this.releasedate, this.bannerurl, this.status, this.originalLang, this.adult}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1b1f20),
      body: ListView(
        children: [
          Container(
            width: 250,
            child: Image.network(bannerurl),
          ),
          //SizedBox(height: 5,),
          Container(
            height: 120,
            width: 120,
            padding: EdgeInsets.only(top: 15, left: 10, bottom: 10),
            child: Row(
              children: [
                Image.network(posterurl),
                SizedBox(width: 10,),
                //Text(name, style: GoogleFonts.inter(fontWeight: FontWeight.bold, color: Colors.white),),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(name, style: GoogleFonts.inter(fontWeight: FontWeight.w600, color: Colors.white, fontSize: 14),),
                      SizedBox(height: 5,),
                      Text('Stars ★ :  '+stars+'/10',
                        style: GoogleFonts.inter(fontWeight: FontWeight.normal, color: Colors.white, fontSize: 10),),
                    ],
                  ),
                ),

              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(5),
            width: 250,
            child: Text(overview,
              style: GoogleFonts.inter(fontWeight: FontWeight.normal, color: Colors.white)
            ),
          ),
          SizedBox(height: 5,),
        ],
      )
    );
  }
}
