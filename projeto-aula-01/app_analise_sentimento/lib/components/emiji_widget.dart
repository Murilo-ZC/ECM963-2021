import 'package:flutter/material.dart';
import 'package:flutter_emoji/flutter_emoji.dart';

class EmojiWidget extends StatelessWidget {
  final String _emojiCode;
  EmojiWidget(this._emojiCode);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        EmojiParser().get(this._emojiCode).code,
        style: TextStyle(fontSize: 48.0),
      ),
    );
  }
}
