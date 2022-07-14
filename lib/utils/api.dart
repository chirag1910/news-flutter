import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news/models/articles.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

// class Api {
//   static String baseUrl = "https://newsdata.io/api/1/";
//   static String apiKey = dotenv.env["APIKEY_DATA"] ?? "";

//   static Future<Articles> callApi(String endpoint) async {
//     final response = await http.get(Uri.parse(baseUrl + endpoint),
//         headers: {"X-ACCESS-KEY": apiKey, "Accept": "application/json"});
//     return Articles.fromJson(jsonDecode(response.body));
//   }

//   static Future<Articles> getPersonalized(
//       {String? countryCode, String? language, String? category, int page = 1}) {
//     return callApi("news?"
//         "${countryCode != null ? "&country=$countryCode" : ""}"
//         "${language != null ? "&language=$language" : ""}"
//         "${category != null ? "&category=$category" : ""}"
//         "&page=$page");
//   }

//   static Future<Articles> search({String? query = "", int page = 1}) {
//     return callApi("archive?"
//         "${query != null ? "&q=$query" : ""}"
//         "&page=$page");
//   }
// }

class Api {
  static String baseUrl = "https://newsapi.org/v2/";
  static String apiKey = dotenv.env["APIKEY_API"] ?? "";

  static Future<Articles> callApi(String endpoint) async {
    final response = await http.get(Uri.parse(baseUrl + endpoint),
        headers: {"Authorization": apiKey, "Accept": "application/json"});
    return Articles.fromJson(jsonDecode(response.body));
  }

  static Future<Articles> getPersonalized(
      {String? countryCode = "",
      String? language = "",
      String? category = "",
      int page = 1}) {
    return callApi("top-headlines?"
        "${countryCode != null ? "country=$countryCode" : ""}"
        "${language != null ? "&language=$language" : ""}"
        "${category != null ? "&category=$category" : ""}"
        "&page=$page");
  }

  static Future<Articles> search({String? query = "", int page = 1}) {
    return callApi("everything?"
        "${query != null ? "q=$query" : ""}"
        "&page=$page");
  }
}
