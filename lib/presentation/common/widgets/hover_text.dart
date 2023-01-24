import 'package:flutter/material.dart';

class HoverText extends StatefulWidget {
  final String text;
  final TextStyle? style;
  final TextStyle? hoveredStyle;
  const HoverText(
    this.text, {
    this.style,
    super.key,
    this.hoveredStyle,
  });

  @override
  State<HoverText> createState() => _HoverTextState();
}

class _HoverTextState extends State<HoverText> {
  bool isHovered = false;

  onHovered() => setState(() => isHovered = true);
  onUnHovered() => setState(() => isHovered = false);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (_) => onHovered(),
      onExit: (_) => onUnHovered(),
      child: Text(
        widget.text,
        style: isHovered ? widget.hoveredStyle : widget.style,
      ),
    );
  }
}
