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
    this.textDirection,
    this.locale,
  });
  final AppMessageController? controller;
  final TextStyle? titleStyle;
  final TextStyle? messageStyle;
  final Widget? child;
  final TextDirection? textDirection;
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

class AppMessageState extends State<AppMessage>
    with SingleTickerProviderStateMixin {
  late AppMessageController controller;
  Locale locale = Locale('en');

  @override
  void initState() {
    super.initState();
    locale = widget.locale ?? WidgetsBinding.instance.platformDispatcher.locale;

    controller = widget.controller ?? AppMessageController();
    controller.onInit(this, setState, context);
  }

  @override
  void dispose() {
    widget.controller?.onClose();
    super.dispose();
  }

  TextDirection getTextDirection() {
    switch (widget.locale?.languageCode) {
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
      textDirection: widget.textDirection ?? getTextDirection(),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          if (widget.child != null) widget.child!,
          if (controller.show)
            Dismissible(
              onDismissed: (direction) {
                controller.clearMessage();
              },
              key: UniqueKey(),
              child: SlideTransition(
                position: controller.slideAnimation!,
                child: FadeTransition(
                  opacity: controller.opacityAnimation!,
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
                                color: controller._indicatorColor,
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
                                onTap: controller._onTap == null
                                    ? null
                                    : () {
                                        controller._onTap!(context);
                                        controller.clearMessage();
                                      },
                                radius: 5,
                                backgroundColor: controller._backgroundColor,
                                padding:
                                    controller._padding ??
                                    EdgeInsets.symmetric(
                                      horizontal: controller._icon != null
                                          ? 0
                                          : 15,
                                      vertical: 7,
                                    ),
                                splashColor: _setColorOpacity(
                                  controller._indicatorColor,
                                  0.8,
                                ),
                                child: Row(
                                  children: [
                                    Visibility(
                                      visible: controller._icon != null,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 10,
                                        ),
                                        child: controller._icon ?? SizedBox(),
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          if (controller._titleWidget != null)
                                            controller._titleWidget!
                                          else if (controller
                                                  ._title
                                                  ?.isNotEmpty ??
                                              false)
                                            Text(
                                              controller._title ?? '',
                                              style:
                                                  widget.titleStyle ??
                                                  TextStyle(
                                                    color:
                                                        controller._textColor,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                            ),
                                          if (controller._messageWidget != null)
                                            controller._messageWidget!
                                          else
                                            Text(
                                              controller._message ?? '',
                                              style:
                                                  widget.messageStyle ??
                                                  TextStyle(
                                                    color:
                                                        controller._textColor,
                                                  ),
                                            ),
                                        ],
                                      ),
                                    ),
                                    Visibility(
                                      visible: controller._icon != null,
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
        ],
      ),
    );
  }
}
