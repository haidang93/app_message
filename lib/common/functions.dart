part of '../app_message.dart';

/// In order for AppMessage to work. AppMessage should wrap the
/// top level of your application, typically the Material.
///
/// ```dart
/// class MyApp extends StatelessWidget {
///   const MyApp({super.key});
///
///   @override
///   Widget build(BuildContext context) {
///     return AppMessage(
///       child: MaterialApp(
///         title: 'App Message Demo',
///         home: const MyHomePage(),
///       ),
///     );
///   }
/// }
/// ```
Future showAppMessage({
  required BuildContext context,
  String? title,
  Widget? titleWidget,
  String? message,
  Widget? messageWidget,
  Widget? icon,
  int showDuration = 5,
  Duration animationDuration = const Duration(milliseconds: 400),
  AppMessageType type = AppMessageType.information,
  Function(BuildContext context)? onTap,
  Color? textColor,
  Color? backgroundColor,
  Color? indicatorColor,
  Curve curve = Curves.ease,
  EdgeInsetsGeometry? padding,
}) async {
  final state = AppMessage.of(context);
  if (state != null) {
    final controller = state.controller;
    controller.showMessage(
      title: title,
      titleWidget: titleWidget,
      message: message,
      messageWidget: messageWidget,
      type: type,
      icon: icon,
      showDuration: showDuration,
      onTap: onTap,
      animationDuration: animationDuration,
      textColor: textColor,
      backgroundColor: backgroundColor,
      curve: curve,
      indicatorColor: indicatorColor,
      padding: padding,
    );
  }
}

void clearAppMessage(BuildContext context) {
  final state = AppMessage.of(context);
  if (state != null) {
    final controller = state.controller;
    controller.clearMessage();
  }
}

T _setColorOpacity<T extends Color?>(T color, double opacity) {
  assert(opacity >= 0 && opacity <= 1);

  if (color == null) {
    return null as T;
  }

  return (color as Color).withAlpha((opacity * 255).toInt()) as T;
}
