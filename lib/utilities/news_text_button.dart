import 'package:flutter/material.dart';

class NewsTextButton extends StatelessWidget {
  final String buttonTitle;
  final Color colour;
  const NewsTextButton({
    Key? key,
    required this.buttonTitle,
    required this.colour,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        backgroundColor: colour,
      ),
      onPressed: null,
      child: Text(
        buttonTitle,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16.0,
        ),
      ),
    );
  }
}
