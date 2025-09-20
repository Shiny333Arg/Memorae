// definición de la clase AlertItem
enum AlertType { category, placeTime }

class AlertItem {
  AlertItem.category({
    required this.title,
    this.enabled = true,
    this.radius = 500,
    required this.categoryId,
  })  : type = AlertType.category,
        placeId = null,
        startTime = null,
        endTime = null,
        daysMask = 0,
        timezone = 'UTC';

  AlertItem.placeTime({
    required this.title,
    this.enabled = true,
    this.radius,
    required this.placeId,
    required this.startTime,
    this.endTime,
    required this.daysMask,
    this.timezone = 'UTC',
  })  : type = AlertType.placeTime,
        categoryId = null;

  final String title;
  bool enabled;
  int? radius; // obligatorio en categoría, opcional en placeTime

  final AlertType type;

  // Para CATEGORY
  final int? categoryId;

  // Para PLACE_TIME
  final int? placeId;
  final String? startTime; // 'HH:mm'
  final String? endTime;
  final int daysMask; // bitmask de días
  final String timezone;
}
