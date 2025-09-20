// lista inicial de alertas
import '../models/alert_item.dart';

final List<AlertItem> sampleAlerts = [
  // Ejemplo de alerta por CATEGORÍA (con radio y categoría)
  AlertItem.category(
    title: "Recordar entregar el trabajo práctico",
    enabled: true,
    radius: 500,
    categoryId: 1, // Ej: 1 = librería
  ),

  AlertItem.category(
    title: "Comprar hojas A4",
    enabled: false,
    radius: 300,
    categoryId: 2, // Ej: 2 = papelería
  ),

  // Ejemplo de alerta por LUGAR + HORARIO
  AlertItem.placeTime(
    title: "Visitar la biblioteca",
    enabled: true,
    placeId: 10, // ID ficticio (cuando tengas la DB de lugares)
    startTime: "08:00",
    endTime: "20:00",
    daysMask: 31, // Lunes a Viernes (1+2+4+8+16)
    radius: 400,
    timezone: "America/Argentina/Buenos_Aires",
  ),
];
