import 'package:flutter/material.dart';

class TextFormFieldApp extends StatefulWidget {
  final String nomeDoCampo;
  final IconData? iconeInicio;
  final IconData? iconeFim;
  const TextFormFieldApp({
    super.key,
    required this.nomeDoCampo,
    this.iconeInicio,
    this.iconeFim,
  });

  @override
  State<TextFormFieldApp> createState() => _TextFormFieldAppState();
}

class _TextFormFieldAppState extends State<TextFormFieldApp> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: widget.nomeDoCampo,
        hintStyle: TextStyle(color: Colors.white),
        prefixIcon: Icon(Icons.lock, color: Colors.white),
        fillColor: Colors.white,
        disabledBorder: OutlineInputBorder(
          // borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Colors.white),
        ),
        border: OutlineInputBorder(
          // borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: OutlineInputBorder(
          // borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: Colors.white),
        ),
        suffixIcon: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.remove_red_eye,
            color: Colors.white,
            opticalSize: 10,
          ),
        ),
      ),
    );
  }
}
