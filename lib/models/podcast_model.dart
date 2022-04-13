import 'dart:convert';

List<PodcastModel> postFromJson(String str) => List<PodcastModel>.from(
    json.decode(str).map((x) => PodcastModel.fromJson(x)));

class PodcastModel {
  PodcastModel({
    required this.id,
    required this.title,
    required this.voice,
    required this.voiceUrl,
    required this.category,
    required this.image,
    required this.imageUrl,
    required this.createdAt,
    required this.updatedAt,
  });

  String id;
  String title;
  String voice;
  String voiceUrl;
  String category;
  String image;
  String imageUrl;
  String createdAt;
  String updatedAt;

  factory PodcastModel.fromJson(Map<String, dynamic> json) => PodcastModel(
        id: json['id'],
        title: json['title'],
        voice: json['voice'],
        voiceUrl: json['voice_url'],
        category: json['category'],
        image: json['image'],
        imageUrl: json['image_url'],
        createdAt: json['created_at'],
        updatedAt: json['updated_at'],
      );
}
