class Article {
  final String title;
  final String description;
  final String urlToImage;
  final String sourceName;

  Article({
    required this.title,
    required this.description,
    required this.urlToImage,
    required this.sourceName,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      title: json['title'] ?? "Tanpa Judul",
      description: json['description'] ?? "Tanpa Deskripsi",
      urlToImage: json['urlToImage'] ??
          "https://via.placeholder.com/150", // default image
      sourceName: json['source']?['name'] ?? "Tidak diketahui",
    );
  }
}