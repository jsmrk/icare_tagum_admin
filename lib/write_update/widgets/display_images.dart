import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DisplaySelectedImages extends StatefulWidget {
  List<File> selectedImages = [];

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

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 235,
      width: 467,
      child: widget.selectedImages.isEmpty
          ? const Center(child: Icon(Icons.image_rounded))
          : Stack(
              children: [
                // Image widget for displaying a single images
                Container(
                  height: 235,
                  width: 467,
                  margin: const EdgeInsets.symmetric(horizontal: 1),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(15)),
                    child: kIsWeb
                        ? Image.network(
                            widget.selectedImages[_currentImageIndex].path,
                            fit: BoxFit.cover,
                          )
                        : Image.file(
                            widget.selectedImages[_currentImageIndex],
                            fit: BoxFit.cover,
                          ),
                  ),
                ),

                // Left button for previous image
                if (widget.selectedImages.length > 1)
                  Positioned(
                    left: 7,
                    top: 100,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_left),
                      onPressed: _previousImage,
                      style: const ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.white54),
                      ),
                    ),
                  ),

                // Right button for next image
                if (widget.selectedImages.length > 1)
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

                // Dots for multiple images (if needed)
                // if (widget.selectedImages.length > 1)
                //   Positioned(
                //     bottom: 11,
                //     left: 0,
                //     right: 0,
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.center,
                //       children: List.generate(
                //         widget.selectedImages.length,
                //         (index) => Container(
                //           margin: const EdgeInsets.symmetric(horizontal: 5),
                //           width: 11,
                //           height: 11,
                //           decoration: BoxDecoration(
                //             shape: BoxShape.circle,
                //             color: index == _currentImageIndex
                //                 ? Colors.green
                //                 : Colors.grey,
                //           ),
                //         ),
                //       ),
                //     ),
                //   ),
              ],
            ),
    );
  }
}
