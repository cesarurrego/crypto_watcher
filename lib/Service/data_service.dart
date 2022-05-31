import 'package:http/http.dart' as http;

class DataService {
  final String _baseUrl = "api.coingecko.com";

  Future<String> get({
    required String segment,
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      final url = Uri.https(_baseUrl, segment, queryParams);
      final response = await http.get(
        url,
        headers: {"Content-Type": "application/json"},
      );
      return response.body;
    } catch (e) {
      return '';
    }
  }
}
