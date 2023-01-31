import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:misli_os_app/presentation/common/values/is_web_mobile.dart';

class HoverIcon extends StatefulWidget {
  final IconData icon;
  final Color? color;
  final Color? hoveredColor;
  const HoverIcon(
    this.icon, {
    this.color,
    this.hoveredColor,
    super.key,
  });

  @override
  State<HoverIcon> createState() => _HoverTextState();
}

class _HoverTextState extends State<HoverIcon> {
  bool isHovered = false;

  onHovered() => setState(() => isHovered = true);
  onUnHovered() => setState(() => isHovered = false);

  @override
  Widget build(BuildContext context) {
    final iconWidget = Icon(
      widget.icon,
      color: isHovered ? widget.hoveredColor : widget.color,
    );
    if (!kIsWebMobile) {
      return iconWidget;
    }
    return MouseRegion(
      onHover: (_) => onHovered(),
      onExit: (_) => onUnHovered(),
      child: iconWidget,
    );
  }
}
