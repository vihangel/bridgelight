import 'dart:convert';

import 'package:flutter/material.dart';

class ImageWidget extends StatefulWidget {
  final String imageString;
  final double width;
  final double height;
  final String placeholder;
  final BorderRadius? borderRadius;
  const ImageWidget(
      {super.key,
      required this.imageString,
      this.width = 100,
      this.height = 100,
      this.placeholder = 'placeholder',
      this.borderRadius});

  @override
  State<ImageWidget> createState() => _ImageWidgetState();
}

class _ImageWidgetState extends State<ImageWidget> {
  ImageProvider _imageProvider = const AssetImage('assets/placeholder.png');
  bool _error = true;

  @override
  void initState() {
    parseImage();
    super.initState();
  }

  void parseImage() {
    try {
      final bytes = base64Decode(widget.imageString);
      final imageProvider = MemoryImage(bytes);
      setState(() {
        _imageProvider = imageProvider;
        _error = false;
      });
    } catch (e) {
      setState(() {
        _error = true;
      });
      _imageProvider = AssetImage('assets/${widget.placeholder}.png');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: widget.borderRadius ?? BorderRadius.circular(8),
      child: _error
          ? Image(
              image: _imageProvider,
              width: widget.width,
              height: widget.height,
              fit: BoxFit.cover,
            )
          : Image.network(
              'https://via.placeholder.com/150',
              width: widget.width,
              height: widget.height,
              fit: BoxFit.cover,
            ),
    );
  }
}
