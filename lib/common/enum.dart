part of '../app_message.dart';

/// Messge type
///
/// can be override by [CustomAppMessageType]
enum AppMessageType {
  /// Use for success announcement
  success(_DefaultAppMessageType.success),

  /// Use for error announcement
  error(_DefaultAppMessageType.error),

  /// Use to provide information
  information(_DefaultAppMessageType.information),

  /// Use alert issue
  caution(_DefaultAppMessageType.caution),

  /// Use for custom purposes
  custom(_DefaultAppMessageType.custom);

  final AppMessageStyle _style;
  const AppMessageType(this._style);
}
