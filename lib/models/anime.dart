class Anime {
  final Map<String, dynamic> _images;
  final Map<String, dynamic> _trailer;
  final bool _approved;
  final List<dynamic> _titles;
  final String _title;
  final String _titleEnglish;
  final String _titleJapanese;
  final List<dynamic> _titleSynonyms;
  final String _type;
  final String _source;
  final int _episodes;
  final String _status;
  final bool _airing;
  final Map<String, dynamic> _aired;
  final String _duration;
  final String _rating;
  final double _score;
  final int _scoredBy;
  final int _rank;
  final int _popularity;
  final int _members;
  final int _favorites;
  final String _synopsis;
  final String _background;
  final String _season;
  final int _year;
  final Map<String, dynamic> _broadcast;
  final List<dynamic> _producers;
  final List<dynamic> _licensors;
  final List<dynamic> _studios;
  final List<dynamic> _genres;
  final List<dynamic> _explicitGenres;
  final List<dynamic> _themes;
  final List<dynamic> _demographics;
  final List<dynamic> _relations;
  final Map<String, dynamic> _theme;
  final List<dynamic> _external;
  final List<dynamic> _streaming;

  const Anime({
    required Map<String, dynamic> images,
    required Map<String, dynamic> trailer,
    required bool approved,
    required List<dynamic> titles,
    required String title,
    required String titleEnglish,
    required String titleJapanese,
    required List<dynamic> titleSynonyms,
    required String type,
    required String source,
    required int episodes,
    required String status,
    required bool airing,
    required Map<String, dynamic> aired,
    required String duration,
    required String rating,
    required double score,
    required int scoredBy,
    required int rank,
    required int popularity,
    required int members,
    required int favorites,
    required String synopsis,
    required String background,
    required String season,
    required int year,
    required Map<String, dynamic> broadcast,
    required List<dynamic> producers,
    required List<dynamic> licensors,
    required List<dynamic> studios,
    required List<dynamic> genres,
    required List<dynamic> explicitGenres,
    required List<dynamic> themes,
    required List<dynamic> demographics,
    required List<dynamic> relations,
    required Map<String, dynamic> theme,
    required List<dynamic> external,
    required List<dynamic> streaming,
  })  : _images = images,
        _trailer = trailer,
        _approved = approved,
        _titles = titles,
        _title = title,
        _titleEnglish = titleEnglish,
        _titleJapanese = titleJapanese,
        _titleSynonyms = titleSynonyms,
        _type = type,
        _source = source,
        _episodes = episodes,
        _status = status,
        _airing = airing,
        _aired = aired,
        _duration = duration,
        _rating = rating,
        _score = score,
        _scoredBy = scoredBy,
        _rank = rank,
        _popularity = popularity,
        _members = members,
        _favorites = favorites,
        _synopsis = synopsis,
        _background = background,
        _season = season,
        _year = year,
        _broadcast = broadcast,
        _producers = producers,
        _licensors = licensors,
        _studios = studios,
        _genres = genres,
        _explicitGenres = explicitGenres,
        _themes = themes,
        _demographics = demographics,
        _relations = relations,
        _theme = theme,
        _external = external,
        _streaming = streaming;

  factory Anime.fromJson(Map<String, dynamic> json) {

    return Anime(
      images: json['images'] ?? {},
      trailer: json['trailer'] ?? {},
      approved: json['approved'] ?? false,
      titles: json['titles'] ?? [],
      title: json['title'] ?? '',
      titleEnglish: json['title_english'] ?? '',
      titleJapanese: json['title_japanese'] ?? '',
      titleSynonyms: json['title_synonyms'] ?? [],
      type: json['type'] ?? '',
      source: json['source'] ?? '',
      episodes: json['episodes'] ?? 0,
      status: json['status'] ?? '',
      airing: json['airing'] ?? false,
      aired: json['aired'] ?? {},
      duration: json['duration'] ?? '',
      rating: json['rating'] ?? '',
      score: (json['score'] ?? 0).toDouble(),
      scoredBy: json['scored_by'] ?? 0,
      rank: json['rank'] ?? 0,
      popularity: json['popularity'] ?? 0,
      members: json['members'] ?? 0,
      favorites: json['favorites'] ?? 0,
      synopsis: json['synopsis'] ?? '',
      background: json['background'] ?? '',
      season: json['season'] ?? '',
      year: json['year'] ?? 0,
      broadcast: json['broadcast'] ?? {},
      producers: json['producers'] ?? [],
      licensors: json['licensors'] ?? [],
      studios: json['studios'] ?? [],
      genres: json['genres'] ?? [],
      explicitGenres: json['explicit_genres'] ?? [],
      themes: json['themes'] ?? [],
      demographics: json['demographics'] ?? [],
      relations: json['relations'] ?? [],
      theme: json['theme'] ?? {},
      external: json['external'] ?? [],
      streaming: json['streaming'] ?? [],
    );
  }

  static List<Anime> fromList(List<dynamic>list) {
    return List<Anime>.from(list.map((e)=>Anime.fromJson(e))).toList();
  }
  // Getters
  String get title => _title;
  String get type => _type;
  String get source => _source;
  int get episodes => _episodes;
  String get status => _status;
  bool get airing => _airing;
  String get duration => _duration;
  Map<String,dynamic> get images => _images;
}
