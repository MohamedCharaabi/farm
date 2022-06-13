abstract class BaseApiService {
  final String _baseUrl = "https://jsonplaceholder.typicode.com/";

  Future<dynamic> getResponse<T>(String url);
  Future<dynamic> postResponse(String url,
      {required Map<String, dynamic> body, Map<String, String>? headers});
  Future<dynamic> putResponse(
      String url, Map<String, dynamic> body, Map<String, String>? headers);
  Future<dynamic> deleteResponse(String url, Map<String, String>? headers);
}
