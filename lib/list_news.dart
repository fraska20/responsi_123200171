import 'package:flutter/material.dart';
import 'package:responsi_123200171/api_data_source.dart';
import 'package:responsi_123200171/list_detail_news.dart';
import 'package:responsi_123200171/news_model.dart';

class PageListNews extends StatelessWidget {
  String kategori;
  PageListNews({Key? key, required this.kategori}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("REPUBLIKA ${kategori.toUpperCase()}"),
        centerTitle: true,
      ),
      body: _builListUsersBody(kategori),
    );
  }
}

Widget _builListUsersBody(String kategori) {
  return Container(
    child: FutureBuilder(
      future: ApiDataSource.instance.LoadNews(kategori),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasError) {
          return _buildErrorSection();
        }

        if (snapshot.hasData) {
          ListNewsModel newsModel = ListNewsModel.fromJson(snapshot.data);
          return _buildSuccesSection(newsModel);
        }

        return _buildLoadingSection();
      },
    ),
  );
}

Widget _buildSuccesSection(ListNewsModel news) {
  return ListView.builder(
    itemCount: news.data!.posts!.length,
    itemBuilder: (context, index) {
      return _buildItemsUsers(news.data!.posts![index], context);
    },
  );
}

Widget _buildItemsUsers(Posts news, context) {
  return InkWell(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => PageListDetailNews(post: news)),
      );
    },
    child: Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
              child: Text(
            news.title!,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            maxLines: 2,
          )),
          SizedBox(
            width: 10,
          ),
          Container(
              width: MediaQuery.of(context).size.width / 3,
              child: Image.network(news.thumbnail!)),
        ],
      ),
    ),
  );
}

Widget _buildErrorSection() {
  return const Text("ERROR");
}

Widget _buildLoadingSection() {
  return const Center(
    child: CircularProgressIndicator(),
  );
}
