import 'package:flutter/material.dart';
import 'package:misli_os_app/presentation/common/values/text_styles.dart';

class StatText extends StatefulWidget {
  final int count;
  final String label;
  const StatText({
    super.key,
    required this.count,
    required this.label,
  });

  @override
  State<StatText> createState() => _StatTextState();
}

class _StatTextState extends State<StatText>
    with SingleTickerProviderStateMixin {
  int count = 0;
  late AnimationController _animationController;
  late CurvedAnimation _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    _animation = CurvedAnimation(
        parent: Tween<double>(begin: 0, end: 1).animate(_animationController),
        curve: Curves.easeOut)
      ..addListener(() => setState(() {}));
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    int count = (_animation.value * widget.count).toInt();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          count.toString(),
          style: TextStyles.homeStat.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          widget.label,
          style: TextStyles.homeStat,
        ),
      ],
    );
  }
}
