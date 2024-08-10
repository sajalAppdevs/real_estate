import 'package:flutter/material.dart';

class AutoExpandingText extends StatelessWidget {
  final String text;
  final TextStyle? style;
  final Duration duration;

  const AutoExpandingText({
    Key? key,
    required this.text,
    this.style,
    this.duration = const Duration(milliseconds: 500),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return _AutoExpandingText(
          text: text,
          style: style,
          duration: duration,
          maxWidth: constraints.maxWidth,
        );
      },
    );
  }
}

class _AutoExpandingText extends StatefulWidget {
  final String text;
  final TextStyle? style;
  final Duration duration;
  final double maxWidth;

  const _AutoExpandingText({
    Key? key,
    required this.text,
    this.style,
    required this.duration,
    required this.maxWidth,
  }) : super(key: key);

  @override
  State<_AutoExpandingText> createState() => __AutoExpandingTextState();
}

class __AutoExpandingTextState extends State<_AutoExpandingText>
    with SingleTickerProviderStateMixin {
  late final _controller = AnimationController(
    vsync: this,
    duration: widget.duration,
  );
  List<Animation<double>> _lineAnimations = [];
  List<String> _lines = [];

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, _calculateLines);
  }

  void _calculateLines() {
    final textPainter = TextPainter(
      text: TextSpan(text: widget.text, style: widget.style),
      textDirection: TextDirection.ltr,
      maxLines: null,
    );

    textPainter.layout(maxWidth: widget.maxWidth);

    final List<String> lines = [];
    int lastOffset = 0;
    for (var metrics in textPainter.computeLineMetrics()) {
      final end = textPainter
          .getPositionForOffset(Offset(metrics.width, metrics.baseline))
          .offset;
      if (end > lastOffset) {
        lines.add(widget.text.substring(lastOffset, end).trim());
        lastOffset = end;
      }
    }

    setState(() {
      _lines = lines;
      _lineAnimations = List.generate(
        _lines.length,
        (index) => Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: _controller,
            curve: Interval(
              index / _lines.length,
              (index + 1) / _lines.length,
              curve: Curves.easeOut,
            ),
          ),
        ),
      );
    });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        debugPrint('Building $_lines');
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(_lines.length, (index) {
            return ClipRect(
              child: Align(
                alignment: Alignment.topLeft,
                heightFactor: _lineAnimations[index].value,
                child: Text(
                  _lines[index],
                  style: widget.style,
                ),
              ),
            );
          }),
        );
      },
    );
  }
}
