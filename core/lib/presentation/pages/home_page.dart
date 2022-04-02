import 'package:core/presentation/pages/tvshow_page.dart';
import 'package:core/utils/routes.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';

import 'movies_page.dart';

class HomePage extends StatefulWidget {
  static const ROUTE_NAME = '/home-movie-page';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isMovie = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/circle-g.png'),
              ),
              accountName: Text('Ditonton'),
              accountEmail: Text('ditonton@dicoding.com'),
            ),
            ListTile(
              key: ValueKey('Movies'),
              leading: Icon(Icons.movie),
              title: Text('Movies'),
              onTap: () {
                if (!isMovie) {
                  setState(() {
                    isMovie = true;
                    Navigator.pop(context);
                  });
                } else
                  Navigator.pop(context);
              },
            ),
            ListTile(
              key: ValueKey('TV Show'),
              leading: Icon(Icons.live_tv),
              title: Text('TV Show'),
              onTap: () {
                if (isMovie)
                  setState(() {
                    isMovie = false;
                    Navigator.pop(context);
                  });
                else
                  Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.save_alt),
              title: Text('Watchlist'),
              onTap: () {
                Navigator.pushNamed(context, WATCHLIST_ROUTE);
              },
            ),
            ListTile(
              onTap: () {
                // Navigator.pushNamed(context, ABOUT_ROUTE);
                FirebaseCrashlytics.instance.crash();
              },
              leading: Icon(Icons.info_outline),
              title: Text('About'),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: isMovie ? Text('Movies') : Text('TV Shows'),
        actions: [
          isMovie
              ? IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, SEARCH_ROUTE);
                  },
                  icon: Icon(Icons.search),
                )
              : IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, TVSHOW_SEARCH_ROUTE);
                  },
                  icon: Icon(Icons.search),
                )
        ],
      ),
      body: isMovie
          ? MoviesPage(
              key: ValueKey('MoviesPage'),
            )
          : TvShowPage(
              key: ValueKey('TvShowPage'),
            ),
    );
  }
}
