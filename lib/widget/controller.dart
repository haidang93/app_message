part of '../app_message.dart';

/// A controller for an AppMessage.
///
/// This class lets you perform tasks such as:
///
/// * Show message [showMessage]
/// * Dismiss message [clearMessage].
///
class AppMessageController {
  AnimationController? _animationController;
  Animation<Offset>? _slideAnimation;
  Animation<double>? _opacityAnimation;
  bool _show = false;
  double _opacity = 1;
  Timer? _timer;

  String? _title;
  Widget? _titleWidget;
  String? _message;
  Widget? _messageWidget;
  AppMessageStyle? _style;
  ThemeData? _theme;
  EdgeInsetsGeometry? _padding;
  Function(BuildContext context)? _onTap;

  late void Function(void Function()) _setState;
  late BuildContext _context;
  late CustomAppMessageType? _customAppMessageType;

  void _onInit(
    TickerProvider vsync,
    void Function(void Function()) fn,
    BuildContext ct,
    CustomAppMessageType? camt,
  ) {
    _context = ct;
    _setState = fn;
    _customAppMessageType = camt;
    _animationController ??= AnimationController(
      vsync: vsync,
      duration: const Duration(milliseconds: 300),
    );
  }

  void _onClose() {
    _timer?.cancel();
    _animationController?.dispose();
  }

  /// Show message
  void showMessage({
    String? title,
    Widget? titleWidget,
    String? message,
    Widget? messageWidget,
    ThemeData? theme,
    AppMessageType type = AppMessageType.information,
    AppMessageStyle? style,
    Duration animationDuration = const Duration(milliseconds: 400),
    int showDuration = 5,
    double opacity = 1,
    Curve curve = Curves.ease,
    Function(BuildContext context)? onTap,
    EdgeInsetsGeometry? padding,
  }) {
    if (!_context.mounted) {
      return;
    }
    _title = title;
    _titleWidget = titleWidget;
    _message = message;
    _messageWidget = messageWidget;
    _padding = padding;
    _onTap = onTap;
    _opacity = opacity;
    _theme = theme;

    if (style != null) {
      _style = style;
    } else if (_customAppMessageType?._getStyle(type) != null) {
      _style = _customAppMessageType?._getStyle(type);
    } else {
      _style = type._style;
    }

    _timer?.cancel();
    _animationController?.duration = animationDuration;
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.2),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _animationController!, curve: curve));
    _opacityAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _animationController!, curve: Curves.ease),
    );
    _setState(() {
      _show = true;
    });
    _animationController!.reset();
    _animationController!.forward();
    _timer = Timer(Duration(seconds: showDuration), () async {
      await _timerDismiss();
    });
  }

  Future _timerDismiss() async {
    await _animationController!.reverse();
    _setState(() {
      _show = false;
    });
  }

  /// dismiss the shown message
  void clearMessage() {
    _timer?.cancel();
    _timer = null;
    _setState(() {
      _show = false;
    });
  }
}
