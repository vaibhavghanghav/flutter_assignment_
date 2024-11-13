class Movie {
  final String title;
  final String year;
  final String imdbId;
  final String type;
  final String poster;
  final String genre;
  final String imdbRating;

  Movie({
    required this.title,
    required this.year,
    required this.imdbId,
    required this.type,
    required this.poster,
    required this.genre,
    required this.imdbRating,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['Title'] ?? '',
      year: json['Year'] ?? '',
      imdbId: json['imdbID'] ?? '',
      type: json['Type'] ?? '',
      poster: json['Poster'] != 'N/A' ? json['Poster'] : 'https://via.placeholder.com/150',
      genre: json['Genre'] ?? '',
      imdbRating: json['imdbRating'] ?? 'N/A',
    );
  }
}