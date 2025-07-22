part of '../app_message.dart';

class AppMessageType {
  final Color backgroundColor;
  final Color indicatorColor;
  final Color contentColor;
  final Widget? icon;
  const AppMessageType({
    this.backgroundColor = Colors.white,
    this.indicatorColor = const Color.fromRGBO(153, 153, 153, 1),
    this.contentColor = const Color.fromRGBO(153, 153, 153, 1),
    this.icon,
  });

  static const AppMessageType success = AppMessageType(
    backgroundColor: Colors.white,
    indicatorColor: Color.fromRGBO(110, 195, 110, 1),
    contentColor: Color.fromRGBO(77, 77, 77, 1),
    icon: Icon(
      Icons.check_circle_outline_rounded,
      color: Color.fromRGBO(110, 195, 110, 1),
    ),
  );

  static const AppMessageType error = AppMessageType(
    backgroundColor: Color.fromRGBO(255, 240, 240, 1),
    indicatorColor: Color.fromRGBO(255, 0, 0, 1),
    contentColor: Color.fromRGBO(77, 77, 77, 1),
    icon: Icon(Icons.info_outline_rounded, color: Color.fromRGBO(255, 0, 0, 1)),
  );

  static const AppMessageType information = AppMessageType(
    backgroundColor: Colors.white,
    indicatorColor: Color.fromRGBO(0, 174, 255, 1),
    contentColor: Color.fromRGBO(77, 77, 77, 1),
  );

  static const AppMessageType caution = AppMessageType(
    backgroundColor: Colors.white,
    indicatorColor: Color.fromRGBO(252, 93, 1, 1),
    contentColor: Color.fromRGBO(77, 77, 77, 1),
  );

  static const AppMessageType custom = AppMessageType();
}
