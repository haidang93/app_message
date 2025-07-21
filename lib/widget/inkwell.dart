part of '../app_message.dart';

class _MyInkWell extends StatelessWidget {
  const _MyInkWell({
    required this.onTap,
    required this.child,
    this.padding = const EdgeInsets.symmetric(horizontal: 10),
    this.backgroundColor = Colors.transparent,
    this.splashColor,
    this.radius = 100,
  });
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;
  final Color? splashColor;
  final double radius;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: Material(
        color: backgroundColor,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(radius),
          splashColor: splashColor,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(radius),
              color: Colors.transparent,
            ),
            padding: padding ?? const EdgeInsets.symmetric(horizontal: 10),
            child: child,
          ),
        ),
      ),
    );
  }
}
