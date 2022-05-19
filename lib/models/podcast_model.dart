import 'dart:convert';

List<PodcastModel> postFromJson(String str) => List<PodcastModel>.from(
    json.decode(str).map((x) => PodcastModel.fromJson(x)));

class PodcastModel {
  PodcastModel({
    required this.id,
    required this.title,
    required this.voiceUrl,
    required this.category,
    required this.imageUrl,
    required this.createdAt,
    required this.updatedAt,
  });

  String id;
  String title;

  String voiceUrl;
  String category;

  String imageUrl;
  String createdAt;
  String updatedAt;

  factory PodcastModel.fromJson(Map<String, dynamic> json) => PodcastModel(
        id: json['id'],
        title: json['title'],
        voiceUrl: json['voice_url'],
        category: json['category'],
        imageUrl: json['image_url'],
        createdAt: json['created_at'],
        updatedAt: json['updated_at'],
      );
}
