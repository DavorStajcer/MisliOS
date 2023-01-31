import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:misli_os_app/presentation/common/values/is_web_mobile.dart';

class HoverContainer extends StatefulWidget {
  final Widget child;
  final Decoration? decoration;
  final Decoration? hoveredDecoration;
  const HoverContainer({
    required this.child,
    this.decoration,
    this.hoveredDecoration,
    super.key,
  });

  @override
  State<HoverContainer> createState() => _HoverTextState();
}

class _HoverTextState extends State<HoverContainer> {
  bool isHovered = false;

  onHovered() => setState(() => isHovered = true);
  onUnHovered() => setState(() => isHovered = false);

  @override
  Widget build(BuildContext context) {
    if (!kIsWebMobile) {
      return widget.child;
    }
    return MouseRegion(
      onHover: (_) => onHovered(),
      onExit: (_) => onUnHovered(),
      child: Container(
        child: widget.child,
        decoration: isHovered ? widget.hoveredDecoration : widget.decoration,
      ),
    );
  }
}
