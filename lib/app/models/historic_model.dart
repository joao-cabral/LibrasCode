import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class HistoricModel {
  int? id;
  String videoId;
  String title;
  String author;
  DateTime? watchDate;
  HistoricModel({
    this.id,
    required this.videoId,
    required this.title,
    required this.author,
    this.watchDate,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'videoId': videoId,
      'title': title,
      'author': author,
      'watchDate': watchDate?.millisecondsSinceEpoch,
    };
  }

  factory HistoricModel.fromMap(Map<String, dynamic> map) {
    return HistoricModel(
      id: map['id'] != null ? map['id'] as int : null,
      videoId: map['videoId'] as String,
      title: map['title'] as String,
      author: map['author'] as String,
      watchDate: DateTime.fromMillisecondsSinceEpoch(map['watchDate'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory HistoricModel.fromJson(String source) =>
      HistoricModel.fromMap(json.decode(source) as Map<String, dynamic>);

  HistoricModel copyWith({
    int? id,
    String? videoId,
    String? title,
    String? author,
    DateTime? watchDate,
  }) {
    return HistoricModel(
      id: id ?? this.id,
      videoId: videoId ?? this.videoId,
      title: title ?? this.title,
      author: author ?? this.author,
      watchDate: watchDate ?? this.watchDate,
    );
  }
}
