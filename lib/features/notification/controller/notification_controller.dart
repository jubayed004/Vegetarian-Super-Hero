import 'package:get/get.dart';
import '../model/notification_model.dart';

class NotificationController extends GetxController {
  var notifications = <NotificationModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadNotifications();
  }

  void loadNotifications() {
    // Dummy data based on the design image
    notifications.assignAll([
      NotificationModel(
        id: '1',
        title: "Today's workout is ready",
        subtitle: "Push Day A is scheduled. Tap to start.",
        time: "Just now",
        type: NotificationType.workout,
      ),
      NotificationModel(
        id: '2',
        title: "Protein target reminder",
        subtitle: "You're 42g short of your daily protein goal.",
        time: "2h ago",
        type: NotificationType.protein,
      ),
      NotificationModel(
        id: '3',
        title: "Weekly check-in due",
        subtitle: "Log your progress so VSS can adapt your plan.",
        time: "1d ago",
        type: NotificationType.checkIn,
      ),
      NotificationModel(
        id: '4',
        title: "AI Plan updated",
        subtitle: "Your plan was adjusted based on last week data.",
        time: "2d ago",
        type: NotificationType.aiPlan,
      ),
    ]);
  }

  void markAllAsRead() {
    for (var notification in notifications) {
      notification.isRead = true;
    }
    notifications.refresh();
  }

  void removeNotification(String id) {
    notifications.removeWhere((n) => n.id == id);
  }
}
