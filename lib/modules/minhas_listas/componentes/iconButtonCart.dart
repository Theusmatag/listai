// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class IconCartButton extends StatefulWidget {
  final Color? color;
  final Function()? onTap;
  final IconData? icon;
  final double? heigth;
  final double? width;
  const IconCartButton({
    super.key,
    this.color,
    this.onTap,
    this.icon,
    this.heigth,
    this.width,
  });

  @override
  State<IconCartButton> createState() => _IconCartButtonState();
}

class _IconCartButtonState extends State<IconCartButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap ?? () {},
      child: Container(
        height: widget.heigth ?? 35,
        width: widget.width ?? 35,
        margin: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: widget.color ?? Color(0xff4169E1),
          borderRadius: BorderRadius.circular(5),
          boxShadow: const [
            BoxShadow(
              blurRadius: 2,
              offset: Offset(0, 2),
              color: Colors.black26,
            ),
          ],
        ),
        child: Icon(widget.icon ?? Icons.add, color: Colors.white, size: 18),
      ),
    );
  }
}
