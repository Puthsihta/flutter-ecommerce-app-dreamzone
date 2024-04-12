import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class HTMLView extends StatelessWidget {
  final String htmlContent;

  HTMLView({required this.htmlContent});

  @override
  Widget build(BuildContext context) {
    return Html(
      data: htmlContent,
    );
  }
}
