// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CodeBytechButton extends StatelessWidget {
  final Widget child;
  final VoidCallback ontap;
  final Color? color;
  final double? height;
  final double? width;
  const CodeBytechButton({
    Key? key,
    required this.child,
    required this.ontap,
    this.height = 50.0,
    this.width = double.infinity,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color ?? const Color.fromARGB(255, 51, 94, 247),
          borderRadius: BorderRadius.circular(40),
        ),
        child: child,
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      ),
    );
  }
}
