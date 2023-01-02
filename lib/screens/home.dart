import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:movies/reusable_widgets/tvShows.dart';
import 'package:movies/reusable_widgets/topRated.dart';
import 'package:movies/reusable_widgets/trending.dart';
import 'package:movies/main.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List trendingmovies = [];
  List topRatedmovies = [];
  List tvShows = [];
  final String apiKey = '00d98deb7c1552f28a38d0f22f634e75';
  final readAccessToken = 'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwMGQ5OGRlYjdjMTU1MmYyOGEzOGQwZjIyZjYzNGU3NSIsInN1YiI6IjYzYWJmNzBiMWY3NDhiMDBjOGI2YWNjMiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.6CkbscChb4sZ6rPxUKvi0HdehHASpsgjtrXRrIBhidA';

  @override
  void initState() {
    loadMovies();
    super.initState();
  }

  loadMovies() async {

    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apiKey, readAccessToken),
    logConfig: const ConfigLogger(
      showLogs: true,
      showErrorLogs: true,
    ));
    Map trendingResults = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topRatedResults = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvshows = await tmdbWithCustomLogs.v3.tv.getPopular();
    setState(() {
      trendingmovies = trendingResults['results'];
      topRatedmovies = topRatedResults['results'];
      tvShows = tvshows['results'];
    });
    print(trendingmovies);
    print(topRatedResults);
    print(tvShows);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1b1f20),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: const Text(
          "Home", style: TextStyle(color: Colors.white, fontFamily: 'inter'),
        ),
        actions: <Widget>[
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll<Color>(Color(0xFF2b1f20)),
            ),
            onPressed: () {
              FirebaseAuth.instance.signOut().then((value) {
              Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));
              });
            },
            child: Text("Sign Out", style: GoogleFonts.inter(color: Colors.white, fontWeight: FontWeight.bold),),

            //shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
          ),
        ],

      ),
      body: ListView(
        // child: ElevatedButton(
        //   onPressed: () {
        //     FirebaseAuth.instance.signOut().then((value) {
        //       Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()));
        //     });
        //   },
        //   child: const Text("Sign Out"),
        //
        // ),
        children: [
          tv(shows: tvShows),
          trendingMovies(trending:trendingmovies),
          topRated(top: topRatedmovies),
        ],
      )
    );
  }
}

