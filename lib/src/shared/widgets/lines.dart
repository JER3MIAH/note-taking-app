import 'package:flutter/material.dart';

class HorizontalLine extends StatelessWidget {
  final bool hasMargin;
  const HorizontalLine({
    super.key,
    this.hasMargin = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.inversePrimary,
      margin: hasMargin ? EdgeInsets.symmetric(vertical: 5) : null,
      height: 1,
    );
  }
}

class VerticalLine extends StatelessWidget {
  final bool hasMargin;
  const VerticalLine({
    super.key,
    this.hasMargin = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.inversePrimary,
      margin: hasMargin ? EdgeInsets.symmetric(horizontal: 5) : null,
      width: 1,
    );
  }
}
