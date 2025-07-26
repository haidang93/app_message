part of '../app_message.dart';

/// To style the message widget
class AppMessageStyle {
  /// the backgroud
  final Color? backgroundColor;

  /// the padding color
  final Color? indicatorColor;

  /// the text color
  final Color? contentColor;

  /// the icon widget
  final Widget? icon;

  /// To style the message widget
  const AppMessageStyle({
    this.backgroundColor,
    this.indicatorColor,
    this.contentColor,
    this.icon,
  });
}
