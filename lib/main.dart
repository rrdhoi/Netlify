import 'package:about/about.dart';
import 'package:core/core.dart';
import 'package:core/utils/http_ssl_pinning.dart';
import 'package:core/utils/routes.dart';
import 'package:ditonton/injection.dart' as di;
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:search/search.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HttpSSLPinning.init();
  await Firebase.initializeApp();
  di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(
          create: (_) => di.locator<DetailMovieBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<TopRatedMoviesBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<PopularMoviesBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<WatchlistMoviesBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<DetailWatchlistMovieBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<NowPlayingBloc>(),
        ),
        //TV Show
        BlocProvider(
          create: (_) => di.locator<SearchTvShowBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<OnTheAirTvShowBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<DetailTvShowBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<TopRatedTvShowBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<DetailWatchlistBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<WatchlistTvShowBloc>(),
        ),
        BlocProvider(create: (_) => di.locator<PopularTvShowBloc>()),
        BlocProvider(
          create: (_) => di.locator<SearchBloc>(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.dark().copyWith(
          colorScheme: kColorScheme,
          primaryColor: kRichBlack,
          scaffoldBackgroundColor: kRichBlack,
          textTheme: kTextTheme,
        ),
        home: HomePage(),
        navigatorObservers: [routeObserver],
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case HomePage.ROUTE_NAME:
              return MaterialPageRoute(builder: (_) => HomePage());
            case PopularMoviesPage.ROUTE_NAME:
              return CupertinoPageRoute(builder: (_) => PopularMoviesPage());
            case TopRatedMoviesPage.ROUTE_NAME:
              return CupertinoPageRoute(builder: (_) => TopRatedMoviesPage());
            case MovieDetailPage.ROUTE_NAME:
              final id = settings.arguments as int;
              return MaterialPageRoute(
                builder: (_) => MovieDetailPage(id: id),
                settings: settings,
              );
            case SearchPage.ROUTE_NAME:
              return MaterialPageRoute(builder: (_) => SearchPage());
            case WatchlistPage.ROUTE_NAME:
              return MaterialPageRoute(builder: (_) => WatchlistPage());
            // TV Show
            case TVSHOW_LIST_ROUTE:
              return MaterialPageRoute(builder: (_) => TvShowPage());
            case OnTheAirTvShowsPage.ROUTE_NAME:
              return MaterialPageRoute(builder: (_) => OnTheAirTvShowsPage());
            case PopularTvShowsPage.ROUTE_NAME:
              return MaterialPageRoute(builder: (_) => PopularTvShowsPage());
            case TVSHOW_SEARCH_ROUTE:
              return MaterialPageRoute(builder: (_) => SearchTvShowPage());
            case TopRatedTvShowsPage.ROUTE_NAME:
              return MaterialPageRoute(builder: (_) => TopRatedTvShowsPage());
            case TvShowDetailPage.ROUTE_NAME:
              final id = settings.arguments as int;
              return MaterialPageRoute(
                builder: (_) => TvShowDetailPage(id: id),
                settings: settings,
              );
            case AboutPage.ROUTE_NAME:
              return MaterialPageRoute(builder: (_) => AboutPage());
            default:
              return MaterialPageRoute(builder: (_) {
                return Scaffold(
                  body: Center(
                    child: Text('Page not found :('),
                  ),
                );
              });
          }
        },
      ),
    );
  }
}
