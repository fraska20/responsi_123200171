import 'package:flutter/material.dart';
import 'package:responsi_123200171/news_model.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart';

class PageListDetailNews extends StatelessWidget {
  Posts post;
  PageListDetailNews({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("News Detail"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              child: Text(
                post.title!,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Text(convertPubDate(post.pubDate!),
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300)),
            ),
            const SizedBox(
              height: 10,
            ),
            FractionallySizedBox(
              widthFactor: 1.0,
              child: Image.network(
                post.thumbnail!,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(post.description!,
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w300)),
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () async {
                await goToWebPage(post.link.toString());
              },
              child: const Text("Baca Selengkapnya..."),
            )
          ],
        ),
      ),
    );
  }

  final Uri _url = Uri.parse('https://flutter.dev');

  Future<void> goToWebPage(String urlString) async {
    final Uri _url = Uri.parse(urlString);
    if (!await launchUrl(_url)) {
      throw 'Could not launch $_url';
    }
  }

  String convertPubDate(String pubdate) {
    DateTime dateTime = DateTime.parse(pubdate);

    DateFormat formatter = DateFormat('EEEE, d MMMM yyyy');

    return formatter.format(dateTime);
  }
}
