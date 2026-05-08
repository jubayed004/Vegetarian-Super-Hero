import 'package:flutter/material.dart';

enum NotificationType { workout, protein, checkIn, aiPlan }

class NotificationModel {
  final String id;
  final String title;
  final String subtitle;
  final String time;
  final NotificationType type;
  bool isRead;

  NotificationModel({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.time,
    required this.type,
    this.isRead = false,
  });
}
