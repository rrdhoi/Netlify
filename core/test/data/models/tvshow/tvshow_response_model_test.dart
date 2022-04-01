import 'dart:convert';

import 'package:core/core.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../json_reader.dart';

void main() {
  final tTvShowModel = TvShowModel(
    backdropPath: '/hI5h8o3bbZlZwnySEs6rL7pXH32.jpg',
    genreIds: [18, 80],
    id: 60574,
    name: 'Peaky Blinders',
    originalName: 'Peaky Blinders',
    overview:
        'A gangster family epic set in 1919 Birmingham, England and centered on a gang who sew razor blades in the peaks of their caps, and their fierce boss Tommy Shelby, who means to move up in the world.',
    popularity: 1693.821,
    posterPath: '/vUUqzWa2LnHIVqkaKVlVGkVcZIW.jpg',
    originalLanguage: 'en',
    originCountry: ['GB'],
    voteAverage: 8.6,
    voteCount: 5666,
  );

  final tTvShowResponseModel = TvShowResponse(tvShowList: [tTvShowModel]);

  group('fromJson', () {
    test('should return a valid model from JSON', () async {
      //arrange
      final Map<String, dynamic> jsonMap =
          json.decode(readJson('dummy_data/tvshow_on_the_air.json'));
      //act
      final result = TvShowResponse.fromJson(jsonMap);
      //assert
      expect(result, tTvShowResponseModel);
    });
  });

  group('toJson', () {
    test('should return a JSON map containing proper data', () async {
      // arrange

      // act
      final result = tTvShowResponseModel.toJson();
      // assert
      final expectedJsonMap = {
        "results": [
          {
            "backdrop_path": "/hI5h8o3bbZlZwnySEs6rL7pXH32.jpg",
            "genre_ids": [18, 80],
            "id": 60574,
            "name": "Peaky Blinders",
            "origin_country": ["GB"],
            "original_language": "en",
            "original_name": "Peaky Blinders",
            "overview":
                "A gangster family epic set in 1919 Birmingham, England and centered on a gang who sew razor blades in the peaks of their caps, and their fierce boss Tommy Shelby, who means to move up in the world.",
            "popularity": 1693.821,
            "poster_path": "/vUUqzWa2LnHIVqkaKVlVGkVcZIW.jpg",
            "vote_average": 8.6,
            "vote_count": 5666
          }
        ],
      };
      expect(result, expectedJsonMap);
    });
  });
}
