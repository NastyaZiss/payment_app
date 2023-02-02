import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SizedText extends StatelessWidget {
  final String text;
  final Color color;
  const SizedText({super.key, required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    final Size textSize = _textSize(text);
    return Container(
      child: Column(children: [
        Text(
          text,
          style: TextStyle(
            fontSize: 14,
            color: color,
            fontWeight: FontWeight.w700,
          ),
          maxLines: 1,
          softWrap: false,
          overflow: TextOverflow.clip,
        ),
        SizedBox(
          height: 5,
        ),
        Row(children: [
          for (int i = 0; i < textSize.width / 5; i++)
            i.isEven
                ? Container(
                    width: 5,
                    color: Colors.white,
                    height: 2,
                  )
                : Container(
                    width: 5,
                    color: Colors.green,
                    height: 2,
                  )
        ]),
      ]),
    );
  }

  Size _textSize(String text) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(
          text: text,
          style: TextStyle(
            fontSize: 16,
            color: color,
            fontWeight: FontWeight.w700,
          )),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout(minWidth: 0, maxWidth: double.infinity);

    return textPainter.size;
  }
}
