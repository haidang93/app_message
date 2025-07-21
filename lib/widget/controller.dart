part of '../app_message.dart';

class AppMessageController {
  AnimationController? animationController;
  Animation<Offset>? slideAnimation;
  Animation<double>? opacityAnimation;
  bool show = false;
  double opacity = 0;
  Timer? timer;

  String? _title;
  Widget? _titleWidget;
  String? _message;
  Widget? _messageWidget;
  Color? _backgroundColor;
  Color? _indicatorColor;
  Color? _textColor;
  Widget? _icon;
  EdgeInsetsGeometry? _padding;
  Function(BuildContext context)? _onTap;

  late void Function(void Function()) setState;
  late BuildContext context;

  void onInit(
    TickerProvider vsync,
    void Function(void Function()) fn,
    BuildContext ct,
  ) {
    context = ct;
    setState = fn;
    animationController ??= AnimationController(
      vsync: vsync,
      duration: const Duration(milliseconds: 300),
    );
  }

  void onClose() {
    timer?.cancel();
    animationController?.dispose();
  }

  void showMessage({
    String? title,
    Widget? titleWidget,
    String? message,
    Widget? messageWidget,
    AppMessageType type = AppMessageType.information,
    Color? backgroundColor,
    Color? indicatorColor,
    Color? textColor,
    Widget? icon,
    Duration animationDuration = const Duration(milliseconds: 400),
    int showDuration = 5,
    Curve curve = Curves.ease,
    Function(BuildContext context)? onTap,
    EdgeInsetsGeometry? padding,
  }) {
    if (!context.mounted) {
      return;
    }
    _title = title;
    _titleWidget = titleWidget;
    _message = message;
    _messageWidget = messageWidget;
    _backgroundColor = backgroundColor ?? type.backgroundColor;
    _indicatorColor = indicatorColor ?? type.indicatorColor;
    _textColor = textColor ?? type.contentColor;
    _icon = icon ?? type.icon;
    _padding = padding;
    _onTap = onTap;

    timer?.cancel();
    animationController?.duration = animationDuration;
    slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.2),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: animationController!, curve: curve));
    opacityAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: animationController!, curve: Curves.ease),
    );
    setState(() {
      show = true;
    });
    animationController!.reset();
    animationController!.forward();
    timer = Timer(Duration(seconds: showDuration), () async {
      await _timerDismiss();
    });
  }

  Future _timerDismiss() async {
    await animationController!.reverse();
    setState(() {
      show = false;
    });
  }

  void clearMessage() {
    timer?.cancel();
    timer = null;
    setState(() {
      show = false;
    });
  }
}
