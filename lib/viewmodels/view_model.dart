import 'package:flutter_application_1/models/anime.dart';
import 'package:flutter_application_1/services/anime_service.dart';
import 'package:flutter/material.dart';



class ViewModel extends ChangeNotifier {
  List<Anime>? animes;
  bool isLoaded = false;
  Future<void> loadAnimes() async {
    try {
      if(!isLoaded) {
        animes = await AnimeService.getTopAnimes();
        isLoaded = true;
        notifyListeners();
      }

    } catch (ae) {
      print(ae);
    }
  }

  Future<void> searchAnime(String value) async {
    try {
      if(value.isEmpty){
        animes = await AnimeService.getTopAnimes();
      }else{
        animes = await AnimeService.searchAnime({'q': value});
      }
      notifyListeners();
    } catch (ae) {
      print(ae);
    }
  }

}