import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:podcast/models/podcast.dart';

Future<List<Album>> fetchAlbum() async {
  final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/'));

  if (response.statusCode == 200) {
    List jsonResponse = jsonDecode(response.body);
    return jsonResponse.map((album) => Album.fromJson(album)).toList();
  } else {
    throw Exception('Failed to load album');
  }
}
