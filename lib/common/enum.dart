part of '../app_message.dart';

enum AppMessageType {
  success(
    Colors.white,
    Color.fromRGBO(110, 195, 110, 1),
    Color.fromRGBO(77, 77, 77, 1),
    Icon(
      Icons.check_circle_outline_rounded,
      color: Color.fromRGBO(110, 195, 110, 1),
    ),
  ),
  error(
    Color.fromRGBO(255, 240, 240, 1),
    Color.fromRGBO(255, 0, 0, 1),
    Color.fromRGBO(77, 77, 77, 1),
    Icon(Icons.info_outline_rounded, color: Color.fromRGBO(255, 0, 0, 1)),
  ),
  information(
    Colors.white,
    Color.fromRGBO(0, 174, 255, 1),
    Color.fromRGBO(77, 77, 77, 1),
    null,
  ),
  caution(
    Colors.white,
    Color.fromRGBO(252, 93, 1, 1),
    Color.fromRGBO(77, 77, 77, 1),
    null,
  ),
  custom(
    Colors.white,
    Color.fromRGBO(153, 153, 153, 1),
    Color.fromRGBO(77, 77, 77, 1),
    null,
  );

  final Color? backgroundColor;
  final Color? indicatorColor;
  final Color? contentColor;
  final Widget? icon;
  const AppMessageType(
    this.backgroundColor,
    this.indicatorColor,
    this.contentColor,
    this.icon,
  );
}
