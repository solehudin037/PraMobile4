class Article {
  final String title;
  final String description;
  final String urlToImage;
  final String Name;
  final String author;
  final String url;
  final String publishedAt;

  Article({
    required this.title,
    required this.description,
    required this.urlToImage,
    required this.Name,
    required this.author,
    required this.url,
    required this.publishedAt,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      title: json['title'] ?? "GM will ditch Apple CarPlay and Android Auto on all its cars, not just EVs",
      description: json['description'] ?? "GM plans to drop support for phone projection on all new vehicles in the near future, and not just its electric car lineup, according to GM CEO Mary Barra. In Decoder interview with The Verge’s Nilay Patel, published Wednesday, Barra confirmed GM will eventua…",
      urlToImage: json['urlToImage'] ?? "https://platform.theverge.com/wp-content/uploads/sites/2/2025/09/acastro_STK057_03.jpg?quality=90&strip=all&crop=0%2C10.732984293194%2C100%2C78.534031413613&w=1200", // default image
      Name: json['name'] ?? "The Verge",
      author: json['author'] ?? "Nick Statt",
      url: json['url'] ?? "https://www.theverge.com/transportation/804562/gm-apple-carplay-android-auto-gas-cars-mary-barra",
      publishedAt: json['publishedAt'] ?? "2025-10-22T16:57:53Z",
    );
  }
}