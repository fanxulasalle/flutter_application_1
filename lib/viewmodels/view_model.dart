import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/anime.dart';
import 'package:flutter_application_1/services/anime_service.dart';


class ViewModel extends ChangeNotifier {
  List<Anime>? animes;

  Future<void> loadAnimes() async {
    try {
      animes = await AnimeService.getTopAnimes();
    } catch (ae) {
      print(ae);
    }
  }

    Future<void> searchAnime(String value) async {
    try {
      if(value.isEmpty){
        await loadAnimes();
        return;
      }
      animes = await AnimeService.searchAnime({'q': value});
      notifyListeners();
    } catch (ae) {
      print(ae);
    }
  }
  
}