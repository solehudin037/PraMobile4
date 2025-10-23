import 'package:flutter/material.dart';
import 'package:pra4mobile/news_service.dart';
import 'package:pra4mobile/news_model.dart';


void main() {
  runApp(DaftarBerita());
}

// material app sama scaffold
class DaftarBerita extends StatelessWidget {
  const DaftarBerita({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Berita Terbaru", //judul
      home: TampilanDaftar(),
    );
  }
}

// membuat scaffold
class TampilanDaftar extends StatefulWidget {
  const TampilanDaftar({super.key});

  @override
  State<TampilanDaftar> createState() => _TampilanDaftarNewsState();
}

class _TampilanDaftarNewsState extends State<TampilanDaftar> {
late Future<List<Article>> _newsFuture;

final ScrollController _scrollController = ScrollController();
bool _showBackToTopButton = false;

@override
void initState() {
  super.initState();
  _newsFuture = Api().FetchNews();

  _scrollController.addListener(() {
  if (_scrollController.offset >= 400) {
    setState(() {
      _showBackToTopButton = true;
    });
  } else {
    setState(() {
      _showBackToTopButton = false;
    });
  }
  });
}

  Future<void> _refreshData() async {
    setState(() {
      _newsFuture = Api().FetchNews();
    });
  }

  void _scrollToTop() {
  _scrollController.animateTo(
    0,
    duration: const Duration(milliseconds: 500),
    curve: Curves.easeInOut,
  );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 7, 7),
        title: Text("News Berita"),
      ),
      body: Center(
        child: Column(
          children: [
            Text("Daftar Berita"),

            FutureBuilder(
              future: _newsFuture,
              builder: (context, snapshot) {
                //pengecekan apakah data ada atau tidak ada
                if (snapshot.hasData && snapshot. data!.isNotEmpty) {
                  final newss = snapshot.data!;
                  return Expanded(
                  child: RefreshIndicator(
                    onRefresh: _refreshData,
                    child: ListView.builder(
                      controller: _scrollController,
                      itemCount: newss.length,
                      itemBuilder: (context, index) {
                        final news = newss[index];
                        return Card(
                          child: ListTile(
                            leading: Image.network(
                              news.urlToImage ?? "",
                              width: 80,
                              height: 80,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) =>
                                  const Icon(Icons.broken_image),
                              ),
                                title: Text(news.title ?? "Tidak ada judul"),
                                subtitle: Text(
                                "${news.sourceName}\n${news.description ?? ""}",
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                );

                }else{
                  return Text ("Data Tidak Tersedia");
                }
              }, 
            )
          ],
        ),
      ),
      floatingActionButton: _showBackToTopButton? 
      FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 91, 241, 3),
        onPressed: _scrollToTop,
        child: const Icon(Icons.arrow_upward),
      )
        : null,
    );
  }
}