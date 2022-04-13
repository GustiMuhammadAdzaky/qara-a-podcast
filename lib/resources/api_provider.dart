import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:podcast/models/podcast_model.dart';

class ApiProvider {
  String baseUrl = 'https://api-podcast.000webhostapp.com/PodcastApi';

  Future<List<PodcastModel>> fetchdata() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
      return parsed
          .map<PodcastModel>((json) => PodcastModel.fromJson(json))
          .toList();
    } else {
      throw Exception('Failed to load album');
    }
  }
}
