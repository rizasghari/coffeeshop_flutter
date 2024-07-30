import 'package:flutter/material.dart';

import '../colors.dart';

class ReadMoreLessText extends StatefulWidget {
  const ReadMoreLessText({
    super.key,
    required this.text,
  });

  final String text;

  @override
  State<ReadMoreLessText> createState() => _ReadMoreLessTextState();
}

class _ReadMoreLessTextState extends State<ReadMoreLessText> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          // Adjust the duration to suit your needs
          transitionBuilder: (Widget child, Animation<double> animation) {
            return SizeTransition(sizeFactor: animation, child: child);
          },
          child: Text(
            _isExpanded ? widget.text : '${widget.text.substring(0, 150)}...',
            style: const TextStyle(color: greyLighter, fontSize: 12.0),
            key: ValueKey<bool>(_isExpanded),
          ),
        ),
        const SizedBox(height: 5.0),
        InkWell(
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
          },
          child: Text(
            _isExpanded ? 'Read less' : 'Read more',
            style: const TextStyle(color: brownNormal, fontSize: 14.0),
          ),
        ),
      ],
    );
  }
}
