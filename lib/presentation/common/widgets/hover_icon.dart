import 'package:flutter/material.dart';

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
    return MouseRegion(
      onHover: (_) => onHovered(),
      onExit: (_) => onUnHovered(),
      child: Icon(
        widget.icon,
        color: isHovered ? widget.hoveredColor : widget.color,
      ),
    );
  }
}
