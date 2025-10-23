import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pra4mobile/news_model.dart';


class Api {
  final String apiKey = 'MASUKKAN_API_KEY_KAMU_DI_SINI';
  final String baseUrl = 'https://newsapi.org/v2/everything?q=tesla&from=2025-09-23&sortBy=publishedAt&apiKey=7808036ef0af4557bad740543a063b6d';

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