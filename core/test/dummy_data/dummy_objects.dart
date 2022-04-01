import 'package:core/core.dart';
import 'package:core/domain/entities/tvshow/season.dart';

final testMovie = Movie(
  adult: false,
  backdropPath: '/muth4OYamXf41G2evdrLEg8d3om.jpg',
  genreIds: [14, 28],
  id: 557,
  originalTitle: 'Spider-Man',
  overview:
      'After being bitten by a genetically altered spider, nerdy high school student Peter Parker is endowed with amazing powers to become the Amazing superhero known as Spider-Man.',
  popularity: 60.441,
  posterPath: '/rweIrveL43TaxUN0akQEaAXL6x0.jpg',
  releaseDate: '2002-05-01',
  title: 'Spider-Man',
  video: false,
  voteAverage: 7.2,
  voteCount: 13507,
);

final testTvShow = TvShow(
    backdropPath: 'backdropPath',
    genreIds: [1, 2],
    id: 1,
    name: 'name',
    originalName: 'originalName',
    overview: 'overview',
    popularity: 7.8,
    posterPath: 'posterPath',
    voteAverage: 7.8,
    voteCount: 7);

final testTvShowList = [testTvShow];

final testMovieList = [testMovie];

final testMovieDetail = MovieDetail(
  adult: false,
  backdropPath: 'backdropPath',
  genres: [Genre(id: 1, name: 'Action')],
  id: 1,
  originalTitle: 'originalTitle',
  overview: 'overview',
  posterPath: 'posterPath',
  releaseDate: 'releaseDate',
  runtime: 120,
  title: 'title',
  voteAverage: 1,
  voteCount: 1,
);

final testTvShowDetail = TvShowDetail(
  adult: false,
  backdropPath: 'backdropPath',
  genres: [Genre(id: 1, name: 'name')],
  lastEpisode: LastEpisodeToAir(
      id: 1,
      name: 'name',
      airDate: DateTime(1),
      episodeNumber: 12,
      seasonNumber: 12,
      stillPath: 'stillPath'),
  seasons: [
    Season(
        id: 1,
        name: 'name',
        episodeCount: 12,
        posterPath: 'posterPath',
        seasonNumber: 12)
  ],
  id: 1,
  originalName: 'originalName',
  overview: 'overview',
  posterPath: 'posterPath',
  status: 'status',
  name: 'name',
  voteAverage: 12.0,
  voteCount: 12,
);

final testLastEpisode = LastEpisodeToAirModel(
    airDate: DateTime(1),
    episodeNumber: 12,
    id: 1,
    name: 'name',
    overview: 'overview',
    productionCode: 'productionCode',
    seasonNumber: 12,
    stillPath: 'stillPath',
    voteAverage: 12.0,
    voteCount: 12);

final testSeason = SeasonModel(
    episodeCount: 12,
    id: 1,
    name: 'name',
    overview: 'overview',
    posterPath: 'posterPath',
    seasonNumber: 12);

final testTvDetailResponse = TvShowDetailResponse(
    adult: false,
    backdropPath: 'backdropPath',
    createdBy: [],
    episodeRunTime: [],
    firstAirDate: DateTime(1),
    lastEpisodeToAir: testLastEpisode,
    genres: [GenreModel(id: 1, name: 'name')],
    homepage: '',
    id: 1,
    inProduction: true,
    languages: [""],
    lastAirDate: DateTime(1),
    name: 'name',
    nextEpisodeToAir: '',
    numberOfEpisodes: 12,
    numberOfSeasons: 12,
    originCountry: ['originCountry'],
    originalLanguage: 'originalLanguage',
    originalName: 'originalName',
    overview: 'overview',
    popularity: 12.0,
    posterPath: 'posterPath',
    status: 'status',
    tagline: 'tagline',
    type: 'type',
    voteAverage: 12.0,
    voteCount: 12,
    seasons: [testSeason]);

final testWatchlistMovie = Movie.watchlist(
  id: 1,
  title: 'title',
  posterPath: 'posterPath',
  overview: 'overview',
);

final testWatchlistTvShow = TvShow.watchlist(
  id: 1,
  overview: 'overview',
  posterPath: 'posterPath',
  name: 'name',
);

final testMovieTable = MovieTable(
  id: 1,
  title: 'title',
  posterPath: 'posterPath',
  overview: 'overview',
);

final testTvShowTable = TvShowTable(
  id: 1,
  name: 'name',
  overview: 'overview',
  posterPath: 'posterPath',
);

final testMovieMap = {
  'id': 1,
  'overview': 'overview',
  'posterPath': 'posterPath',
  'title': 'title',
};

final testTvShowMap = {
  'id': 1,
  'name': 'name',
  'overview': 'overview',
  'posterPath': 'posterPath'
};
