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
  int showDuration = 5,
  Duration animationDuration = const Duration(milliseconds: 400),
  AppMessageType type = AppMessageType.information,
  AppMessageStyle? style,
  Function(BuildContext context)? onTap,
  Curve curve = Curves.ease,
  EdgeInsetsGeometry? padding,
  double opacity = 1,
}) async {
  final state = AppMessage.of(context);
  if (state != null) {
    final controller = state._controller;
    controller.showMessage(
      theme: Theme.of(context),
      title: title,
      titleWidget: titleWidget,
      message: message,
      messageWidget: messageWidget,
      type: type,
      style: style,
      showDuration: showDuration,
      onTap: onTap,
      animationDuration: animationDuration,
      curve: curve,
      padding: padding,
      opacity: opacity,
    );
  }
}

/// To dismiss shown message
void clearAppMessage(BuildContext context) {
  final state = AppMessage.of(context);
  if (state != null) {
    final controller = state._controller;
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
