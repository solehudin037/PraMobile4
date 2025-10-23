import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pra4mobile/news_model.dart';


class Api {
  final String apiKey = 'MASUKKAN_API_KEY_KAMU_DI_SINI';
  final String baseUrl = 'https://newsapi.org/v2/everything?q=apple&from=2025-10-22&to=2025-10-22&sortBy=popularity&apiKey=517a1b68e5134b95b1a03d7f08039855';

  Future<List<Article>> FetchNews() async {
    final response = await http.get(Uri.parse('$baseUrl&apiKey=$apiKey'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      final List<dynamic> articles = data['articles'];

      // Mengubah setiap artikel JSON menjadi objek News
      return articles.map((article) => Article.fromJson(article)).toList();
    } else {
      throw Exception('Gagal memuat data berita');
    }
  }
}