import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DisplaySelectedImages extends StatefulWidget {
  final List<Future<Uint8List>> selectedImages;

  DisplaySelectedImages({required this.selectedImages, Key? key})
      : super(key: key);

  @override
  State<DisplaySelectedImages> createState() => _DisplaySelectedImagesState();
}

class _DisplaySelectedImagesState extends State<DisplaySelectedImages> {
  int _currentImageIndex = 0;

  void _previousImage() {
    setState(() {
      _currentImageIndex =
          (_currentImageIndex - 1) % widget.selectedImages.length;
      if (_currentImageIndex < 0) {
        _currentImageIndex = widget.selectedImages.length - 1;
      }
    });
  }

  void _nextImage() {
    setState(() {
      _currentImageIndex =
          (_currentImageIndex + 1) % widget.selectedImages.length;
    });
  }

  Future<ImageProvider<Object>> _getImageProvider() async {
    return kIsWeb
        ? MemoryImage(await widget.selectedImages[_currentImageIndex])
            as ImageProvider<Object>
        : FileImage(await widget.selectedImages[_currentImageIndex] as File);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 235,
      width: 467,
      child: widget.selectedImages!.isEmpty
          ? const Center(child: Icon(Icons.image_rounded))
          : Stack(
              children: [
                FutureBuilder<ImageProvider>(
                  future: _getImageProvider(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return SizedBox(
                        height: 235,
                        width: 467,
                        child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(15)),
                          child:
                              Image(image: snapshot.data!, fit: BoxFit.cover),
                        ),
                      );
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),

                // Left button for previous image
                if (widget.selectedImages!.length > 1)
                  Positioned(
                    left: 7,
                    top: 100,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_left),
                      onPressed: _previousImage,
                      style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.white),
                      ),
                    ),
                  ),

                // Right button for next image
                if (widget.selectedImages!.length > 1)
                  Positioned(
                    right: 7,
                    top: 100,
                    child: IconButton(
                      icon: Icon(Icons.arrow_right),
                      onPressed: _nextImage,
                      style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.white54),
                      ),
                    ),
                  ),
              ],
            ),
    );
  }
}
