part of '../app_message.dart';

/// AppMessage should wrap the top level of your application,
/// typically the Material.
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
class AppMessage extends StatefulWidget {
  /// AppMessage should wrap the top level of your application,
  /// typically the Material.
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
  const AppMessage({
    super.key,
    this.controller,
    this.child,
    this.titleStyle,
    this.messageStyle,
    this.customAppMessageType,
    this.textDirection,
    this.locale,
  });

  /// the controller of AppMessage
  final AppMessageController? controller;

  /// To override title Style
  final TextStyle? titleStyle;

  /// To override content style
  final TextStyle? messageStyle;

  /// To override style
  final CustomAppMessageType? customAppMessageType;

  /// the widget below in the widget tree
  final Widget? child;

  /// to override the text direction
  final TextDirection? textDirection;

  /// To determine what text direction to use
  final Locale? locale;

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
  static AppMessageState? of(BuildContext context) {
    final AppMessageState? state = context
        .findAncestorStateOfType<AppMessageState>();

    if (state == null) {
      // ignore: avoid_print
      print(
        FlutterError.fromParts(<DiagnosticsNode>[
          ErrorSummary('No AppMessageState found.'),
          ErrorDescription(
            '${context.widget.runtimeType} widgets require a AppMessage widget ancestor.',
          ),
          ...context.describeMissingAncestor(
            expectedAncestorType: ScaffoldMessenger,
          ),
          ErrorHint(
            'Typically, the AppMessage widget is wrapped by the MaterialApp '
            'at the top of your application widget tree.',
          ),
        ]),
      );
    }
    return state;
  }

  @override
  State<AppMessage> createState() => AppMessageState();
}

/// the state of AppMessage
class AppMessageState extends State<AppMessage>
    with SingleTickerProviderStateMixin {
  late AppMessageController _controller;
  Locale _locale = Locale('en');

  @override
  void initState() {
    super.initState();
    _locale =
        widget.locale ?? WidgetsBinding.instance.platformDispatcher.locale;

    _controller = widget.controller ?? AppMessageController();
    _controller._onInit(this, setState, context, widget.customAppMessageType);
  }

  @override
  void dispose() {
    widget.controller?._onClose();
    super.dispose();
  }

  TextDirection _getTextDirection() {
    switch (_locale.languageCode) {
      case 'ar': // Arabic
      case 'arc': // Aramaic
      case 'dv': // Dhivehi/Maldivian
      case 'fa': // Persian (Farsi)
      case 'he': // Hausa (when written in Arabic script)
      case 'ha': // Hebrew
      case 'khw': // Khowar
      case 'ks': // Kashmiri
      case 'ku': // Kurdish (Sorani)
      case 'ps': // Pashto
      case 'ur': // Urdu
      case 'yi': // Yiddish
        return TextDirection.rtl;
      default:
        return TextDirection.ltr;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: widget.textDirection ?? _getTextDirection(),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          if (widget.child != null) widget.child!,
          if (_controller._show)
            _controller._theme == null
                ? _buildSnackMessage()
                : Theme(data: _controller._theme!, child: _buildSnackMessage()),
        ],
      ),
    );
  }

  Widget _buildSnackMessage() {
    return Dismissible(
      onDismissed: (direction) {
        _controller.clearMessage();
      },
      key: UniqueKey(),
      child: SlideTransition(
        position: _controller._slideAnimation!,
        child: FadeTransition(
          opacity: _controller._opacityAnimation!,
          child: Opacity(
            opacity: _controller._opacity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10,
                  ),
                  child: SafeArea(
                    child: Material(
                      color: Colors.transparent,
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.only(left: 4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: _controller._style?.indicatorColor,
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              spreadRadius: 2,
                              blurRadius: 4,
                              offset: Offset(2, 2),
                            ),
                          ],
                        ),
                        child: _MyInkWell(
                          onTap: _controller._onTap == null
                              ? null
                              : () {
                                  _controller._onTap!(context);
                                  _controller.clearMessage();
                                },
                          radius: 5,
                          backgroundColor: _controller._style?.backgroundColor,
                          padding:
                              _controller._padding ??
                              EdgeInsets.symmetric(
                                horizontal: _controller._style?.icon != null
                                    ? 0
                                    : 15,
                                vertical: 7,
                              ),
                          splashColor: _setColorOpacity(
                            _controller._style?.indicatorColor,
                            0.8,
                          ),
                          child: Row(
                            children: [
                              Visibility(
                                visible: _controller._style?.icon != null,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                  ),
                                  child: _controller._style?.icon ?? SizedBox(),
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    if (_controller._titleWidget != null)
                                      _controller._titleWidget!
                                    else if (_controller._title?.isNotEmpty ??
                                        false)
                                      Text(
                                        _controller._title ?? '',
                                        style:
                                            widget.titleStyle ??
                                            _controller
                                                ._theme
                                                ?.textTheme
                                                .titleMedium
                                                ?.copyWith(
                                                  color: _controller
                                                      ._style
                                                      ?.contentColor,
                                                ),
                                      ),
                                    if (_controller._messageWidget != null)
                                      _controller._messageWidget!
                                    else
                                      Text(
                                        _controller._message ?? '',
                                        style:
                                            widget.messageStyle ??
                                            _controller
                                                ._theme
                                                ?.textTheme
                                                .bodyMedium
                                                ?.copyWith(
                                                  color: _controller
                                                      ._style
                                                      ?.contentColor,
                                                ),
                                      ),
                                  ],
                                ),
                              ),
                              Visibility(
                                visible: _controller._style?.icon != null,
                                child: const SizedBox(width: 15),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
