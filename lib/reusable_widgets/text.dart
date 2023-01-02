import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class myText extends StatelessWidget {
  final String text;
  final double size;
  final Color color;
  const myText({Key? key, required this.text, required this.size, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text, style: GoogleFonts.inter(
      color: color, fontSize: size
    ),
    );
  }
}
