import 'package:flutter_application_1/models/anime.dart';
import 'package:flutter_application_1/services/api_router.dart';

class AnimeService {
  static const baseUrl = 'https://api.jikan.moe/v4';

  static Future<List<Anime>> getTopAnimes()async {
      Uri url = Uri.parse('$baseUrl/top/anime');
      try {
        Map<String,dynamic>? response = await ApiRouter.get(url: url);
        if(response == null) {
          return [];
        }

        return Anime.fromList(response['data']);
      } catch (ae) {
        rethrow;
      }
  }
  static Future<List<Anime>> getTopMangas()async {
    Uri url = Uri.parse('$baseUrl/top/manga');
    try {
      Map<String,dynamic>? response = await ApiRouter.get(url: url);
      if(response == null) {
        return [];
      }
      return Anime.fromList(response['data']);
    } catch (ae) {
      rethrow;
    }
  }
  static Future<List<Anime>> searchAnime(Map<String,dynamic> parameters)async {
    Uri url = Uri.parse('$baseUrl/anime');
    try {
      Map<String,dynamic>? response = await ApiRouter.get(url: url,parameters: parameters);
      if(response == null) {
        return [];
      }
      return Anime.fromList(response['data']);
    } catch (ae) {
      rethrow;
    }
  }
}