import 'dart:convert';

class UserReminderModel {
  final String title;
  final String ReminderText;
  final String Latitude;
  final String Longitude;
  final String ReminderId;
  final DateTime createdAt;
  UserReminderModel({
    required this.title,
    required this.ReminderText,
    required this.Latitude,
    required this.Longitude,
    required this.ReminderId,
    required this.createdAt,
  });

  UserReminderModel copyWith({
    String? title,
    String? ReminderText,
    String? Latitude,
    String? Longitude,
    String? ReminderId,
    DateTime? createdAt,
  }) {
    return UserReminderModel(
      title: title ?? this.title,
      ReminderText: ReminderText ?? this.ReminderText,
      Latitude: Latitude ?? this.Latitude,
      Longitude: Longitude ?? this.Longitude,
      ReminderId: ReminderId ?? this.ReminderId,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'ReminderText': ReminderText,
      'Latitude': Latitude,
      'Longitude': Longitude,
      'ReminderId': ReminderId,
      'createdAt': createdAt.millisecondsSinceEpoch,
    };
  }

  factory UserReminderModel.fromMap(Map<String, dynamic> map) {
    return UserReminderModel(
      title: map['title'] ?? '',
      ReminderText: map['ReminderText'] ?? '',
      Latitude: map['Latitude'] ?? '',
      Longitude: map['Longitude'] ?? '',
      ReminderId: map['ReminderId'] ?? '',
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt']),
    );
  }

  @override
  String toString() {
    return 'UserReminderModel(title: $title, ReminderText: $ReminderText, Latitude: $Latitude, Longitude: $Longitude, ReminderId: $ReminderId, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserReminderModel &&
        other.title == title &&
        other.ReminderText == ReminderText &&
        other.Latitude == Latitude &&
        other.Longitude == Longitude &&
        other.ReminderId == ReminderId &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        ReminderText.hashCode ^
        Latitude.hashCode ^
        Longitude.hashCode ^
        ReminderId.hashCode ^
        createdAt.hashCode;
  }
}
