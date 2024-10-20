import 'dart:io';

import 'package:anime_world_tutorial/api/get_anime_by_ranking_type_api.dart';
import 'package:anime_world_tutorial/api/get_anime_by_search_api.dart';
import 'package:anime_world_tutorial/api/get_seasonal_animes_api.dart';
import 'package:anime_world_tutorial/api/get_top_anime_for_category_api.dart';
import 'package:anime_world_tutorial/models/anime.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Api integration Whitebox Tests', () {
    test('Testing the anime fetching by rank works', () async {
      Iterable<Anime> testAnime =
          await getAnimeByRankingTypeApi(rankingType: "all", limit: 5);
      expect(testAnime.first.node.id, isNotNull);
    });

    test('Testing the anime fetching by rank works', () async {
      Iterable<Anime> testAnime = await getSeasonalAnimesApi(limit: 5);
      expect(testAnime.first.node.id, isNotNull);
    });

    test('Testing the anime fetching by rank works', () async {
      Iterable<Anime> testAnime = await getAnimesbySearchApi(query: "Naruto");
      expect(testAnime.first.node.title, contains("Naruto"));
    });
  });
}
