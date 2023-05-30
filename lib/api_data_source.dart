import 'base_network.dart';

class ApiDataSource {
  static ApiDataSource instance = ApiDataSource();

  Future<Map<String, dynamic>> LoadNews(String kategori) {
    return BaseNetwork.get(kategori);
  }
}
