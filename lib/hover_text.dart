import 'package:flutter/material.dart';

class HoverText extends StatefulWidget {
  final String text;

  HoverText(this.text);

  @override
  _HoverTextState createState() => _HoverTextState();
}

class _HoverTextState extends State<HoverText> {
  List<bool> _isHovered = [];

  @override
  void initState() {
    super.initState();
    _isHovered = List<bool>.filled(widget.text.length, false);
  }

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: widget.text.split('').map((char) {
          int index = widget.text.indexOf(char);
          return WidgetSpan(
            child: MouseRegion(
              onHover: (_) {
                setState(() {
                  _isHovered[index] = true;
                });
              },
              onExit: (_) {
                setState(() {
                  _isHovered[index] = false;
                });
              },
              child: Text(
                char,
                style: _isHovered[index]
                    ? TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue)
                    : TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}