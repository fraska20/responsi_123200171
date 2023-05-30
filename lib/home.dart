import 'package:flutter/material.dart';
import 'package:responsi_123200171/list_news.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(
            'https://static.republika.co.id/files/images/logo.png',
            width: 200,
            height: 200,
          ),
          const SizedBox(height: 150),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 150,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                PageListNews(kategori: 'terbaru'),
                          ),
                        );
                      },
                      child: const Text('TERBARU'),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    width: 150,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                PageListNews(kategori: 'daerah'),
                          ),
                        );
                      },
                      child: const Text('DAERAH'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 150,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                PageListNews(kategori: 'internasional'),
                          ),
                        );
                      },
                      child: const Text('INTERNASIONAL'),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    width: 150,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                PageListNews(kategori: 'islam'),
                          ),
                        );
                      },
                      child: const Text('ISLAM'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
