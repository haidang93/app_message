part of '../app_message.dart';

/// To override default style of message
///
class CustomAppMessageType {
  /// To override default style of message
  ///
  const CustomAppMessageType({
    this.all,
    this.success,
    this.error,
    this.information,
    this.caution,
  });

  /// to override all undefined type
  final AppMessageStyle? all;

  /// to override [success] type
  final AppMessageStyle? success;

  /// to override [error] type
  final AppMessageStyle? error;

  /// to override [information] type
  final AppMessageStyle? information;

  /// to override [caution] type
  final AppMessageStyle? caution;

  AppMessageStyle? _getStyle(AppMessageType type) {
    AppMessageStyle? res;

    switch (type) {
      case AppMessageType.success:
        res = success;
        break;
      case AppMessageType.error:
        res = error;
        break;
      case AppMessageType.information:
        res = information;
        break;
      case AppMessageType.caution:
        res = caution;
        break;
      default:
        break;
    }

    return res ?? all;
  }
}
