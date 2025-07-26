part of '../app_message.dart';

class _DefaultAppMessageType {
  _DefaultAppMessageType._();
  static const AppMessageStyle success = AppMessageStyle(
    backgroundColor: Colors.white,
    indicatorColor: Color.fromRGBO(110, 195, 110, 1),
    contentColor: Color.fromRGBO(77, 77, 77, 1),
    icon: Icon(
      Icons.check_circle_outline_rounded,
      color: Color.fromRGBO(110, 195, 110, 1),
    ),
  );

  static const AppMessageStyle error = AppMessageStyle(
    backgroundColor: Color.fromRGBO(255, 240, 240, 1),
    indicatorColor: Color.fromRGBO(255, 0, 0, 1),
    contentColor: Color.fromRGBO(77, 77, 77, 1),
    icon: Icon(Icons.info_outline_rounded, color: Color.fromRGBO(255, 0, 0, 1)),
  );

  static const AppMessageStyle information = AppMessageStyle(
    backgroundColor: Colors.white,
    indicatorColor: Color.fromRGBO(0, 174, 255, 1),
    contentColor: Color.fromRGBO(77, 77, 77, 1),
  );

  static const AppMessageStyle caution = AppMessageStyle(
    backgroundColor: Colors.white,
    indicatorColor: Color.fromRGBO(252, 93, 1, 1),
    contentColor: Color.fromRGBO(77, 77, 77, 1),
  );

  static const AppMessageStyle custom = AppMessageStyle();
}
