import 'package:flutter/material.dart';
import 'dart:html' as html;
import 'dart:ui_web' as ui_web;

/// A widget that displays network images with better CORS handling for Flutter Web
/// Falls back to initials if image fails to load
class WebSafeNetworkImage extends StatefulWidget {
  final String imageUrl;
  final String fallbackInitials;
  final double size;
  final BoxFit fit;

  const WebSafeNetworkImage({
    super.key,
    required this.imageUrl,
    required this.fallbackInitials,
    this.size = 64,
    this.fit = BoxFit.cover,
  });

  @override
  State<WebSafeNetworkImage> createState() => _WebSafeNetworkImageState();
}

class _WebSafeNetworkImageState extends State<WebSafeNetworkImage> {
  bool _hasError = false;
  late String _viewType;

  @override
  void initState() {
    super.initState();
    _viewType = 'image-${widget.imageUrl.hashCode}';
    _registerImageView();
  }

  void _registerImageView() {
    // Register a platform view factory for the image
    // ignore: undefined_prefixed_name
    ui_web.platformViewRegistry.registerViewFactory(_viewType, (int viewId) {
      final imgElement = html.ImageElement()
        ..src = widget.imageUrl
        ..style.width = '100%'
        ..style.height = '100%'
        ..style.objectFit = 'cover'
        ..onError.listen((event) {
          if (mounted) {
            setState(() {
              _hasError = true;
            });
          }
        });
      return imgElement;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_hasError) {
      return _buildFallback();
    }

    return SizedBox(
      width: widget.size,
      height: widget.size,
      child: HtmlElementView(viewType: _viewType),
    );
  }

  Widget _buildFallback() {
    return Center(
      child: Text(
        widget.fallbackInitials,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w700,
          color: Color(0xFF3B82F6),
        ),
      ),
    );
  }
}
